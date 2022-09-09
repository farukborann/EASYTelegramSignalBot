using EASYTelegramSignalBot.Database;
using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Telegram.Bot;
using Telegram.Bot.Exceptions;
using Telegram.Bot.Types;
using Telegram.Bot.Types.Enums;

namespace EASYTelegramSignalBot.Telegram
{
    public static class TDIUpdateHandlers
    {
        //Main Methods
        public static Task PollingErrorHandler(ITelegramBotClient botClient, Exception exception, CancellationToken cancellationToken)
        {
            string? ErrorMessage = exception switch
            {
                ApiRequestException apiRequestException => $"Telegram API Error:\n[{apiRequestException.ErrorCode}]\n{apiRequestException.Message}",
                _ => exception.ToString()
            };

            Console.WriteLine(ErrorMessage);
            return Task.CompletedTask;
        }

        public static async Task HandleUpdateAsync(ITelegramBotClient botClient, Update update, CancellationToken cancellationToken)
        {
            Task? handler = update.Type switch
            {
                UpdateType.Message => BotOnMessageReceived(botClient, update.Message!),
            };

            try
            {
                await handler;
            }
            catch (Exception exception)
            {
                await PollingErrorHandler(botClient, exception, cancellationToken);
            }
        }

        //New Message Or Callback Handled Methods
        private static Task BotOnMessageReceived(ITelegramBotClient botClient, Message message)
        {
            if (message.Text is not { } messageText)
                return Task.Delay(0);

            if (messageText == "/start") DefaultMessage(botClient, message).WaitAsync(new TimeSpan(0, 0, 5));

            return Task.Delay(0);
        }

        //Answer Methods
        private static async Task DefaultMessage(ITelegramBotClient botClient, Message message)
        {
            string text = "Hoşgeldiniz\n";
            if (string.IsNullOrEmpty(message.Chat.Username))
            {
                text = "Lütfen önce kullanıcı adı belirleyin.\nhttps://telegram.org/faq#s-kullanici-adlari-nedir-nasil-alabilirim";
            }
            else if (Connection.Context.Users.Any(x => x.Username == message.Chat.Username))
            {
                Database.Models.User? user = Connection.Context.Users.Where(x => x.Username == message.Chat.Username).First();

                if (user.ChatId == 0)
                {
                    user.ChatId = message.Chat.Id;
                    Connection.Context.SaveChanges();
                }
                user.UpdateUserSymbols();
                user.TDISymbols.ToList().ForEach(x =>
                {
                    if (x.Value < DateTime.Now)
                    {
                        text += $"TDI Bot {x.Key} üyeliğiniz bitmiştir\n";
                        user.TDISymbols.Remove(x.Key);
                        Connection.Context.SaveChanges();
                        return;
                    }

                    text += $"TDI Bot {x.Key} üyeliğinizin bitiş tarihi {x.Value}\n";

                });
            }
            else
            {
                text = "Üyeliğiniz bulunamamıştır.\nLütfen bizimle iletişime geçin.";
            }

            await botClient.SendTextMessageAsync(chatId: message.Chat.Id, parseMode: ParseMode.Markdown,
                                                        text: text);
        }
    }
}