using Binance.Net.Enums;
using Skender.Stock.Indicators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using EASYTelegramSignalBot.Finance.Binance;
using System.Threading.Tasks;
using EASYTelegramSignalBot.Finance.Models;

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

        public TDI(string symbol, KlineInterval interval, Action<string, Dictionary<string, List<object>>> updateAction, Action<string, SignalType> signalAction)
            : base(symbol, interval, Helpers.SubscriptionType.Spot, signalAction, updateAction)
        {
            TickAction = new()
            {
                KlineCount = 250,
                Creator = this,
                TriggerType = Helpers.TriggerType.KlineUpdate,
                Action = Indicate
            };
            Subscribe();
        }

        private void Indicate(List<Kline> data)
        {
            //Rsi 13 Periot
            var Rsi = data.GetRsi(13).ToList();

            // Moving Average of RSI 2 bars back => RSI Price Line
            var FastMA = Rsi.GetSma(2).ToList();

            // Moving Average of RSI 7 bars back => Trend Signal Line
            var slowMA = Rsi.GetSma(7).ToList();

            // Volatility Band
            var ma = Rsi.GetSma(34).ToDictionary(x => x.Date, x => x.Sma);
            var stdev = Rsi.GetStdDev(34).ToDictionary(x => x.Date, x => x.StdDev * 1.6185);
            var up = ma.ToDictionary(x => x.Key, x => x.Value + stdev[x.Key]); // Up Votality Band
            var dn = ma.ToDictionary(x => x.Key, x => x.Value - stdev[x.Key]); // Down Votality Band

            var mdl = up.ToDictionary(x => x.Key, x => (x.Value + dn[x.Key]) / 2); // Middle Votality After normalization

            /* Update Values */
            FastMAResults = FastMA;
            SlowMAResults = slowMA;
            UpVBResults = up.Values.ToList();
            MiddleVBResults = mdl.Values.ToList();
            DownVBResults = dn.Values.ToList();

            Values = new()
                {
                    { "Klines", data.Select(x => (object?)x ?? 0).ToList().GetRange(data.Count-25,25) },
                    { "FastMA", FastMAResults.Select(x => (object?)x.Sma ?? 0).ToList().GetRange(data.Count-25,25) },
                    { "SlowMA", SlowMAResults.Select(x => (object?)x.Sma ?? 0).ToList().GetRange(data.Count-25,25) },
                    { "UpVB", UpVBResults.Select(x => x == null ? 0 : (object)x.Value ?? 0).ToList().GetRange(data.Count-25,25) },
                    { "MiddleVB", MiddleVBResults.Select(x => x == null ? 0 : (object)x.Value ?? 0).ToList().GetRange(data.Count-25,25) },
                    { "DownVB", DownVBResults.Select(x => x == null ? 0 : (object)x.Value ?? 0).ToList().GetRange(data.Count-25,25) }
                };
            //Call update action
            UpdateAction(Symbol, Values);

            SignalType RSI_PL;
            if (FastMA.Last().Sma > 68 || FastMA.Last().Sma < 32) RSI_PL = SignalType.Exit;
            else if (FastMA.Last().Sma > 50) RSI_PL = SignalType.Long;
            else RSI_PL = SignalType.Short;

            SignalType TSL;
            if ((int)(FastMA.Last().Sma ?? 0) == (int)(slowMA.Last().Sma ?? 0)) TSL = SignalType.Exit;
            else if ((int)(FastMA.Last().Sma ?? 0) > (int)(slowMA.Last().Sma ?? 0)) TSL = SignalType.Long;
            else TSL = SignalType.Short;

            SignalType MBL;
            if ((int)(FastMA.Last().Sma ?? 0) == (int)(mdl.Last().Value ?? 0)) MBL = SignalType.Exit;
            else if ((int)(FastMA.Last().Sma ?? 0) > (int)(mdl.Last().Value ?? 0)) MBL = SignalType.Long;
            else MBL = SignalType.Short;

            SignalType VB;
            if ((int)(FastMA.Last().Sma ?? 0) > (int)(up.Last().Value ?? 0)) VB = SignalType.Exit;
            else if ((int)(FastMA.Last().Sma ?? 0) < (int)(dn.Last().Value ?? 0)) VB = SignalType.Long;
            else VB = SignalType.Short;

            if (RSI_PL == TSL && RSI_PL == MBL && RSI_PL == VB)
            {
                //Call signal action
                Task.Run(() => SignalAction(Symbol, RSI_PL));
                Console.WriteLine($"TDI Signal !!! {Symbol} => {nameof(RSI_PL)}, {Enum.GetName(typeof(SignalType), RSI_PL)}");
            }
            else
            {
                Console.WriteLine($"RSI PL {Symbol} => {Enum.GetName(typeof(SignalType), RSI_PL)} || TSL => {Enum.GetName(typeof(SignalType), TSL)} || MBL => {Enum.GetName(typeof(SignalType), MBL)} || VB => {Enum.GetName(typeof(SignalType), VB)}");
            }
        }
    }
}