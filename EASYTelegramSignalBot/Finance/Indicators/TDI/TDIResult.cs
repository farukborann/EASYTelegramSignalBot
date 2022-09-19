using EASYTelegramSignalBot.Finance.Binance;
using EASYTelegramSignalBot.Finance.Models;
using System.Collections.Generic;

namespace EASYTelegramSignalBot.Finance.Indicators.TDI
{
    public class TDIResult : IndicatorResult
    {
        public override List<Kline> Klines { get; set; }
        public double? LastBuySignalClose { get; set; }
        public List<double> RSI { get; set; }
        public List<double> RSI_PL { get; set; }
        public List<double> TSL { get; set; }

        public List<double> SMA25 { get; set; }
        public List<double> SMA50 { get; set; }
        public List<double> SMA75 { get; set; }
        public List<double> SMA100 { get; set; }


        public List<double> UpperBB { get; set; }
        public List<double> LowerBB { get; set; }
        public List<Dictionary<string, double>> PivotPoints { get; set; }
    }
}
