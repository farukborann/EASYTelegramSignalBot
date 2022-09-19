using Binance.Net.Enums;
using EASYTelegramSignalBot.Finance.Binance;
using EASYTelegramSignalBot.Finance.Models;
using Skender.Stock.Indicators;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace EASYTelegramSignalBot.Finance.Indicators.PAC
{
    public class PAC : Indicator<PACResult>
    {
        /* Indicator Values */
        public List<SmmaResult>? TopOfChannel { get; set; }
        public List<SmmaResult>? BottomOfChannel { get; set; }

        private Enums.SignalType LastSignalType { get; set; }
        private DateTime LastSignalTime { get; set; }

        public PAC(string symbol, KlineInterval interval, Action<string, PACResult> updateAction, Action<string, PACResult, Enums.SignalType> signalAction, bool isPaused = false)
            : base(symbol, interval, Enums.SubscriptionType.Spot, signalAction, updateAction, isPaused)
        {
            LastSignalType = Enums.SignalType.None;

            _TickAction = new()
            {
                KlineCount = 1000,
                //Creator = this,
                TriggerType = Enums.TriggerType.KlineClose,
                Action = Indicate
            };
            Subscribe();
            this.isPaused = isPaused;
        }

        private void Indicate(List<Kline> data)
        {
            if (isPaused) return;
            if (LastSignalTime.AddSeconds(Settings.BotsSettings.PACSettings.MinSignalPeriot) > DateTime.Now) return;

            //5 Periot Smoothed MA
            //High
            List<SmmaResult>? topOfChannel = data.Use(CandlePart.High).GetSmma(5).ToList();
            //Low
            List<SmmaResult>? bottomOfChannel = data.Use(CandlePart.Low).GetSmma(5).ToList();

            /* Update Values */
            TopOfChannel = topOfChannel;
            BottomOfChannel = bottomOfChannel;

            Values = new()
            {
                Klines = data.GetRange(data.Count - 25, 25),
                TOC = TopOfChannel.Select(x => x.Smma ?? 0).ToList().GetRange(data.Count - 25, 25),
                BOC = BottomOfChannel.Select(x => x.Smma ?? 0).ToList().GetRange(data.Count - 25, 25)
            };

            //Call update action
            UpdateAction(Symbol, Values);

            decimal Last_Close = data.Last().Close;
            decimal Last_TOC = (int?)TopOfChannel.Last().Smma ?? 0;
            decimal Last_BOC = (int?)BottomOfChannel.Last().Smma ?? 0;

            Enums.SignalType ChannelSignal = Last_Close > Last_TOC ? Enums.SignalType.Long : Last_Close < Last_BOC ? Enums.SignalType.Short : Enums.SignalType.Exit;

            Console.WriteLine($"{Symbol} PAC => {Enum.GetName(typeof(Enums.SignalType), ChannelSignal)}");

            if (ChannelSignal.Equals(LastSignalType)) return;
            if (LastSignalType == Enums.SignalType.None)
            {
                LastSignalType = ChannelSignal;
                return;
            }

            //Call signal action
            Task.Run(() => SignalAction(Symbol, Values, ChannelSignal));
            Console.WriteLine($"PAC Signal !!! {Symbol} => {Enum.GetName(typeof(Enums.SignalType), ChannelSignal)}");
            LastSignalType = ChannelSignal;
            LastSignalTime = DateTime.Now;
        }
    }
}