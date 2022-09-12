using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace EASYTelegramSignalBot.Database.Models
{
    public class User : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler? PropertyChanged;
        private Entities.User user { get; set; }

        public string? Username
        {
            get => user.Username;
            set { user.Username = value; PropertyChanged?.Invoke(this, new(nameof(Username))); }
        }

        public long ChatId
        {
            get => user.ChatId;
            set { user.ChatId = value; PropertyChanged?.Invoke(this, new(nameof(ChatId))); }
        }

        public bool TDI
        {
            get => user.TDI;
            set { user.TDI = value; PropertyChanged?.Invoke(this, new(nameof(TDI))); }
        }

        public bool PAC
        {
            get => user.PAC;
            set { user.PAC = value; PropertyChanged?.Invoke(this, new(nameof(PAC))); }
        }

        public bool News
        {
            get => user.News;
            set { user.News = value; PropertyChanged?.Invoke(this, new(nameof(News))); }
        }

        public DateTime? NewsExpiryDate
        {
            get => user.NewsExpiryDate;
            set { user.NewsExpiryDate = value; PropertyChanged?.Invoke(this, new(nameof(NewsExpiryDate))); }
        }

        public Dictionary<string, DateTime> TDISymbols { get; set; }

        public Dictionary<string, DateTime> PACSymbols { get; set; }

        public User(Entities.User user)
        {
            this.user = user;
            TDISymbols = new();
            PACSymbols = new();
        }

        public User(string Username)
        {
            user = new(Username);

            TDISymbols = new();
            PACSymbols = new();
        }

        public void UpdateUserSymbols()
        {
            TDISymbols = JsonConvert.DeserializeObject<Dictionary<string, DateTime>>(user.TDISymbolValues ?? "{}") ?? new();
            PACSymbols = JsonConvert.DeserializeObject<Dictionary<string, DateTime>>(user.PACSymbolValues ?? "{}") ?? new();
        }

        public void SaveUserSymbols()
        {
            user.TDISymbolValues = JsonConvert.SerializeObject(TDISymbols);
            user.PACSymbolValues = JsonConvert.SerializeObject(PACSymbols);
        }
    }
}
