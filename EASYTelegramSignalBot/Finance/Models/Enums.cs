namespace EASYTelegramSignalBot.Finance.Models
{
    public static class Enums
    {
        public enum SignalType
        {
            None = 0,

            StrongBuy = 1,
            MediumBuy = 2,
            WeakBuy = 3,
            Buy = 4,
            Sell = 5,
            WeakSell = 6,
            MediumSell = 7,
            StrongSell = 8,

            Long = 9,
            Short = 10,

            UpperLine = 11,
            BetweenLines = 12,
            UnderLine = 13,

            Exit = 14
        }
        public enum TriggerType
        {
            KlineClose = 0,
            KlineUpdate = 1,
            KlineOpen = 2
        }

        public enum SubscriptionType
        {
            UsdFutures = 0,
            CoinFutures = 1,
            Spot = 2
        }
    }
}
