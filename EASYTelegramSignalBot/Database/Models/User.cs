using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace EASYTelegramSignalBot.Database.Models
{
    public class User
    {
        public int Id { get; set; }

        public string? Username { get; set; }
        public long ChatId { get; set; }

        public bool TDI { get; set; }
        public bool News { get; set; }
        public DateTime? NewsExpiryDate { get; set; }

        public string? TDISymbolValues { get; set; }

        [NotMapped]
        public Dictionary<string, DateTime> TDISymbols { get; set; }

        public User()
        {
            TDISymbols = new();
        }

        public void UpdateUserSymbols()
        {
            TDISymbols = JsonConvert.DeserializeObject<Dictionary<string, DateTime>>(TDISymbolValues ?? "{}") ?? new();
        }

        public void SaveUserSymbols()
        {
            TDISymbolValues = JsonConvert.SerializeObject(TDISymbols);
            UpdateUserSymbols();
        }
    }
}
