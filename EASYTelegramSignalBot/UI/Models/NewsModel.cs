using EASYTelegramSignalBot.Database;
using EASYTelegramSignalBot.Database.Models;
using EASYTelegramSignalBot.UI.Helpers;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;

namespace EASYTelegramSignalBot.Models
{
    public class NewsModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler? PropertyChanged;

        #region Users And Groups
        //Users
        private ObservableCollection<User>? users;
        public ObservableCollection<User> Users
        {
            get { users = Connection.Context.Users; return users; }
            set { users = value; PropertyChanged?.InvokeAll(this, nameof(Users)); }
        }

        private User? selectedUser;
        public User? SelectedUser
        {
            get => selectedUser;
            set
            {
                selectedUser = value;
                if (selectedUser != null) SelectedUser?.UpdateUserSymbols();
                SelectedUserSymbols = selectedUser?.TDISymbols;
                PropertyChanged?.InvokeAll(this, nameof(SelectedUser));
            }
        }

        private Dictionary<string, DateTime>? selectedUserSymbols;
        public Dictionary<string, DateTime>? SelectedUserSymbols
        {
            get => selectedUserSymbols;
            set { selectedUserSymbols = value; PropertyChanged?.InvokeAll(this, nameof(SelectedUserSymbols)); }
        }

        private KeyValuePair<string, DateTime>? selectedUserSymbol;
        public KeyValuePair<string, DateTime>? SelectedUserSymbol
        {
            get => selectedUserSymbol;
            set { selectedUserSymbol = value ?? (SelectedUserSymbols?.Count > 0 ? SelectedUserSymbols.First() : new()); PropertyChanged?.InvokeAll(this, nameof(SelectedUserSymbol)); }
        }

        private string? addUserString;
        public string? AddUserString
        {
            get => addUserString;
            set { addUserString = value; PropertyChanged?.InvokeAll(this, nameof(AddUserString), nameof(IsAddUserButtonEnabled)); }
        }

        private string? addUserSymbolString;
        public string? AddUserSymbolString
        {
            get => addUserSymbolString;
            set { addUserSymbolString = value; PropertyChanged?.InvokeAll(this, nameof(AddUserSymbolString), nameof(IsAddUserSymbolButtonEnabled)); }
        }

        private int? addUserDays;
        public int AddUserDays
        {
            get => addUserDays ?? 30;
            set { addUserDays = value; PropertyChanged?.InvokeAll(this, nameof(AddUserDays), nameof(IsAddUserButtonEnabled)); }
        }

        private string? addSymbolString;
        public string? AddSymbolString
        {
            get => addSymbolString;
            set { addSymbolString = value; PropertyChanged?.InvokeAll(this, nameof(AddSymbolString), nameof(IsAddSymbolButtonEnabled)); }
        }

        public bool IsAddUserSymbolButtonEnabled => !string.IsNullOrEmpty(addUserSymbolString);
        public bool IsAddUserButtonEnabled => !string.IsNullOrEmpty(addUserString);
        public bool IsAddSymbolButtonEnabled => !string.IsNullOrEmpty(addSymbolString);

        //Groups
        public static List<string>? GroupIds
        {
            get => Settings.TelegramSettings.NewsGroups;
            set => Settings.TelegramSettings.NewsGroups = value ?? new();
        }

        private string? selectedGroup;
        public string? SelectedGroup
        {
            get => selectedGroup;
            set { selectedGroup = value; PropertyChanged?.InvokeAll(this, nameof(SelectedGroup), nameof(IsDelGroupButtonEnabled)); }
        }

        private string? addGroupString;
        public string? AddGroupString
        {
            get => addGroupString;
            set { addGroupString = value; PropertyChanged?.InvokeAll(this, nameof(AddGroupString), nameof(IsAddGroupButtonEnabled)); }
        }

        public bool IsAddGroupButtonEnabled => !string.IsNullOrEmpty(addGroupString);
        public bool IsDelGroupButtonEnabled => !string.IsNullOrEmpty(SelectedGroup);
        #endregion

        #region Telegram Messages
        private string? message;
        public string Message
        {
            get => message ?? "";
            set { message = value; PropertyChanged?.InvokeAll(this, nameof(Message)); }
        }
        #endregion

        #region Indicator Settings
        private int interval;
        public int Interval
        {
            get => interval;
            set { interval = value; PropertyChanged?.InvokeAll(this, nameof(Interval)); }
        }

        private string key;
        public string Key
        {
            get => key;
            set { key = value; PropertyChanged?.InvokeAll(this, nameof(Key)); }
        }
        #endregion
    }
}
