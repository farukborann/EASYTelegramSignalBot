namespace EASYTelegramSignalBot.Finance.Models
{
    public static class Enums
    {
        public enum SignalType
        {
            Exit = 0,
            Long = 1,
            Short = 2,
            Buy = 3,
            Sell = 4,
            UpperLine = 5,
            BetweenLines = 6,
            UnderLine = 7,
            None = 8
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
