using System;
using System.Threading;
using Telegram.Bot;
using Telegram.Bot.Polling;
using Telegram.Bot.Types.Enums;

namespace EASYTelegramSignalBot.Telegram
{
    public static class BotClients
    {
        private static CancellationTokenSource CancelToken { get; set; }
        public static TelegramBotClient TDIClient { get; set; }
        public static TelegramBotClient RSIClient { get; set; }
        public static TelegramBotClient NewsClient { get; set; }
        public static TelegramBotClient GeneralClient { get; set; }

        public static void StartBotClients()
        {
            TDIClient = new(Settings.TelegramSettings.TDIBot);
            RSIClient = new(Settings.TelegramSettings.RSIBot);
            NewsClient = new(Settings.TelegramSettings.NewsBot);
            CancelToken = new CancellationTokenSource();

            ReceiverOptions? receiverOptions = new ReceiverOptions()
            {
                AllowedUpdates = Array.Empty<UpdateType>(),
                ThrowPendingUpdates = true
            };

            TDIClient.StartReceiving(updateHandler: TDIUpdateHandlers.HandleUpdateAsync,
                               pollingErrorHandler: TDIUpdateHandlers.PollingErrorHandler,
                               receiverOptions: receiverOptions,
                               cancellationToken: CancelToken.Token);

            RSIClient.StartReceiving(updateHandler: RSIUpdateHandlers.HandleUpdateAsync,
                   pollingErrorHandler: RSIUpdateHandlers.PollingErrorHandler,
                   receiverOptions: receiverOptions,
                   cancellationToken: CancelToken.Token);

            NewsClient.StartReceiving(updateHandler: NewsUpdateHandlers.HandleUpdateAsync,
                   pollingErrorHandler: NewsUpdateHandlers.PollingErrorHandler,
                   receiverOptions: receiverOptions,
                   cancellationToken: CancelToken.Token);

            GeneralClient = new(Settings.TelegramSettings.GeneralBot);
        }
    }
}
