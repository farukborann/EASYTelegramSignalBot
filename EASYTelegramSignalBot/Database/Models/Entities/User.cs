using System;

namespace EASYTelegramSignalBot.Database.Models.Entities
{
    public class User
    {
        public int Id { get; set; }

        public string? Username { get; set; }
        public long ChatId { get; set; }

        public bool TDI { get; set; }
        public bool PAC { get; set; }
        public bool News { get; set; }
        public DateTime? NewsExpiryDate { get; set; }

        public string? TDISymbolValues { get; set; }
        public string? PACSymbolValues { get; set; }

        public User(string Username)
        {
            this.Username = Username;

            ChatId = 0;
            TDI = false;
            PAC = false;
            News = false;
            NewsExpiryDate = null;
            TDISymbolValues = "{}";
            PACSymbolValues = "{}";
        }
    }
}
