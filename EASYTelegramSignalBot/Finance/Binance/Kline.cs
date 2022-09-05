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

        public DateTime _OpenDate{ get { return __OpenDate; } set { __OpenDate = value; } }
        public DateTime _CloseDate{ get { return __CloseDate; } set { __CloseDate = value; } }
        public decimal _Open { get { return __Open; } set { __Open = value; } }
        public decimal _High{ get { return __High; } set { __High = value; } }
        public decimal _Low{ get { return __Low; } set { __Low = value; } }
        public decimal _Close{ get { return __Close; } set { __Close = value; } }
        public decimal _Volume{ get { return __Volume; } set { __Volume = value; } }

        //IQuote Parts
        public DateTime Date { get { return _OpenDate; } set { _OpenDate = value; } }
        public decimal Open { get { return _Open; } set { _Open = value; } }
        public decimal High { get { return _High; } set { _High = value; } }
        public decimal Low { get { return _Low; } set { _Low = value; } }
        public decimal Close { get { return _Close; } set { _Close = value; } }
        public decimal Volume { get { return _Volume; } set { _Volume = value; } }
    }
}
