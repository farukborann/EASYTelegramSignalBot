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
        internal bool isPaused;

        public string Symbol { get; set; }
        public KlineInterval Interval { get; set; }
        private Enums.SubscriptionType SubscriptionType { get; set; }
        public Action<string, Dictionary<string, List<object>>, Enums.SignalType> SignalAction { get; set; } // run when get signal
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
            TickAction? func = Subscription.Actions.First(x => x.Creator == this);
            StaticBinance.DeleteAction(Subscription, func);

            isDisposed = true;
        }

        protected Indicator(string symbol, KlineInterval interval, Enums.SubscriptionType subscriptionType, Action<string, Dictionary<string, List<object>>, Enums.SignalType> signalAction, Action<string, Dictionary<string, List<object>>> updateAction, bool isPaused = false)
        {
            if ((subscriptionType == Enums.SubscriptionType.Spot && !StaticBinance.ExchangeInfos.Spot.ToList().Any(x => x.Name.Equals(symbol))) ||
                (subscriptionType == Enums.SubscriptionType.UsdFutures && !StaticBinance.ExchangeInfos.Usdt.Any(x => x.Name.ToLower().Equals(symbol.ToLower()))) ||
                (subscriptionType == Enums.SubscriptionType.CoinFutures && !StaticBinance.ExchangeInfos.Coin.Any(x => x.Name.ToLower().Equals(symbol.ToLower()))))
            {
                throw new Exceptions.SymbolNotFoundException("Böyle bir sembol bulunamadı!");
            }

            Symbol = symbol;
            SubscriptionType = subscriptionType;
            Interval = interval;
            SignalAction = signalAction;
            UpdateAction = updateAction;
            this.isPaused = isPaused;
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

        public void ChangeInterval(KlineInterval klineInterval)
        {
            if (Subscription == null) return;
            Interval = klineInterval;
            TickAction? func = Subscription.Actions.First(x => x.Creator == this);
            StaticBinance.DeleteAction(Subscription, func);

            Subscribe();
        }

        public void Continue()
        {
            isPaused = false;
        }

        public void Pause()
        {
            isPaused = true;
        }

    }
}
