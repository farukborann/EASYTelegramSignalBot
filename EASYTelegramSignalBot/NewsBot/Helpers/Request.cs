using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace EASYTelegramSignalBot.NewsBot.Helpers
{
    public static class Request
    {
        public static async Task<string> Post(string url, string data)
        {
            using var client = new HttpClient();
            var postData = new StringContent(data, Encoding.UTF8, "application/json");
            var response = await client.PostAsync(url, postData);
            var result = await response.Content.ReadAsStringAsync();
            return result;
        }
        public static async Task<string> Get(string url)
        {
            using var client = new HttpClient();
            var content = Task.Run(() => client.GetStringAsync(url)).Result;
            return content;
        }
    }
}
