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
        public List<string> GeneralGroups { get; set; }
        public List<string> GeneralBots { get; set; }
        public List<string> TDIGroups { get; set; }
        public List<string> TDIBots { get; set; }
    }

    public class Botssettings
    {
        public float UpdateExpiredUsersTickMunite { get; set; }
        public Generalsettings GeneralSettings { get; set; }
        public Tdisettings TDISettings { get; set; }
    }

    public class Generalsettings
    {
    }

    public class Tdisettings
    {
        public List<string> Symbols { get; set; }
        public Signalmessages SignalMessages { get; set; }
        public int RSIPeriot { get; set; }
        public int VotalityBandPeriot { get; set; }
        public int RSIPLPeriot { get; set; }
        public int TSLPeriot { get; set; }
        public int RSIOversoldLevel { get; set; }
        public int RSIOverboughtLevet { get; set; }
    }

    public class Signalmessages
    {
        public string Buy { get; set; }
        public string Sell { get; set; }
        public string Exit { get; set; }
    }

}


