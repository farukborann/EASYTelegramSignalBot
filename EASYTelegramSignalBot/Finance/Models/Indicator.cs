using Binance.Net.Enums;
using EASYTelegramSignalBot.Finance.Binance;
using System;
using System.Collections.Generic;
using System.Linq;

namespace EASYTelegramSignalBot.Finance.Models
{
    public abstract class Indicator : IDisposable
    {
        private bool isDisposed;

        public enum SignalType
        {
            Exit = 0,
            Long = 1,
            Short = 2,
            Buy = 3,
            Sell = 4,
            None = 5
        }

        public string Symbol { get; set; }
        public KlineInterval Interval { get; set; }
        Helpers.SubscriptionType SubscriptionType { get; set; }
        public Action<string, SignalType> SignalAction { get; set; } // run when get signal
        public Action<string, Dictionary<string, List<object>>> UpdateAction { get; set; } // run when get every update
        public KlineSubscription? Subscription { get; set; }
        public TickAction? TickAction { get; set; }

        public Dictionary<string, List<object>>? Values { get; set; } // Send parameter  in update action

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (isDisposed) return;

            if (Subscription == null) return;
            var func = Subscription.Actions.First(x => x.Creator == this);
            Subscription.Actions.Remove(func);

            isDisposed = true;
        }

        protected Indicator(string symbol, KlineInterval interval, Helpers.SubscriptionType subscriptionType, Action<string, SignalType> signalAction, Action<string, Dictionary<string, List<object>>> updateAction)
        {
            Symbol = symbol;
            SubscriptionType = subscriptionType;
            Interval = interval;
            SignalAction = signalAction;
            UpdateAction = updateAction;
        }

        public void Subscribe()
        {
            if (TickAction == null) return;
            Subscription = StaticBinance.SubscribeToKlineUpdatesAsync(
                SubscriptionType,
                Symbol,
                Interval,
                TickAction);
        }
    }
}
