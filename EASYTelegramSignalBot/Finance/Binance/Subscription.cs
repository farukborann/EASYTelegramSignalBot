﻿using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using Binance.Net.Enums;
using Binance.Net.Interfaces;
using CryptoExchange.Net.Objects;
using CryptoExchange.Net.Sockets;
using static EASYTelegramSignalBot.Finance.Helpers;
using EASYTelegramSignalBot.Finance.Models;

namespace EASYTelegramSignalBot.Finance.Binance
{
    public class KlineSubscription
    {
        private CancellationTokenSource CancellationTokenSource { get; set; }
        private Task<CallResult<UpdateSubscription>> CallResult { get; set; }

        public SubscriptionType Type{ get; set; }
        public string Symbol { get; set; }
        public KlineInterval Interval { get; set; }
        public List<TickAction> Actions { get; set; }

        private int Limit { get; set; }
        public List<Kline> Klines { get; set; }

        public KlineSubscription(SubscriptionType type, string symbol, KlineInterval interval, int limit)
        {
            CancellationTokenSource = new();
            Type = type;
            Symbol = symbol;
            Interval = interval;
            Actions = new();

            Limit = limit;
            Klines = new();
            GetKlines();

            CallResult = Type switch
            {
                SubscriptionType.CoinFutures => StaticBinance.SocketClient.CoinFuturesStreams.SubscribeToKlineUpdatesAsync(
                                        Symbol,
                                        Interval,
                                        data => { RunFuncs(data); },
                                        CancellationTokenSource.Token
                                    ),
                SubscriptionType.Spot => StaticBinance.SocketClient.SpotStreams.SubscribeToKlineUpdatesAsync(
                                        Symbol,
                                        Interval,
                                        data => { RunFuncs(data); },
                                        CancellationTokenSource.Token
                                    ),
                _ => StaticBinance.SocketClient.UsdFuturesStreams.SubscribeToKlineUpdatesAsync(
                                        Symbol,
                                        Interval,
                                        data => { RunFuncs(data); },
                                        CancellationTokenSource.Token
                                    ),
            };
        }

        private void RunFuncs(DataEvent<IBinanceStreamKlineData> data)
        {
            if (!Klines.Last().Date.Equals(data.Data.Data.OpenTime))
            {
                //Run KlineClose methods before add new kline
                Actions.Where(x => x.TriggerType.Equals(TriggerType.KlineClose)).ToList().ForEach(x => Task.Run(() => x.Action(Klines.GetRange(Klines.Count-x.KlineCount, x.KlineCount))).Wait());

                //Add new Kline
                Klines.RemoveAt(0);
                Klines.Add(data.Data.Data.ToKline());

                //Run KlineOpen methods after add new kline
                Actions.Where(x => x.TriggerType.Equals(TriggerType.KlineOpen)).ToList().ForEach(x => Task.Run(() => x.Action(Klines.GetRange(Klines.Count - x.KlineCount, x.KlineCount))));
            }
            else
            {
                Klines[^1] = data.Data.Data.ToKline();
            }
            //Run KlineUpdate method when every kline update
            Actions.Where(x => x.TriggerType.Equals(TriggerType.KlineUpdate)).ToList().ForEach(x => Task.Run(() => x.Action(Klines.GetRange(Klines.Count - x.KlineCount, x.KlineCount))));
        }

        public void AddAction(TickAction tickAction)
        {
            UpdateLimit(tickAction.KlineCount);
            Actions.Add(tickAction);
        }

        public void UpdateLimit(int limit)
        {
            if (Limit < limit)
            {
                GetKlines();
            }
        }

        List<Kline> GetKlinesAsync(string Symbol, KlineInterval Interval, int Limit, DateTime? endTime = null)
        {
            switch (Type)
            {
                case SubscriptionType.CoinFutures:
                    return StaticBinance.Client.CoinFuturesApi.ExchangeData.GetKlinesAsync(Symbol, Interval, limit: Limit, endTime: endTime).Result.Data.ToKlines();
                case SubscriptionType.Spot:
                    return StaticBinance.Client.SpotApi.ExchangeData.GetKlinesAsync(Symbol, Interval, limit: Limit, endTime: endTime).Result.Data.ToKlines();
                case SubscriptionType.UsdFutures:
                default:
                    return StaticBinance.Client.UsdFuturesApi.ExchangeData.GetKlinesAsync(Symbol, Interval, limit: Limit, endTime: endTime).Result.Data.ToKlines();
            }
        }

        public void GetKlines()
        {
            if (Limit < 1500)
            {
                GetKlinesAsync(Symbol, Interval, Limit).ForEach(x => Klines.Add(x));
                return;
            }
            GetKlinesAsync(Symbol, Interval, 1500).ForEach(x => Klines.Add(x));
            int GetKlinesCount = Limit - 1500;
            for (; GetKlinesCount > 1500; GetKlinesCount-=1500)
            {
                GetKlinesAsync(Symbol, Interval, 1500, endTime: Klines[0].Date.AddSeconds(-1 * (int)Interval)).ForEach(x => Klines.Add(x));
            }

            if(GetKlinesCount > 0)
            {
                GetKlinesAsync(Symbol, Interval, GetKlinesCount).ForEach(x => Klines.Add(x));
            }
        }

        public void Cancel()
        {
            CancellationTokenSource?.Cancel();
        }
    }
}
