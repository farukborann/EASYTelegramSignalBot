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
    public class RSI : Models.Indicator
    {
        /* Indicator Values */
        public List<RsiResult>? RSIResults { get; set; }

        private Enums.SignalType LastSignalType { get; set; }
        private DateTime LastSignalTime { get; set; }

        public RSI(string symbol, KlineInterval interval, Action<string, Dictionary<string, List<object>>> updateAction, Action<string, Enums.SignalType> signalAction, bool isPaused = false)
            : base(symbol, interval, Enums.SubscriptionType.Spot, signalAction, updateAction, isPaused)
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
            if (isPaused) return;
            if (LastSignalTime.AddSeconds(Settings.BotsSettings.RSISettings.MinSignalPeriot) > DateTime.Now) return;

            //Rsi 13 Periot
            List<RsiResult>? Rsi = data.GetRsi(Settings.BotsSettings.TDISettings.RSIPeriot).ToList();

            /* Update Values */
            RSIResults = Rsi;

            Values = new()
                {
                    { "Klines", data.Select(x => (object?)x ?? 0).ToList().GetRange(data.Count-25,25) },
                    { "RSI", RSIResults.Select(x => (object?)x.Rsi ?? 0).ToList().GetRange(data.Count-25,25) },
                };
            //Call update action
            UpdateAction(Symbol, Values);

            Enums.SignalType RSI;

            int Last_RSI = (int?)Rsi.Last().Rsi ?? 0;

            if (Last_RSI > Settings.BotsSettings.RSISettings.RSIOverboughtLevet) RSI = Enums.SignalType.UpperLine;
            else if (Last_RSI < Settings.BotsSettings.RSISettings.RSIOversoldLevel) RSI = Enums.SignalType.UnderLine;
            else RSI = Enums.SignalType.BetweenLines;

            Console.WriteLine($"{Symbol} RSI => {Enum.GetName(typeof(Enums.SignalType), RSI)}");

            //Call signal action
            if (RSI.Equals(LastSignalType)) return;
            if(LastSignalType == Enums.SignalType.None)
            {
                LastSignalType = RSI;
                return;
            }

            Task.Run(() => SignalAction(Symbol, RSI));
            Console.WriteLine($"RSI Signal !!! {Symbol} => {Enum.GetName(typeof(Enums.SignalType), RSI)}");
            LastSignalType = RSI;
            LastSignalTime = DateTime.Now;

        }
    }
}