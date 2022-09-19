using EASYTelegramSignalBot.Finance.Binance;
using EASYTelegramSignalBot.Finance.Models;
using System.Collections.Generic;

namespace EASYTelegramSignalBot.Finance.Indicators.PAC
{
    public class PACResult : IndicatorResult
    {
        public override List<Kline> Klines { get; set; }
        public List<double> TOC { get; set; }
        public List<double> BOC { get; set; }
    }
}
