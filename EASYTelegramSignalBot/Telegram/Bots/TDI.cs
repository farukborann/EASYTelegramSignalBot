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
    public class TDI : BaseUpdateHandler
    {
        public static Dictionary<UpdateType, Action<Message>?>? Handlers { get; set; } = new();

        public TDI(ITelegramBotClient client) : base(client, Handlers)
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

            Task.Run(() => BotClient.SendTextMessageAsync(chatId: message.Chat.Id, parseMode: ParseMode.Markdown, text: text));

            return null;
        }

        public static void SendMessages(string message, string symbol)
        {
            var Users = Connection.Context.Users.Where(x => x.ChatId != 0 && x.TDI && x.TDISymbols.ContainsKey(symbol) && x.TDISymbols[symbol] > DateTime.Now);
            foreach (Database.Models.User user in Users)
            {
                try
                {
                    //if (user.ChatId == 0 || !user.TDISymbols.Any(x => x.Key.Equals(symbol) && x.Value > DateTime.Now)) continue;
                    Clients.TDIClient.SendTextMessageAsync(user.ChatId, message);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Telegram Kişiye ({user.Username}) Mesaj Gönderirken Hata : {ex.Message}");
                }

            }

            foreach (string? group in Settings.TelegramSettings.TDIGroups)
            {
                try
                {
                    Clients.TDIClient.SendTextMessageAsync(group, message);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Telegram Gruba ({group}) Mesaj Gönderirken Hata : {ex.Message}");
                }
            }
        }
    }
}