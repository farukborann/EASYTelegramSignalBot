using System.Collections.Generic;

namespace EASYTelegramSignalBot.SettingsManager.Models
{
    public class Settings
    {
        public Databasesettings DatabaseSettings { get; set; }
        public Telegramsettings TelegramSettings { get; set; }
        public Botssettings BotsSettings { get; set; }
    }

    public class Databasesettings
    {
        public string DatabaseConnectionString { get; set; }
        public bool IsDatabaseEnsureCreated { get; set; }
        public bool ResetDatabaseFirstStart { get; set; }
    }

    public class Telegramsettings
    {
        public List<string> TDIGroups { get; set; }
        public string TDIBot { get; set; }
        public List<string> RSIGroups { get; set; }
        public string RSIBot { get; set; }
        public List<string> NewsGroups { get; set; }
        public string NewsBot { get; set; }

    }

    public class Botssettings
    {
        public float UpdateExpiredUsersTickMunite { get; set; }
        public Tdisettings TDISettings { get; set; }
        public Rsisettings RSISettings { get; set; }
        public Newssettings NewsSettings { get; set; }
    }

    public class Newssettings
    {
        public string Key { get; set; }
        public int Interval { get; set; }
        public string Message { get; set; }
    }

    public class Tdisettings
    {
        public List<string> Symbols { get; set; }
        public Tdisignalmessages SignalMessages { get; set; }
        public int RSIPeriot { get; set; }
        public int VotalityBandPeriot { get; set; }
        public int RSIPLPeriot { get; set; }
        public int TSLPeriot { get; set; }
        public int RSIOversoldLevel { get; set; }
        public int RSIOverboughtLevet { get; set; }
        public int MinSignalPeriot { get; set; }
    }

    public class Rsisettings
    {
        public List<string> Symbols { get; set; }
        public Rsisignalmessages SignalMessages { get; set; }
        public int RSIPeriot { get; set; }
        public int RSIOversoldLevel { get; set; }
        public int RSIOverboughtLevet { get; set; }
        public int MinSignalPeriot { get; set; }
    }

    public class Tdisignalmessages
    {
        public string Buy { get; set; }
        public string Sell { get; set; }
        public string Exit { get; set; }
    }

    public class Rsisignalmessages
    {
        public string Overbought { get; set; }
        public string Oversold { get; set; }
        public string BetweenLevels { get; set; }
    }

}


