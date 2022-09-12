using EASYTelegramSignalBot.Telegram.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Telegram.Bot;
using Telegram.Bot.Types;
using Telegram.Bot.Types.Enums;

namespace EASYTelegramSignalBot.Telegram.UpdateHandlers
{
    public class RSI : BaseUpdateHandler
    {
        public static Dictionary<UpdateType, Action<Message>?>? Handlers { get; set; }
        public RSI(ITelegramBotClient client) : base(client, Handlers)
        {
            Handlers = new Dictionary<UpdateType, Action<Message>?>
            {
                { UpdateType.Message, (o) => Message(o) }
            };
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
    }
}