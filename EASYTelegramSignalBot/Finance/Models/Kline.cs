using Skender.Stock.Indicators;
using System;

namespace EASYTelegramSignalBot.Finance.Binance
{
    public class Kline : IQuote
    {
        private DateTime __OpenDate { get; set; }
        private DateTime __CloseDate { get; set; }
        private decimal __Open { get; set; }
        private decimal __High { get; set; }
        private decimal __Low { get; set; }
        private decimal __Close { get; set; }
        private decimal __Volume { get; set; }

        public DateTime _OpenDate { get => __OpenDate; set => __OpenDate = value; }
        public DateTime _CloseDate { get => __CloseDate; set => __CloseDate = value; }
        public decimal _Open { get => __Open; set => __Open = value; }
        public decimal _High { get => __High; set => __High = value; }
        public decimal _Low { get => __Low; set => __Low = value; }
        public decimal _Close { get => __Close; set => __Close = value; }
        public decimal _Volume { get => __Volume; set => __Volume = value; }

        //IQuote Parts
        public DateTime Date { get => _OpenDate; set => _OpenDate = value; }
        public decimal Open { get => _Open; set => _Open = value; }
        public decimal High { get => _High; set => _High = value; }
        public decimal Low { get => _Low; set => _Low = value; }
        public decimal Close { get => _Close; set => _Close = value; }
        public decimal Volume { get => _Volume; set => _Volume = value; }

        public bool IsBullCandle { 
            get
            {
                return Close > Open;
            }
        }
    }
}
