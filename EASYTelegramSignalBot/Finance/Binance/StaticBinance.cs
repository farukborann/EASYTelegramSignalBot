using Binance.Net.Clients;
using Binance.Net.Enums;
using EASYTelegramSignalBot.Finance.Binance;
using EASYTelegramSignalBot.Finance.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace EASYTelegramSignalBot.Finance
{
    public static class StaticBinance
    {
        public static BinanceClient Client { get; set; } = new BinanceClient();
        public static BinanceSocketClient SocketClient { get; set; } = new BinanceSocketClient();
        public static List<KlineSubscription> SubscribedKlineUpdates { get; set; } = new();
        public static ExchangeInfos ExchangeInfos { get; set; } = new(Client);

        public static KlineSubscription SubscribeToKlineUpdatesAsync(Enums.SubscriptionType subType, string symbol, KlineInterval interval, TickAction tickAction)
        {
            KlineSubscription? subscription;
            if (SubscribedKlineUpdates.Any(x => x.Symbol.ToLower().Equals(symbol.ToLower()) && x.Interval.Equals(interval)))
            {
                subscription = SubscribedKlineUpdates.First(x => x.Symbol.ToLower().Equals(symbol.ToLower()) && x.Interval.Equals(interval));
                subscription.AddAction(tickAction);
                return subscription;
            }

            subscription = new KlineSubscription(subType, symbol, interval, tickAction.KlineCount);
            subscription.AddAction(tickAction);
            SubscribedKlineUpdates.Add(subscription);
            Console.WriteLine($"Kline Subscribed => {subType}, {symbol}, {interval}");
            return subscription;
        }

        public static void DeleteAction(KlineSubscription subscription, TickAction action)
        {
            subscription.Actions.Remove(action);
            if (subscription.Actions.Count == 0)
            {
                SubscribedKlineUpdates.Remove(subscription);
                subscription.Dispose();
            }
        }
    }
}
