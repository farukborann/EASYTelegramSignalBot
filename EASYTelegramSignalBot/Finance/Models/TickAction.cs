using EASYTelegramSignalBot.Finance.Binance;
using System;
using System.Collections.Generic;
using static EASYTelegramSignalBot.Finance.Helpers;

namespace EASYTelegramSignalBot.Finance.Models
{
    public class TickAction
    {
        public Indicator Creator { get; set; }
        public Action<List<Kline>> Action { get; set; }
        public TriggerType TriggerType { get; set; }
        public int KlineCount { get; set; }
    }
}
