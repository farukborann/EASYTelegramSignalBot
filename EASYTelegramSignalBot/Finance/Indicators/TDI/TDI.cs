using Binance.Net.Enums;
using EASYTelegramSignalBot.Finance.Binance;
using EASYTelegramSignalBot.Finance.Models;
using Skender.Stock.Indicators;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace EASYTelegramSignalBot.Finance.Indicators.TDI
{
    public class TDI : Indicator<TDIResult>
    {
        private Enums.SignalType LastSignalType { get; set; }
        private DateTime LastSignalTime { get; set; }

        private double? LastBuySignalClose { get; set; }

        public TDI(string symbol, KlineInterval interval, Action<string, TDIResult> updateAction, Action<string, TDIResult, Enums.SignalType> signalAction, bool isPaused = false)
            : base(symbol, interval, Enums.SubscriptionType.Spot, signalAction, updateAction, isPaused)
        {
            LastSignalType = Enums.SignalType.None;

            _TickAction = new()
            {
                KlineCount = 3000,
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

            /* Update Values */

            Values = new()
            {
                Klines = data.GetRange(data.Count - 25, 25),
                RSI = Rsi.Select(x => x.Rsi ?? 0).ToList().GetRange(data.Count - 25, 25),
                RSI_PL = RSI_PL.Select(x => x.Value).ToList().GetRange(data.Count - 25, 25),
                TSL = TSL.Select(x => x.Value).ToList().GetRange(data.Count - 25, 25)
            };

            //Call update action
            UpdateAction(Symbol, Values);

            Enums.SignalType Signal = Enums.SignalType.None;

            double difference = 0.50;

            if (IsLinesCrossing(RSI_PL.ElementAt_Last(2).Value, RSI_PL.ElementAt_Last(1).Value, TSL.ElementAt_Last(2).Value, TSL.ElementAt_Last(1).Value) &&
                RSI_PL.ElementAt_Last(1).Value - TSL.ElementAt_Last(1).Value > difference)
            {
                Signal = Enums.SignalType.MediumBuy;
            }
            else if (IsLinesCrossing(RSI_PL.ElementAt_Last(2).Value, RSI_PL.ElementAt_Last(1).Value, TSL.ElementAt_Last(2).Value, TSL.ElementAt_Last(1).Value, true) &&
                    TSL.ElementAt_Last(1).Value - RSI_PL.ElementAt_Last(1).Value > difference)
            {
                Signal = Enums.SignalType.MediumSell;
            }

            if (LastSignalTime.AddHours(2) <= DateTime.Now && Signal == LastSignalType)
            {
                if (LastSignalType == Enums.SignalType.MediumBuy) Signal = Enums.SignalType.StrongBuy;
                else if (LastSignalType == Enums.SignalType.MediumSell) Signal = Enums.SignalType.StrongSell;
            }

            if (LastSignalType == Enums.SignalType.None) LastSignalType = Signal;
            if (!IsSignalEquals(LastSignalType, Signal) && Signal != Enums.SignalType.None)
            {
                //Add signal action values
                IEnumerable<BollingerBandsResult>? BB = data.GetBollingerBands();
                Values.UpperBB = BB.Select(x => x.UpperBand ?? 0).ToList().GetRange(data.Count - 25, 25);
                Values.LowerBB = BB.Select(x => x.LowerBand ?? 0).ToList().GetRange(data.Count - 25, 25);

                Values.SMA25 = data.GetSma(25).Select(x => x.Sma ?? 0).ToList().GetRange(data.Count - 25, 25);
                Values.SMA50 = data.GetSma(50).Select(x => x.Sma ?? 0).ToList().GetRange(data.Count - 25, 25);
                Values.SMA75 = data.GetSma(75).Select(x => x.Sma ?? 0).ToList().GetRange(data.Count - 25, 25);
                Values.SMA100 = data.GetSma(100).Select(x => x.Sma ?? 0).ToList().GetRange(data.Count - 25, 25);

                Values.PivotPoints = data.GetPivotPoints(PeriodSize.Day, PivotPointType.Woodie).Select(x => new Dictionary<string, double>()
                {
                    { "R4", (double?)x.R4 ?? 0},
                    { "R3", (double?)x.R3 ?? 0},
                    { "R2", (double?)x.R2 ?? 0},
                    { "R1", (double?)x.R1 ?? 0},
                    { "PP", (double?)x.PP ?? 0},
                    { "S1", (double?)x.S1 ?? 0},
                    { "S2", (double?)x.S2 ?? 0},
                    { "S3", (double?)x.S3 ?? 0},
                    { "S4", (double?)x.S4 ?? 0},
                }).ToList().GetRange(data.Count - 25, 25);

                Values.LastBuySignalClose = LastBuySignalClose;

                //Call signal action
                Task.Run(() => SignalAction(Symbol, Values, Signal));
                Console.WriteLine($"TDI Signal !!! {Symbol} => {Enum.GetName(typeof(Enums.SignalType), Signal)}");
                LastSignalType = Signal;
                LastSignalTime = DateTime.Now;
                if (LastSignalType == Enums.SignalType.MediumBuy) LastBuySignalClose = (double)data.Last().Close;
            }

            Console.WriteLine($"{Symbol} TDI => {Enum.GetName(typeof(Enums.SignalType), Signal)}");
        }

        private bool IsLinesCrossing(double line1_start, double line1_end, double line2_start, double line2_end, bool UpToDown = false)
        {
            if (UpToDown) return line1_start > line2_start && line2_end > line1_end;
            return line2_start > line1_start && line1_end > line2_end;
        }

        private bool IsSignalEquals(Enums.SignalType lastSignal, Enums.SignalType newSignal)
        {
            if (lastSignal == newSignal) return true;
            else if ((lastSignal == Enums.SignalType.StrongBuy || lastSignal == Enums.SignalType.MediumBuy) && (newSignal == Enums.SignalType.StrongBuy || newSignal == Enums.SignalType.MediumBuy)) return true;
            else if ((lastSignal == Enums.SignalType.StrongSell || lastSignal == Enums.SignalType.MediumSell) && (newSignal == Enums.SignalType.StrongSell || newSignal == Enums.SignalType.MediumSell)) return true;
            return false;
        }
    }
}