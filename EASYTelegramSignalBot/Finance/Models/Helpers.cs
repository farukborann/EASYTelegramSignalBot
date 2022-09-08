using Binance.Net.Interfaces;
using EASYTelegramSignalBot.Finance.Binance;
using System.Collections.Generic;
using System.Linq;

namespace EASYTelegramSignalBot.Finance.Models
{
    public static class Helpers
    {
        public static bool EqualsAll<T>(this T subject, params T[] values)
        {
            return values == null || values.Length == 0 || values.All(v => v?.Equals(subject) ?? false);
        }

        public static List<Kline> ToKlines(this IEnumerable<IBinanceKline> binanceKlines)
        {
            return binanceKlines.Select(x => x.ToKline()).ToList();
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
    }
}
