using EASYTelegramSignalBot.Telegram.Bots;
using System;
using System.Threading;
using Telegram.Bot;
using Telegram.Bot.Polling;
using Telegram.Bot.Types.Enums;

namespace EASYTelegramSignalBot.Telegram
{
    public class Clients
    {
        private static CancellationTokenSource CancelToken { get; set; }
        public static TelegramBotClient TDIClient { get; set; }
        public static TelegramBotClient PACClient { get; set; }
        public static TelegramBotClient RSIClient { get; set; }
        public static TelegramBotClient NewsClient { get; set; }

        public static void StartBotClients()
        {
            try
            {
                TDIClient = new(Settings.TelegramSettings.TDIBot);
                PACClient = new(Settings.TelegramSettings.PACBot);
                RSIClient = new(Settings.TelegramSettings.RSIBot);
                NewsClient = new(Settings.TelegramSettings.NewsBot);
                CancelToken = new CancellationTokenSource();

                StartReceiving();
                Console.WriteLine("Telegram Botları Başladı");
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

            TDI TDIHandler = new(TDIClient);
            TDIClient.StartReceiving(updateHandler: TDIHandler.HandleUpdateAsync,
                               pollingErrorHandler: TDIHandler.PollingErrorHandler,
                               receiverOptions: receiverOptions,
                               cancellationToken: CancelToken.Token);

            PAC PACHandler = new(PACClient);
            PACClient.StartReceiving(updateHandler: PACHandler.HandleUpdateAsync,
                   pollingErrorHandler: PACHandler.PollingErrorHandler,
                   receiverOptions: receiverOptions,
                   cancellationToken: CancelToken.Token);

            RSI RSIHandler = new(RSIClient);
            RSIClient.StartReceiving(updateHandler: RSIHandler.HandleUpdateAsync,
                   pollingErrorHandler: RSIHandler.PollingErrorHandler,
                   receiverOptions: receiverOptions,
                   cancellationToken: CancelToken.Token);

            News NewsHandler = new(NewsClient);
            NewsClient.StartReceiving(updateHandler: NewsHandler.HandleUpdateAsync,
                   pollingErrorHandler: NewsHandler.PollingErrorHandler,
                   receiverOptions: receiverOptions,
                   cancellationToken: CancelToken.Token);
        }
    }
}
