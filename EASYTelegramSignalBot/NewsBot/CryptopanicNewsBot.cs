using EASYTelegramSignalBot.NewsBot.Helpers;
using EASYTelegramSignalBot.NewsBot.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Windows.Threading;

namespace EASYTelegramSignalBot.NewsBot
{
    public class CryptopanicNewsBot
    {
        private string ApiUrl { get; set; }
        private DispatcherTimer Timer { get; set; }
        private int? LastReportId { get; set; }

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
            Response? apiResponse = Task.Run(() => GetNews()).Result;
            if (apiResponse == null)
            {
                Console.WriteLine("Cryptopanic News Bot Yeni Haberler Kontrol Edilemedi.\nLütfen Api'ın Çalıştığından, Key'in Doğru Olduğundan Ve İnternet Bağlantınız Olduğundan Emin Olun.");
                return;
            }

            List<Result>? News = apiResponse.results;

            if (LastReportId == null) LastReportId = News[0].id;
            if (News == null) // || newNews.results[0].id == LastNewsId
            {
                Console.WriteLine("Cryptopanic News Bot Yeni Haber Yok");
            }
            else
            {
                foreach (Result? report in News)
                {
                    if (report.id == LastReportId) break;
                    string? translatedTitle = Task.Run(() => Translate.TranslateText("en", "tr", report.title)).Result;
                    if (string.IsNullOrEmpty(translatedTitle)) continue;

                    string currencies = string.Empty;
                    if (report.currencies != null) report.currencies.ForEach(x => currencies += x.title + $"({x.code})\n");

                    string message = Settings.BotsSettings.NewsSettings.Message.
                        Replace("{Title}", translatedTitle).
                        Replace("{Link}", $"[{report.source.title}](https://{report.source.domain}/)").
                        Replace("{Coins}", currencies);

                    Task.Run(() => Telegram.Bots.News.SendMessages(message));
                }
                LastReportId = News[0].id;
            }

            Console.WriteLine("Cryptopanic News Bot Haberler Güncellendi");
        }

        //private static Task SendMessages(string message)
        //{
        //    foreach (User user in Database.Connection.Context.Users)
        //    {
        //        try
        //        {
        //            if (user.ChatId == 0 || !user.News) continue;
        //            BotClients.NewsClient.SendTextMessageAsync(user.ChatId, message, parseMode: TeleApi.Types.Enums.ParseMode.Markdown);
        //        }
        //        catch (Exception ex)
        //        {
        //            Console.WriteLine($"Telegram Kişiye ({user.Username}) Mesaj Gönderirken Hata : {ex.Message}");
        //        }

        //    }

        //    foreach (string? group in Settings.TelegramSettings.NewsGroups)
        //    {
        //        try
        //        {
        //            BotClients.NewsClient.SendTextMessageAsync(group, message, parseMode: TeleApi.Types.Enums.ParseMode.Markdown);
        //        }
        //        catch (Exception ex)
        //        {
        //            Console.WriteLine($"Telegram Gruba ({group}) Mesaj Gönderirken Hata : {ex.Message}");
        //        }
        //    }

        //    return Task.Delay(0);
        //}

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
