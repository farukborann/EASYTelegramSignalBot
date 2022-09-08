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
        /* Indicator Values */

        public List<SmaResult>? FastMAResults { get; set; }
        public List<SmaResult>? SlowMAResults { get; set; }
        public List<double?>? UpVBResults { get; set; }
        public List<double?>? MiddleVBResults { get; set; }
        public List<double?>? DownVBResults { get; set; }

        private Enums.SignalType LastSignalType { get; set; }

        public TDI(string symbol, KlineInterval interval, Action<string, Dictionary<string, List<object>>> updateAction, Action<string, Enums.SignalType> signalAction)
            : base(symbol, interval, Enums.SubscriptionType.Spot, signalAction, updateAction)
        {
            LastSignalType = Enums.SignalType.None;

            TickAction = new()
            {
                KlineCount = 250,
                Creator = this,
                TriggerType = Enums.TriggerType.KlineUpdate,
                Action = Indicate
            };
            Subscribe();
        }

        private void Indicate(List<Kline> data)
        {
            //Rsi 13 Periot
            List<RsiResult>? Rsi = data.GetRsi(Settings.BotsSettings.TDISettings.RSIPeriot).ToList();

            // Moving Average of RSI 2 bars back => RSI Price Line
            List<SmaResult>? FastMA = Rsi.GetSma(Settings.BotsSettings.TDISettings.RSIPLPeriot).ToList();

            // Moving Average of RSI 7 bars back => Trend Signal Line
            List<SmaResult>? SlowMA = Rsi.GetSma(Settings.BotsSettings.TDISettings.TSLPeriot).ToList();

            // Volatility Band
            Dictionary<DateTime, double?>? MA = Rsi.GetSma(Settings.BotsSettings.TDISettings.VotalityBandPeriot).ToDictionary(x => x.Date, x => x.Sma);
            Dictionary<DateTime, double?>? StDev = Rsi.GetStdDev(Settings.BotsSettings.TDISettings.VotalityBandPeriot).ToDictionary(x => x.Date, x => x.StdDev * 1.6185);
            Dictionary<DateTime, double?>? UpVB = MA.ToDictionary(x => x.Key, x => x.Value + StDev[x.Key]); // Up Votality Band
            Dictionary<DateTime, double?>? DownVB = MA.ToDictionary(x => x.Key, x => x.Value - StDev[x.Key]); // Down Votality Band
            Dictionary<DateTime, double?>? MiddleVB = UpVB.ToDictionary(x => x.Key, x => (x.Value + DownVB[x.Key]) / 2); // Middle Votality After normalization

            /* Update Values */
            FastMAResults = FastMA;
            SlowMAResults = SlowMA;
            UpVBResults = UpVB.Values.ToList();
            MiddleVBResults = MiddleVB.Values.ToList();
            DownVBResults = DownVB.Values.ToList();

            Values = new()
                {
                    { "Klines", data.Select(x => (object?)x ?? 0).ToList().GetRange(data.Count-25,25) },
                    { "FastMA", FastMAResults.Select(x => (object?)x.Sma ?? 0).ToList().GetRange(data.Count-25,25) },
                    { "SlowMA", SlowMAResults.Select(x => (object?)x.Sma ?? 0).ToList().GetRange(data.Count-25,25) },
                    { "UpVB", UpVBResults.Select(x => x == null ? 0 : (object)x).ToList().GetRange(data.Count-25,25) },
                    { "MiddleVB", MiddleVBResults.Select(x => x == null ? 0 : (object)x).ToList().GetRange(data.Count-25,25) },
                    { "DownVB", DownVBResults.Select(x => x == null ? 0 : (object)x).ToList().GetRange(data.Count-25,25) }
                };
            //Call update action
            UpdateAction(Symbol, Values);

            Enums.SignalType RSI_PL;
            Enums.SignalType TSL;
            Enums.SignalType MBL;
            Enums.SignalType VB;

            int Last_FastMA = (int?)FastMA.Last().Sma ?? 0;
            int Last_SlowMA = (int?)SlowMA.Last().Sma ?? 0;
            int Last_Middle = (int?)MiddleVB.Last().Value ?? 0;
            int Last_Up = (int?)UpVB.Last().Value ?? 0;

            if (Last_FastMA > Settings.BotsSettings.TDISettings.RSIOverboughtLevet || Last_FastMA < Settings.BotsSettings.TDISettings.RSIOversoldLevel) RSI_PL = Enums.SignalType.Exit;
            else RSI_PL = Last_FastMA > 50 ? Enums.SignalType.Buy : Enums.SignalType.Sell;

            if (Last_FastMA == Last_SlowMA) TSL = Enums.SignalType.Exit;
            else TSL = Last_FastMA > Last_SlowMA ? Enums.SignalType.Buy : Enums.SignalType.Sell;

            if (Last_FastMA == Last_Middle) MBL = Enums.SignalType.Exit;
            else MBL = Last_FastMA > Last_Middle ? Enums.SignalType.Buy : Enums.SignalType.Sell;

            if (Last_FastMA > Last_Up) VB = Enums.SignalType.Exit;
            else VB = Last_FastMA < Last_Up ? Enums.SignalType.Buy : Enums.SignalType.Sell;

            if (RSI_PL.EqualsAll(TSL, MBL, VB))
            {
                //Call signal action
                if (RSI_PL.Equals(LastSignalType)) return;

                Task.Run(() => SignalAction(Symbol, RSI_PL));
                Console.WriteLine($"TDI Signal !!! {Symbol} => {nameof(RSI_PL)}, {Enum.GetName(typeof(Enums.SignalType), RSI_PL)}");
                LastSignalType = RSI_PL;
            }

            Console.WriteLine($"RSI PL {Symbol} => {Enum.GetName(typeof(Enums.SignalType), RSI_PL)} || TSL => {Enum.GetName(typeof(Enums.SignalType), TSL)} || MBL => {Enum.GetName(typeof(Enums.SignalType), MBL)} || VB => {Enum.GetName(typeof(Enums.SignalType), VB)}");
        }
    }
}