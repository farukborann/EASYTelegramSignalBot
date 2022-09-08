using EASYTelegramSignalBot.SettingsManager.Models;
using Newtonsoft.Json;
using System;
using System.IO;

namespace EASYTelegramSignalBot
{
    public static class Settings
    {
        private static SettingsManager.Models.Settings _Settings { get; set; }

        public static void LoadSettings()
        {
            try
            {
                using StreamReader r = new("settings.json");
                string json = r.ReadToEnd();
                _Settings = JsonConvert.DeserializeObject<SettingsManager.Models.Settings>(json);
            }
            catch
            {
                Console.WriteLine("Ayarlar Yüklenemedi !");
                _Settings = new SettingsManager.Models.Settings();
            }
        }

        public static void SaveSettings()
        {
            try
            {
                using StreamWriter w = File.CreateText("settings.json");
                string json = JsonConvert.SerializeObject(_Settings, Formatting.Indented);
                w.Write(json);
            }
            catch
            {
                Console.WriteLine("Ayarlar Kaydedilemedi !");
            }
        }

        public static void SetDatabaseEnsureCreated(bool isCreated = true)
        {
            _Settings.DatabaseSettings.IsDatabaseEnsureCreated = isCreated;
            SaveSettings();
        }

        public static void DatabaseResetted()
        {
            _Settings.DatabaseSettings.ResetDatabaseFirstStart = false;
            SetDatabaseEnsureCreated(false);
        }

        public static Databasesettings DatabaseSettings => _Settings.DatabaseSettings;
        public static Telegramsettings TelegramSettings => _Settings.TelegramSettings;
        public static Botssettings BotsSettings => _Settings.BotsSettings;
    }
}
