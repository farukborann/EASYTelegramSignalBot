using EASYTelegramSignalBot.Database;
using EASYTelegramSignalBot.Database.Models;
using EASYTelegramSignalBot.Finance.Models;
using LiveCharts;
using LiveCharts.Defaults;
using LiveCharts.Wpf;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Media;
using WpfClient.MVVM;

namespace EASYTelegramSignalBot.Models
{
    public class RSIModel : ObservableObject
    {
        public RSIModel()
        {
            KlineSeries = new() { Values = new ChartValues<OhlcPoint>() };
            KlineSeriesCollection = new()
            {
                KlineSeries
            };

            RSI = new() { Title = "RSI", LineSmoothness = 0, Stroke = Brushes.Green, PointGeometrySize = 0, Values = new ChartValues<double>(), Fill = Brushes.Transparent };
            IndicatorsSeriesCollection = new()
            {
                RSI
            };
        }

        #region LiveCharts
        public string? UISymbol { get; set; }
        public SeriesCollection KlineSeriesCollection { get; set; }
        public SeriesCollection IndicatorsSeriesCollection { get; set; }
        public CandleSeries KlineSeries { get; set; }
        public LineSeries RSI { get; set; }

        private List<string>? labels;
        public List<string> Labels
        {
            get => labels ??= new();
            set
            {
                labels = value;
                RaisePropertyChangedEvent(nameof(Labels));
            }
        }
        #endregion

        #region Users And Groups
        //Users
        private ObservableCollection<User>? users;
        public ObservableCollection<User> Users
        {
            get => users ??= Connection.Context.Users.Local.ToObservableCollection();
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

        #region Symbols
        private ObservableCollection<Indicator>? symbols;
        public ObservableCollection<Indicator> Symbols
        {
            get => symbols ??= new();
            set { symbols = value; RaisePropertyChangedEvent(nameof(Symbols)); }
        }

        private Indicator? selectedSymbol;
        public Indicator? SelectedSymbol
        {
            get => selectedSymbol;
            set { selectedSymbol = value; RaisePropertyChangedEvent(nameof(SelectedSymbol)); }
        }
        #endregion

        #region Telegram Messages
        private string? oversoldSignalString;
        public string OversoldSignalString
        {
            get => oversoldSignalString ?? "";
            set { oversoldSignalString = value; RaisePropertyChangedEvent(nameof(OversoldSignalString)); }
        }

        private string? overboughtSignalString;
        public string OverboughtSignalString
        {
            get => overboughtSignalString ?? "";
            set { overboughtSignalString = value; RaisePropertyChangedEvent(nameof(OverboughtSignalString)); }
        }

        private string? betweenLevelsSignalString;
        public string BetweenLevelsSignalString
        {
            get => betweenLevelsSignalString ?? "";
            set { betweenLevelsSignalString = value; RaisePropertyChangedEvent(nameof(BetweenLevelsSignalString)); }
        }
        #endregion

        #region Indicator Settings
        private int _RSIPeriot;
        public int RSIPeriot
        {
            get => _RSIPeriot;
            set { _RSIPeriot = value; RaisePropertyChangedEvent(nameof(RSIPeriot)); }
        }

        private int _RSIOversoldLevel;
        public int RSIOversoldLevel
        {
            get => _RSIOversoldLevel;
            set { _RSIOversoldLevel = value; RaisePropertyChangedEvent(nameof(RSIOversoldLevel)); }
        }

        private int _RSIOverboughtLevel;
        public int RSIOverboughtLevel
        {
            get => _RSIOverboughtLevel;
            set { _RSIOverboughtLevel = value; RaisePropertyChangedEvent(nameof(RSIOverboughtLevel)); }
        }

        private int minSignalPeriot;
        public int MinSignalPeriot
        {
            get => minSignalPeriot;
            set { minSignalPeriot = value; RaisePropertyChangedEvent(nameof(MinSignalPeriot)); }
        }
        #endregion
    }
}
