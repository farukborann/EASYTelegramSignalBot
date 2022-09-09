using EASYTelegramSignalBot.Database;
using EASYTelegramSignalBot.Database.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using WpfClient.MVVM;

namespace EASYTelegramSignalBot.Models
{
    public class NewsModel : ObservableObject
    {
        #region Users And Groups
        //Users
        private List<User>? users;
        public List<User> Users
        {
            get { users = Connection.Context.Users.Local.ToObservableCollection().Where(x => x.News).ToList(); return users; }
            set { users = value; RaisePropertyChangedEvent(nameof(Users)); }
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
                RaisePropertyChangedEvent(nameof(SelectedUser));
            }
        }

        private Dictionary<string, DateTime>? selectedUserSymbols;
        public Dictionary<string, DateTime>? SelectedUserSymbols
        {
            get => selectedUserSymbols;
            set { selectedUserSymbols = value; RaisePropertyChangedEvent(nameof(SelectedUserSymbols)); }
        }

        private KeyValuePair<string, DateTime>? selectedUserSymbol;
        public KeyValuePair<string, DateTime>? SelectedUserSymbol
        {
            get => selectedUserSymbol;
            set { selectedUserSymbol = value ?? (SelectedUserSymbols?.Count > 0 ? SelectedUserSymbols.First() : new()); RaisePropertyChangedEvent(nameof(SelectedUserSymbol)); }
        }

        private string? addUserString;
        public string? AddUserString
        {
            get => addUserString;
            set { addUserString = value; RaisePropertyChangedEvent(nameof(AddUserString), nameof(IsAddUserButtonEnabled)); }
        }

        private string? addUserSymbolString;
        public string? AddUserSymbolString
        {
            get => addUserSymbolString;
            set { addUserSymbolString = value; RaisePropertyChangedEvent(nameof(AddUserSymbolString), nameof(IsAddUserSymbolButtonEnabled)); }
        }

        private int? addUserDays;
        public int AddUserDays
        {
            get => addUserDays ?? 30;
            set { addUserDays = value; RaisePropertyChangedEvent(nameof(AddUserDays), nameof(IsAddUserButtonEnabled)); }
        }

        private string? addSymbolString;
        public string? AddSymbolString
        {
            get => addSymbolString;
            set { addSymbolString = value; RaisePropertyChangedEvent(nameof(AddSymbolString), nameof(IsAddSymbolButtonEnabled)); }
        }

        public bool IsAddUserSymbolButtonEnabled => !string.IsNullOrEmpty(addUserSymbolString);
        public bool IsAddUserButtonEnabled => !string.IsNullOrEmpty(addUserString);
        public bool IsAddSymbolButtonEnabled => !string.IsNullOrEmpty(addSymbolString);

        //Groups
        public static List<string>? GroupIds
        {
            get => Settings.TelegramSettings.RSIGroups;
            set => Settings.TelegramSettings.RSIGroups = value ?? new();
        }

        private string? selectedGroup;
        public string? SelectedGroup
        {
            get => selectedGroup;
            set { selectedGroup = value; RaisePropertyChangedEvent(nameof(SelectedGroup), nameof(IsDelGroupButtonEnabled)); }
        }

        private string? addGroupString;
        public string? AddGroupString
        {
            get => addGroupString;
            set { addGroupString = value; RaisePropertyChangedEvent(nameof(AddGroupString), nameof(IsAddGroupButtonEnabled)); }
        }

        public bool IsAddGroupButtonEnabled => !string.IsNullOrEmpty(addGroupString);
        public bool IsDelGroupButtonEnabled => !string.IsNullOrEmpty(SelectedGroup);
        #endregion

        #region Telegram Messages
        private string? message;
        public string Message
        {
            get => message ?? "";
            set { message = value; RaisePropertyChangedEvent(nameof(Message)); }
        }
        #endregion

        #region Indicator Settings
        private int interval;
        public int Interval
        {
            get => interval;
            set { interval = value; RaisePropertyChangedEvent(nameof(Interval)); }
        }

        private string key;
        public string Key
        {
            get => key;
            set { key = value; RaisePropertyChangedEvent(nameof(Key)); }
        }
        #endregion
    }
}
