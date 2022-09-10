using EASYTelegramSignalBot.Telegram.UpdateHandlers;
using System;
using System.Threading;
using Telegram.Bot;
using Telegram.Bot.Polling;
using Telegram.Bot.Types.Enums;

namespace EASYTelegramSignalBot.Telegram
{
    public class BotClients
    {
        private static CancellationTokenSource CancelToken { get; set; }
        public static TelegramBotClient TDIClient { get; set; }
        public static TelegramBotClient RSIClient { get; set; }
        public static TelegramBotClient NewsClient { get; set; }

        public static void StartBotClients()
        {
            Console.WriteLine("Telegram Botları Başlatılıyor");
            try
            {
                TDIClient = new(Settings.TelegramSettings.TDIBot);
                RSIClient = new(Settings.TelegramSettings.RSIBot);
                NewsClient = new(Settings.TelegramSettings.NewsBot);
                CancelToken = new CancellationTokenSource();

                StartReceiving();
                Console.WriteLine("Telegram Botları Başlatıldı");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Telegram Botları Başlatılırken Hata : {ex.Message}");
            }
        }

        public static void StartReceiving()
        {
            ReceiverOptions? receiverOptions = new()
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
        }
    }
}
