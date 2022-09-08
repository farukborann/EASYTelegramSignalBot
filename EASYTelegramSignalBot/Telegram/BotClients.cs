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
        public static TelegramBotClient GeneralClient { get; set; }

        public static void StartBotClients()
        {
            TDIClient = new(Settings.TelegramSettings.TDIBots[0]);
            CancelToken = new CancellationTokenSource();

            ReceiverOptions? receiverOptions = new ReceiverOptions()
            {
                AllowedUpdates = Array.Empty<UpdateType>(),
                ThrowPendingUpdates = true
            };

            TDIClient.StartReceiving(updateHandler: UpdateHandlers.HandleUpdateAsync,
                               pollingErrorHandler: UpdateHandlers.PollingErrorHandler,
                               receiverOptions: receiverOptions,
                               cancellationToken: CancelToken.Token);
            GeneralClient = new(Settings.TelegramSettings.GeneralBots[0]);
        }
    }
}
