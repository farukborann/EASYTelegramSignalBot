using System;
using System.Threading.Tasks;
using System.Windows.Threading;
using EASYTelegramSignalBot.Database.Models;
using EASYTelegramSignalBot.NewsBot.Helpers;
using EASYTelegramSignalBot.NewsBot.Models;
using EASYTelegramSignalBot.Telegram;
using Newtonsoft.Json;
using Telegram.Bot;

namespace EASYTelegramSignalBot.NewsBot
{
    public class CryptopanicNewsBot
    {
        private string ApiUrl { get; set; }
        private DispatcherTimer Timer { get; set; }
        private int? LastNewsId { get; set; }

        private bool IsUpdating { get; set; }
        public CryptopanicNewsBot()
        {
            IsUpdating = false;
            ApiUrl = $"https://cryptopanic.com/api/v1/posts/?auth_token={Settings.BotsSettings.NewsSettings.Key}";

            Timer = new();
            Timer.Tick += (object? sender, EventArgs e) => 
            {
                if (IsUpdating) return;
                IsUpdating = true;
                UpdateNews().Wait();
                IsUpdating = false;
            };
            Timer.Interval = TimeSpan.FromSeconds(Settings.BotsSettings.NewsSettings.Interval);
            Timer.Start();
            Console.WriteLine("Cryptopanic News Bot Başladı");
        }

        private async Task UpdateNews()
        {
            Console.WriteLine("Cryptopanic News Bot Haberler Güncelleniyor");
            Response? newNews = Task.Run(() => GetNews()).Result;

            if (LastNewsId == null) LastNewsId = newNews?.results[0].id;
            if (newNews == null || newNews.results[0].id == LastNewsId) 
            {
                Console.WriteLine("Cryptopanic News Bot Yeni Haber Yok");
            }
            else
            {
                var translatedTitle = Task.Run(() => Translate.TranslateText("en", "tr", newNews.results[0].title)).Result;

                if (string.IsNullOrEmpty(translatedTitle)) return;
                string message = Settings.BotsSettings.NewsSettings.Message.Replace("{Title}", translatedTitle).Replace("{Link}", newNews.results[0].url).Replace("{Coins}", string.Join(", ", newNews.results[0].currencies ?? new()));

                Task.Run(() => SendMessages(message));
                LastNewsId = newNews?.results[0].id;
            }

            Console.WriteLine("Cryptopanic News Bot Haberler Güncellendi");
        }

        private static Task SendMessages(string message)
        {
            foreach (User user in Database.Connection.Context.Users)
            {
                try
                {
                    if (user.ChatId == 0 || !user.News) continue;
                    BotClients.NewsClient.SendTextMessageAsync(user.ChatId, message);
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
                    BotClients.NewsClient.SendTextMessageAsync(group, message);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Telegram Gruba ({group}) Mesaj Gönderirken Hata : {ex.Message}");
                }
            }

            return Task.Delay(0);
        }

        private async Task<Response?> GetNews()
        {
            try
            {
                string newsData = await Request.Get(ApiUrl);
                Response? news = JsonConvert.DeserializeObject<Response>(newsData);
                return news;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Cryptopanic News Bot Hata: {ex.Message}");
                return null;
            }
        }
    }
}
