using Binance.Net.Clients;
using Binance.Net.Objects.Models.Futures;
using Binance.Net.Objects.Models.Spot;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EASYTelegramSignalBot.Finance.Binance
{
    public class ExchangeInfos
    {
        public IEnumerable<BinanceSymbol> Spot { get; set; }
        public IEnumerable<BinanceFuturesUsdtSymbol> Usdt { get; set; }
        public IEnumerable<BinanceFuturesCoinSymbol> Coin { get; set; }

        public ExchangeInfos(BinanceClient Client)
        {
            Spot = Task.Run(() => Client.SpotApi.ExchangeData.GetExchangeInfoAsync()).Result.Data.Symbols;
            Usdt = Task.Run(() => Client.UsdFuturesApi.ExchangeData.GetExchangeInfoAsync()).Result.Data.Symbols;
            Coin = Task.Run(() => Client.CoinFuturesApi.ExchangeData.GetExchangeInfoAsync()).Result.Data.Symbols;
        }
    }
}
