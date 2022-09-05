//using Skender.Stock.Indicators;
//using Binance.Net.Enums;
//using System;
//using System.Linq;

//namespace EASYTelegramSignalBot.Finance.Indicators
//{
//    public class PAC
//    {
//        public string Symbol { get; set; }
//        public KlineInterval Interval { get; set; }
//         public Action Action { get; set; } // run when get signal

//        public PAC(string symbol, KlineInterval interval, Action action)
//        {
//            Symbol = symbol;
//            Interval = interval;
//            Action = action;
//            StaticBinance.SubscribeToKlineUpdatesAsync(
//                Helpers.SubscriptionType.UsdFutures,
//                Symbol, 
//                Interval,
//                10500,
//                Helpers.TriggerType.KlineClose,
//                data =>
//                {
//                    var HighSMMAs = data.Use(CandlePart.High).GetSmma(5).ToList();
//                    var LowSMMAs = data.Use(CandlePart.Low).GetSmma(5).ToList();

//                    if ((double)data[^1].Close > (HighSMMAs.Last().Smma ?? 0))
//                    {
//                        //call act
//                        Console.WriteLine($"\nClose : {data[^1].Close}");
//                        Console.WriteLine($"High SMMA : {HighSMMAs.Last().Smma}");
//                        Console.WriteLine($"Low SMMA : {LowSMMAs.Last().Smma}");
//                        Console.WriteLine("\nPAC    => Long");
//                        return;
//                    }

//                    if ((double)data[^1].Close < (LowSMMAs.Last().Smma ?? 0))
//                    {
//                        // call act
//                        Console.WriteLine($"\nClose : {data[^1].Close}");
//                        Console.WriteLine($"High SMMA : {HighSMMAs.Last().Smma}");
//                        Console.WriteLine($"Low SMMA : {LowSMMAs.Last().Smma}");
//                        Console.WriteLine("\nPAC    => Short");
//                        return;
//                    }

//                    Console.WriteLine($"\nClose : {data[^1].Close}");
//                    Console.WriteLine($"High SMMA : {HighSMMAs.Last().Smma}");
//                    Console.WriteLine($"Low SMMA : {LowSMMAs.Last().Smma}");
//                    Console.WriteLine("\nPAC    => No Signal");

//                });
//        }
//    }
//}
