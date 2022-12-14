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
    public class RSI : BaseUpdateHandler
    {
        public static Dictionary<UpdateType, Action<Message>?>? Handlers { get; set; } = new();
        public RSI(ITelegramBotClient client) : base(client, Handlers)
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
            else if (Database.Connection.Context.Users.Any(x => x.Username == message.Chat.Username))
            {
                Database.Models.User? user = Database.Connection.Context.Users.Where(x => x.Username == message.Chat.Username).First();

                if (user.ChatId == 0)
                {
                    user.ChatId = message.Chat.Id;
                    Database.Connection.Context.SaveChanges();
                }

                text += "RSI Bot üyeliğiniz diğer paketlerdeki abonelikleriniz devam ettiği sürece hediye olarak devam edicektir.";
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
            IEnumerable<Database.Models.User>? Users = Database.Connection.Context.Users.Where(x => x.ChatId != 0 && 
            ((x.PACSymbols.ContainsKey(symbol) && x.PACSymbols[symbol] > DateTime.Now) || 
            (x.TDISymbols.ContainsKey(symbol) && x.TDISymbols[symbol] > DateTime.Now)));
            foreach (Database.Models.User user in Users)
            {
                try
                {
                    Clients.RSIClient.SendTextMessageAsync(user.ChatId, message, ParseMode.Markdown);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Telegram Kişiye ({user.Username}) Mesaj Gönderirken Hata : {ex.Message}");
                }

            }

            foreach (string? group in Settings.TelegramSettings.RSIGroups)
            {
                try
                {
                    Clients.RSIClient.SendTextMessageAsync(group, message, ParseMode.Markdown);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Telegram Gruba ({group}) Mesaj Gönderirken Hata : {ex.Message}");
                }
            }
        }
    }
}