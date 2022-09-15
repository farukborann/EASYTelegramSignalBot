using EASYTelegramSignalBot.Database;
using EASYTelegramSignalBot.Telegram.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Telegram.Bot;
using Telegram.Bot.Types;
using Telegram.Bot.Types.Enums;

namespace EASYTelegramSignalBot.Telegram.Bots
{
    public class News : BaseUpdateHandler
    {
        public static Dictionary<UpdateType, Action<Message>?>? Handlers { get; set; } = new();
        public News(ITelegramBotClient client) : base(client, Handlers)
        {
            Handlers.Add(UpdateType.Message, (o) => Message(o));
        }

        public Action<Message>? Message(Message message)
        {
            if (message.Text != "/start") return null;

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

                if (user.NewsExpiryDate < DateTime.Now)
                {
                    text += $"News Bot üyeliğiniz bitmiştir\n";
                    user.News = false;
                    Connection.Context.SaveChanges();
                }

                text += $"News Bot üyeliğinizin bitiş tarihi {user.NewsExpiryDate}\n";

            }
            else
            {
                text = "Üyeliğiniz bulunamamıştır.\nLütfen bizimle iletişime geçin.";
            }

            Task.Run(() => BotClient.SendTextMessageAsync(chatId: message.Chat.Id, parseMode: ParseMode.Markdown, text: text));

            return null;
        }

        public static void SendMessages(string message)
        {
            var Users = Connection.Context.Users.Where(x => x.ChatId != 0 && x.News);
            foreach (Database.Models.User user in Connection.Context.Users)
            {
                try
                {
                    //if (user.ChatId == 0 || !user.News) continue;
                    Clients.NewsClient.SendTextMessageAsync(user.ChatId, message, parseMode: ParseMode.Markdown);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Telegram Kişiye ({user.Username}) Mesaj Gönderirken Hata : {ex.Message}");
                }

            }

            foreach (string? group in Settings.TelegramSettings.NewsGroups)
            {
                try
                {
                    Clients.NewsClient.SendTextMessageAsync(group, message, parseMode: ParseMode.Markdown);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Telegram Gruba ({group}) Mesaj Gönderirken Hata : {ex.Message}");
                }
            }
        }
    }
}