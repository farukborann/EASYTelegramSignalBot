using Newtonsoft.Json;

namespace EASYTelegramSignalBot.SettingsManager.Models
{
    public class JsonModel
    {
        [JsonProperty("DatabaseConnectionString")]
        public string DatabaseConnectionString { get; set; }

        [JsonProperty("IsDatabaseEnsureCreated")]
        public bool IsDatabaseEnsureCreated { get; set; }

        [JsonProperty("ResetDatabaseFirstStart")]
        public bool ResetDatabaseFirstStart { get; set; }


        [JsonProperty("TDITelegramBotToken")]
        public string TDITelegramBotToken { get; set; }

        [JsonProperty("PACTelegramBotToken")]
        public string PACTelegramBotToken { get; set; }

        [JsonProperty("GeneralGroupTelegramBotToken")]
        public string GeneralGroupTelegramBotToken { get; set; }

        [JsonProperty("GeneralTelegramChannelId")]
        public string GeneralTelegramChannelId { get; set; }

        [JsonProperty("UpdateExpiredUsersTickMunite")]
        public double UpdateExpiredUsersTickMunite { get; set; }
    }
}
