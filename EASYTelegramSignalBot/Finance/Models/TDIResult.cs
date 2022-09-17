using EASYTelegramSignalBot.Finance.Binance;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EASYTelegramSignalBot.Finance.Models
{
    public class TDIResult
    {
        public Kline Kline { get; set; }
        public double RSI { get; set; }
        public double RSI_PL { get; set; }
        public double TSL { get; set; }
        internal double RSI_MA { get; set; }
        internal double RSI_StDev { get; set; }

        public double UpVB { get; set; }
        public double DownVB { get; set; }
        public double MBL { get; set; } // Middle Votality Band
    }
}
