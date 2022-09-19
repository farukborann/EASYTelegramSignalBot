using EASYTelegramSignalBot.Finance.Binance;
using System.Collections.Generic;

namespace EASYTelegramSignalBot.Finance.Models
{
    public abstract class IndicatorResult
    {
        public abstract List<Kline> Klines { get; set; }
    }
}
