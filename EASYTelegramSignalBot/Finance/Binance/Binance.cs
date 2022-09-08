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

        public static KlineSubscription SubscribeToKlineUpdatesAsync(Enums.SubscriptionType subType, string symbol, KlineInterval interval, TickAction tickAction)
        {
            try /*********** fix */
            {
                KlineSubscription? subscription = SubscribedKlineUpdates.First(x => x.Symbol.ToLower().Equals(symbol.ToLower()) && x.Interval.Equals(interval));
                subscription.AddAction(tickAction);
                return subscription;
            }
            catch (InvalidOperationException)
            {
                KlineSubscription? subscription = new KlineSubscription(subType, symbol, interval, tickAction.KlineCount);
                subscription.AddAction(tickAction);
                SubscribedKlineUpdates.Add(subscription);
                return subscription;
            }
        }
    }
}
