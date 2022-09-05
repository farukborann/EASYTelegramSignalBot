using System;

namespace EASYTelegramSignalBot.Database.Models
{
    public class User
    {
        public int Id { get; set; }

        public string UserName { get; set; }
        public long ChatId { get; set; }

        public bool TDI { get; set; }
        public DateTime TDIExpiryDate { get; set; }

        public bool PAC { get; set; }
        public DateTime PACExpiryDate { get; set; }
    }
}
