using EASYTelegramSignalBot.Finance.Binance;
using EASYTelegramSignalBot.Finance.Models;
using System.Collections.Generic;

namespace EASYTelegramSignalBot.Finance.Indicators.RSI
{
    public class RSIResult : IndicatorResult
    {
        public override List<Kline> Klines { get; set; }
        public List<double> RSI { get; set; }
    }
}
