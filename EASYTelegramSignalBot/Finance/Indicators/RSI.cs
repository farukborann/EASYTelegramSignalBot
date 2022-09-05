//using Binance.Net.Enums;
//using Skender.Stock.Indicators;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Data;
//using EASYTelegramSignalBot.Finance.Binance;
//using System.Threading.Tasks;
//using System.Collections.ObjectModel;

//namespace EASYTelegramSignalBot.Finance.Indicators
//{
//    public class RSI
//    {
//        enum SignalType
//        {
//            Exit = 0,
//            Long = 1,
//            Short = 2,
//            None = 3
//        }

//        public string Symbol { get; set; }
//        public KlineInterval Interval { get; set; }
//        public Action Action { get; set; } // run when get signal
//        public KlineSubscription Subscription { get; set; }

//        public RSI(string symbol, KlineInterval interval, Action action)
//        {
//            Symbol = symbol;
//            Interval = interval;
//            Action = action;
//            Subscription = StaticBinance.SubscribeToKlineUpdatesAsync(
//                Helpers.SubscriptionType.UsdFutures,
//                Symbol,
//                Interval,
//                50,
//                Helpers.TriggerType.KlineUpdate,
//                data =>
//                {
//                    //Rsi 13 Periot
//                    var Rsi = data.GetRsi(14).ToList();

//                    if(Rsi.Last().Rsi > 68 || Rsi.Last().Rsi < 32)
//                    {
//                        Task.Run(() => action()).Wait();
//                        Console.WriteLine($"RSI Signal !!! => Exit");
//                    }
//                    else if (Rsi.Last().Rsi <= 68 && Rsi.Last().Rsi >= 32)
//                    {
//                        Console.WriteLine($"RSI Signal !!! => Enter");
//                    }
//                });
//        }
//    }
//}