using Binance.Net.Enums;
using EASYTelegramSignalBot.Finance.Binance;
using System;
using System.Collections.Generic;
using System.Linq;

namespace EASYTelegramSignalBot.Finance.Models
{
    public abstract class Indicator : IDisposable
    {
        public enum SignalType
        {
            Exit = 0,
            Long = 1,
            Short = 2,
            Buy = 3,
            Sell = 4,
            None = 5
        }
        public string IndicatorKey { get; set; }
        public string Symbol { get; set; }
        public KlineInterval Interval { get; set; }
        public Action<string, SignalType> SignalAction { get; set; } // run when get signal
        public Action<string, Dictionary<string, List<object>>> UpdateAction { get; set; } // run when get every update
        public KlineSubscription Subscription { get; set; }

       public Dictionary<string, List<object>> Values { get; set; } // Send parameter  in update action

        public void Dispose()
        {
            var func = Subscription.Actions.First(x => x.Creator == this);
            Subscription.Actions.Remove(func);
        }
    }
}
