using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Telegram.Bot;
using Telegram.Bot.Exceptions;
using Telegram.Bot.Types;
using Telegram.Bot.Types.Enums;

namespace EASYTelegramSignalBot.Telegram.Models
{
    public abstract class BaseUpdateHandler
    {
        public ITelegramBotClient BotClient { get; set; }
        public Dictionary<UpdateType, Action<Message>?>? Handlers { get; set; }

        public BaseUpdateHandler(ITelegramBotClient botClient, Dictionary<UpdateType, Action<Message>?>? handlers)
        {
            BotClient = botClient;
            Handlers = handlers;
        }

        public Task PollingErrorHandler(ITelegramBotClient botClient, Exception exception, CancellationToken cancellationToken)
        {
            string? ErrorMessage = exception switch
            {
                ApiRequestException apiRequestException => $"Telegram API Error:\n[{apiRequestException.ErrorCode}]\n{apiRequestException.Message}",
                _ => exception.ToString()
            };

            Console.WriteLine(ErrorMessage);
            return Task.CompletedTask;
        }

        public async Task HandleUpdateAsync(ITelegramBotClient botClient, Update update, CancellationToken cancellationToken)
        {
            Action<Message>? handler;
            if (Handlers != null && Handlers.ContainsKey(update.Type)) handler = Handlers[update.Type];
            else handler = (o) => DefaultMessage(o);

            try
            {
                if (handler == null || update.Message == null) return;
                handler?.Invoke(update.Message);
            }
            catch (Exception exception)
            {
                await PollingErrorHandler(botClient, exception, cancellationToken);
            }
        }

        private Action<Message>? DefaultMessage(Message message)
        {
            string text = "Hoşgeldiniz\nBilinmeyen bir mesaj attınız.\nLütfen mesajınızı kontrol edip tekrar deneyin.";

            Task.Run(() =>
            BotClient.SendTextMessageAsync(chatId: message.Chat.Id, text: text));
            return null;
        }
    }
}
