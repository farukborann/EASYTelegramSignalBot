using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace EASYTelegramSignalBot.NewsBot.Helpers
{
    public static class Request
    {
        public static async Task<string> Post(string url, string data)
        {
            using HttpClient? client = new HttpClient();
            StringContent? postData = new StringContent(data, Encoding.UTF8, "application/json");
            HttpResponseMessage? response = await client.PostAsync(url, postData);
            string? result = await response.Content.ReadAsStringAsync();
            return result;
        }
        public static async Task<string> Get(string url)
        {
            using HttpClient? client = new HttpClient();
            string? content = Task.Run(() => client.GetStringAsync(url)).Result;
            return content;
        }
    }
}
