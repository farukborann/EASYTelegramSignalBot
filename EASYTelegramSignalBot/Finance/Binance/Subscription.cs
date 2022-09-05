using System;
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

            switch (type)
            {
                case SubscriptionType.CoinFutures:
                    CallResult = StaticBinance.SocketClient.CoinFuturesStreams.SubscribeToKlineUpdatesAsync(
                        Symbol,
                        Interval,
                        data => { RunFuncs(data); },
                        CancellationTokenSource.Token
                    );
                    break;
                case SubscriptionType.Spot:
                    CallResult = StaticBinance.SocketClient.SpotStreams.SubscribeToKlineUpdatesAsync(
                        Symbol,
                        Interval,
                        data => { RunFuncs(data); },
                        CancellationTokenSource.Token
                    );
                    break;
                case SubscriptionType.UsdFutures:
                default:
                    CallResult = StaticBinance.SocketClient.UsdFuturesStreams.SubscribeToKlineUpdatesAsync(
                        Symbol,
                        Interval,
                        data => { RunFuncs(data); },
                        CancellationTokenSource.Token
                    );
                    break;
            }
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

        public void GetKlines()
        {
            if (Limit < 1500)
            {
                StaticBinance.Client.UsdFuturesApi.ExchangeData.GetKlinesAsync(Symbol, Interval, limit: Limit).Result.Data.ToKlines().ForEach(x => Klines.Add(x));
                return;
            }
            StaticBinance.Client.UsdFuturesApi.ExchangeData.GetKlinesAsync(Symbol, Interval, limit: 1500).Result.Data.ToKlines().ForEach(x => Klines.Add(x));
            int GetKlinesCount = Limit - 1500;
            for (; GetKlinesCount > 1500; GetKlinesCount-=1500)
            {
                StaticBinance.Client.UsdFuturesApi.ExchangeData.GetKlinesAsync(Symbol, Interval, limit: 1500, endTime: Klines[0].Date.AddSeconds(-1 * (int)Interval)).Result.Data.ToKlines().ForEach(x => Klines.Add(x));
            }

            if(GetKlinesCount > 0)
            {
                StaticBinance.Client.UsdFuturesApi.ExchangeData.GetKlinesAsync(Symbol, Interval, limit: GetKlinesCount).Result.Data.ToKlines().ForEach(x => Klines.Add(x));
            }
        }

        public void Cancel()
        {
            CancellationTokenSource?.Cancel();
        }
    }
}
