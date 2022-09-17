using Binance.Net.Enums;
using EASYTelegramSignalBot.Finance.Binance;
using EASYTelegramSignalBot.Finance.Models;
using Skender.Stock.Indicators;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace EASYTelegramSignalBot.Finance.Indicators
{
    public class TDI : Models.Indicator
    {
        private Enums.SignalType LastSignalType { get; set; }
        private DateTime LastSignalTime { get; set; }

        public TDI(string symbol, KlineInterval interval, Action<string, Dictionary<string, List<object>>> updateAction, Action<string, Dictionary<string, List<object>>, Enums.SignalType> signalAction, bool isPaused = false)
            : base(symbol, interval, Enums.SubscriptionType.Spot, signalAction, updateAction, isPaused)
        {
            LastSignalType = Enums.SignalType.None;

            TickAction = new()
            {
                KlineCount = 1000,
                Creator = this,
                TriggerType = Enums.TriggerType.KlineUpdate,
                Action = Indicate
            };
            Subscribe();
            this.isPaused = isPaused;
        }

        private void Indicate(List<Kline> data)
        {
            if (isPaused) return;
            if (LastSignalTime.AddSeconds(Settings.BotsSettings.TDISettings.MinSignalPeriot) > DateTime.Now) return;

            //Rsi 13 Periot
            List<RsiResult>? Rsi = data.GetRsi(Settings.BotsSettings.TDISettings.RSIPeriot).ToList();

            // Moving Average of RSI 2 bars back => RSI Price Line
            Dictionary<DateTime, double>? RSI_PL = Rsi.GetSma(Settings.BotsSettings.TDISettings.RSIPLPeriot).ToDictionary(x => x.Date, x => x.Sma ?? 0);

            // Moving Average of RSI 7 bars back => Trend Signal Line
            Dictionary<DateTime, double>? TSL = Rsi.GetSma(Settings.BotsSettings.TDISettings.TSLPeriot).ToDictionary(x => x.Date, x => x.Sma ?? 0);

            // Volatility Band
            Dictionary<DateTime, double>? MA = Rsi.GetSma(Settings.BotsSettings.TDISettings.VotalityBandPeriot).ToDictionary(x => x.Date, x => x.Sma ?? 0);
            Dictionary<DateTime, double>? StDev = Rsi.GetStdDev(Settings.BotsSettings.TDISettings.VotalityBandPeriot).ToDictionary(x => x.Date, x => x.StdDev * 1.6185 ?? 0);
            Dictionary<DateTime, double>? UpVB = MA.ToDictionary(x => x.Key, x => x.Value + StDev[x.Key]); // Up Votality Band
            Dictionary<DateTime, double>? DownVB = MA.ToDictionary(x => x.Key, x => x.Value - StDev[x.Key]); // Down Votality Band
            Dictionary<DateTime, double>? MBL = UpVB.ToDictionary(x => x.Key, x => (x.Value + DownVB[x.Key]) / 2); // Middle Votality 

            /* Update Values */

            Values = new()
                {
                    { "Klines", data.Select(x => (object)x).ToList().GetRange(data.Count-25,25) },
                    { "FastMA", RSI_PL.Select(x => (object)x.Value).ToList().GetRange(data.Count-25,25) },
                    { "SlowMA", TSL.Select(x => (object)x.Value).ToList().GetRange(data.Count-25,25) },
                    { "UpVB", UpVB.Select(x => (object)x.Value).ToList().GetRange(data.Count-25,25) },
                    { "DownVB", DownVB.Select(x => (object)x.Value).ToList().GetRange(data.Count-25,25) },
                    { "MiddleVB", MBL.Select(x => (object)x.Value).ToList().GetRange(data.Count-25,25) }
                };
            //Call update action
            UpdateAction(Symbol, Values);

            Enums.SignalType Signal = Enums.SignalType.None;

            double difference = 0.50;

            if(IsLinesCrossing(RSI_PL.ElementAt_Last(2).Value, RSI_PL.ElementAt_Last(1).Value, TSL.ElementAt_Last(2).Value, TSL.ElementAt_Last(1).Value) &&
                RSI_PL.ElementAt_Last(1).Value - TSL.ElementAt_Last(1).Value > difference)
            {
                if (IsLinesCrossing(RSI_PL.ElementAt_Last(2).Value, RSI_PL.ElementAt_Last(1).Value, MBL.ElementAt_Last(2).Value, MBL.ElementAt_Last(1).Value) &&
                    RSI_PL.ElementAt_Last(1).Value - MBL.ElementAt_Last(1).Value > difference)
                {
                    Signal = Enums.SignalType.StrongBuy;
                }
                else
                {
                    Signal = Enums.SignalType.MediumBuy;
                }
            }
            else if (IsLinesCrossing(RSI_PL.ElementAt_Last(2).Value, RSI_PL.ElementAt_Last(1).Value, TSL.ElementAt_Last(2).Value, TSL.ElementAt_Last(1).Value, true) &&
                    TSL.ElementAt_Last(1).Value - RSI_PL.ElementAt_Last(1).Value > difference)
            {
                if (IsLinesCrossing(RSI_PL.ElementAt_Last(2).Value, RSI_PL.ElementAt_Last(1).Value, MBL.ElementAt_Last(2).Value, MBL.ElementAt_Last(1).Value, true) &&
                    MBL.ElementAt_Last(1).Value - RSI_PL.ElementAt_Last(1).Value > difference)
                {
                    Signal = Enums.SignalType.StrongSell;
                }
                else
                {
                    Signal = Enums.SignalType.MediumSell;
                }
            }

            if(LastSignalType == Enums.SignalType.None) LastSignalType = Signal;
            if (Signal != LastSignalType && Signal != Enums.SignalType.None)
            {
                //Call signal action
                Task.Run(() => SignalAction(Symbol, Values, Signal));
                Console.WriteLine($"TDI Signal !!! {Symbol} => {Enum.GetName(typeof(Enums.SignalType), Signal)}");
                LastSignalType = Signal;
                LastSignalTime = DateTime.Now;
            }

            Console.WriteLine($"{Symbol} TDI => {Enum.GetName(typeof(Enums.SignalType), Signal)}");
        }

        private bool IsLinesCrossing(double line1_start, double line1_end, double line2_start, double line2_end, bool UpToDown = false)
        {
            if (UpToDown) return (line1_start > line2_start && line2_end > line1_end);
            return (line2_start > line1_start && line1_end > line2_end);
        }
    }
}