using EASYTelegramSignalBot.Database;
using EASYTelegramSignalBot.Database.Models;
using EASYTelegramSignalBot.Models;
using EASYTelegramSignalBot.UI.Helpers;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace EASYTelegramSignalBot.ViewModels
{
    internal class NewsViewModel : UserControl
    {
        public ICommand AddUserCommand { get; set; }
        public ICommand DelUserCommand { get; set; }
        public ICommand AddGroupCommand { get; set; }
        public ICommand DelGroupCommand { get; set; }
        public ICommand SaveSettingsCommand { get; set; }

        public NewsModel Model { get; set; }

        public NewsViewModel()
        {
            Model = new();

            AddUserCommand = new DelegateCommand((o) => AddUser());
            DelUserCommand = new DelegateCommand((o) => DelUser());
            AddGroupCommand = new DelegateCommand((o) => AddGroup());
            DelGroupCommand = new DelegateCommand((o) => DelGroup());
            SaveSettingsCommand = new DelegateCommand((o) => SaveSettings());

            LoadSettings();
            UILoader.Instance.SetPageReady("News", null);
        }

        #region Users And Groups

        public void AddUser()
        {
            try
            {
                if (!Connection.Context.Users.Any(x => x.Username == Model.AddUserString))
                {
                    Connection.Context.Add(new User(Model.AddUserString ?? "") { NewsExpiryDate = DateTime.Now.AddDays(Model.AddUserDays) });
                    Connection.Context.SaveChanges();
                    MessageBox.Show("Kullanıcı başarıyla eklendi.", "Kullanıcı Eklendi", MessageBoxButton.OK);
                }
                else if (Connection.Context.Users.Any(x => x.Username == Model.AddUserString && x.News == false))
                {
                    User? user = Connection.Context.Users.First(x => x.Username == Model.AddUserString);
                    user.News = true;
                    DateTime newExpiryDate = DateTime.Now.AddDays(Model.AddUserDays);
                    if (user.NewsExpiryDate > DateTime.Now) newExpiryDate = user.NewsExpiryDate.Value.AddDays(Model.AddUserDays);
                    user.NewsExpiryDate = newExpiryDate;
                    Connection.Context.SaveChanges();
                    MessageBox.Show("Kullanıcı başarıyla eklendi.", "Kullanıcı Eklendi", MessageBoxButton.OK);
                }
                else
                {
                    User user = Connection.Context.Users.First(x => x.Username == Model.AddUserString);
                    Model.SelectedUser = user;
                }

                Model.Users = null;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Bir hata meydana geldi : {ex.Message}", "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void DelUser()
        {
            try
            {
                if (Model.SelectedUser == null) return;
                User? user = Connection.Context.Users.First(x => x.Username == Model.AddUserString && x.News == true);
                user.News = false;
                user.NewsExpiryDate = DateTime.Now.AddDays(-1);
                Connection.Context.SaveChanges();

                MessageBox.Show("Kullanıcı başarıyla silindi.", "Kullanıcı Silindi", MessageBoxButton.OK);

                Model.Users = null;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Bir hata meydana geldi : {ex.Message}", "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void AddGroup()
        {
            if (string.IsNullOrEmpty(Model.AddGroupString)) return;
            Settings.TelegramSettings.NewsGroups.Add(Model.AddGroupString);
            Settings.SaveSettings();
            Model.GroupIds?.Add(Model.AddGroupString);
            MessageBox.Show("Grup başarıyla eklendi", "Grup Eklendi", MessageBoxButton.OK);
        }

        public void DelGroup()
        {
            Settings.TelegramSettings.NewsGroups.Remove(Model.SelectedGroup ?? "");
            Settings.SaveSettings();
            Model.GroupIds?.Remove(Model.SelectedGroup ?? "");
            MessageBox.Show("Grup başarıyla silindi", "Grup Silindi", MessageBoxButton.OK);
        }
        #endregion  

        #region Indicator Settings
        public void SaveSettings()
        {
            Settings.BotsSettings.NewsSettings.Message = Model.Message;
            Settings.BotsSettings.NewsSettings.Interval = Model.Interval;
            Settings.BotsSettings.NewsSettings.Key = Model.Key;

            Settings.SaveSettings();

            MessageBox.Show("Ayarlar başarıyla kaydedildi.", "Ayarlar kaydedildi", MessageBoxButton.OK);
        }

        public void LoadSettings()
        {
            Model.Interval = Settings.BotsSettings.NewsSettings.Interval;
            Model.Key = Settings.BotsSettings.NewsSettings.Key;
            Model.Message = Settings.BotsSettings.NewsSettings.Message;
        }
        #endregion
    }
}
