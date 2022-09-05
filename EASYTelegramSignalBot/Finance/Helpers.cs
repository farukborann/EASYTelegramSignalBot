using Binance.Net.Interfaces;
using EASYTelegramSignalBot.Finance.Binance;
using System.Collections.Generic;
using System.Linq;

namespace EASYTelegramSignalBot.Finance
{
    public static class Helpers
    {
        public static List<Kline> ToKlines(this IEnumerable<IBinanceKline> binanceKlines)
        {
            return binanceKlines.ToList().Select(x => x.ToKline()).ToList();
        }

        public static Kline ToKline(this IBinanceKline binanceKline)
        {
            Kline kline = new()
            {
                _OpenDate = binanceKline.OpenTime,
                _CloseDate = binanceKline.CloseTime,
                _Open = binanceKline.OpenPrice,
                _High = binanceKline.HighPrice,
                _Low = binanceKline.LowPrice,
                _Close = binanceKline.ClosePrice,
                _Volume = binanceKline.QuoteVolume,
            };
            return kline;
        }

        public enum TriggerType
        {
            KlineClose = 0,
            KlineUpdate = 1,
            KlineOpen = 2
        }

        public enum SubscriptionType
        {
            UsdFutures = 0,
            CoinFutures = 1,
            Spot = 2
        }
    }
}
