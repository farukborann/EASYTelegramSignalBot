using Newtonsoft.Json;
using System.IO;
using System;
using System.Collections.Generic;
using EASYTelegramSignalBot.SettingsManager.Models;

namespace EASYTelegramSignalBot
{
    public static class Settings
    {
        private static JsonModel _Settings { get; set; }

        public static void LoadSettings()
        {
            try
            {
                using StreamReader r = new("settings.json");
                string json = r.ReadToEnd();
                _Settings = JsonConvert.DeserializeObject<JsonModel>(json);
            }
            catch
            {
                Console.WriteLine("Ayarlar Yüklenemedi !");
                _Settings = new JsonModel();
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
            _Settings.IsDatabaseEnsureCreated = isCreated;
            SaveSettings();
        }
        
        public static void DatabaseResetted()
        {
            _Settings.ResetDatabaseFirstStart = false;
            SetDatabaseEnsureCreated(false);
        }

        public static string DatabaseConnectionString => _Settings.DatabaseConnectionString;
        public static bool IsDatabaseEnsureCreated => _Settings.IsDatabaseEnsureCreated;
        public static bool ResetDatabaseFirstStart => _Settings.ResetDatabaseFirstStart;

        public static string TDITelegramBotToken => _Settings.TDITelegramBotToken;
        public static string PACTelegramBotToken => _Settings.PACTelegramBotToken;
        public static string GeneralGroupTelegramBotToken => _Settings.GeneralGroupTelegramBotToken;
        public static string GeneralTelegramChannelId => _Settings.GeneralTelegramChannelId;
        public static double UpdateExpiredUsersTickMunite => _Settings.UpdateExpiredUsersTickMunite;

        public static List<string> TDIBotSymbols => _Settings.TDIBotSymbols;
    }
}
