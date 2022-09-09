using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace EASYTelegramSignalBot.NewsBot.Helpers
{
    public static class Translate
    {
        public static async Task<string?> TranslateText(string from, string to, string data)
        {
            var client = new HttpClient();
            try
            {
                var result = Task.Run(() => client.GetAsync(new Uri("https://translate.googleapis.com/translate_a/single?client=gtx&sl=" + from + "&tl=" + to + "&dt=t&q=" + data))).Result;
                string[] json = result.Content.ReadAsStringAsync().Result.Split('"');//.ToString().Split('"');
                var translatedText = json[1];
                if (translatedText == "initial-scale=1, minimum-scale=1, width=device-width")
                {
                    Console.WriteLine("Çeviri yapılırken sebebi bilinmeyen bir hata oluştu.");
                    return null;
                }
                return translatedText;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Çeviri yapılırken hata : {ex.Message}");
                return null;
            }
        }
    }
}
