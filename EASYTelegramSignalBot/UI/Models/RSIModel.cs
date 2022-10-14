using Binance.Net.Enums;
using EASYTelegramSignalBot.Database;
using EASYTelegramSignalBot.Database.Models;
using EASYTelegramSignalBot.Finance.Indicators.RSI;
using EASYTelegramSignalBot.UI.Helpers;
using LiveCharts;
using LiveCharts.Defaults;
using LiveCharts.Wpf;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Windows.Media;

namespace EASYTelegramSignalBot.Models
{
    public class RSIModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler? PropertyChanged;

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
                PropertyChanged?.InvokeAll(this, nameof(Labels));
            }
        }
        #endregion

        #region Users And Groups
        //Users
        private ObservableCollection<User>? users;
        public ObservableCollection<User> Users
        {
            get => users ??= Connection.Context.Users;
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
        public ObservableCollection<string>? groupIds;
        public ObservableCollection<string>? GroupIds
        {
            get { if(groupIds == null) { groupIds = new(); Settings.TelegramSettings.RSIGroups.ForEach(x => groupIds.Add(x)); } return groupIds; }
            set { groupIds = value; PropertyChanged?.InvokeAll(nameof(GroupIds)); }
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

        #region Symbols
        private ObservableCollection<RSI>? symbols;
        public ObservableCollection<RSI> Symbols
        {
            get => symbols ??= new();
            set { symbols = value; PropertyChanged?.InvokeAll(this, nameof(Symbols)); }
        }

        private RSI? selectedSymbol;
        public RSI? SelectedSymbol
        {
            get => selectedSymbol;
            set { selectedSymbol = value; PropertyChanged?.InvokeAll(this, nameof(SelectedSymbol)); }
        }
        #endregion

        #region Telegram Messages
        private string? oversoldSignalString;
        public string OversoldSignalString
        {
            get => oversoldSignalString ?? "";
            set { oversoldSignalString = value; PropertyChanged?.InvokeAll(this, nameof(OversoldSignalString)); }
        }

        private string? overboughtSignalString;
        public string OverboughtSignalString
        {
            get => overboughtSignalString ?? "";
            set { overboughtSignalString = value; PropertyChanged?.InvokeAll(this, nameof(OverboughtSignalString)); }
        }

        private string? betweenLevelsSignalString;
        public string BetweenLevelsSignalString
        {
            get => betweenLevelsSignalString ?? "";
            set { betweenLevelsSignalString = value; PropertyChanged?.InvokeAll(this, nameof(BetweenLevelsSignalString)); }
        }
        #endregion

        #region Indicator Settings
        private int _RSIPeriot;
        public int RSIPeriot
        {
            get => _RSIPeriot;
            set { _RSIPeriot = value; PropertyChanged?.InvokeAll(this, nameof(RSIPeriot)); }
        }

        private int _RSIOversoldLevel;
        public int RSIOversoldLevel
        {
            get => _RSIOversoldLevel;
            set { _RSIOversoldLevel = value; PropertyChanged?.InvokeAll(this, nameof(RSIOversoldLevel)); }
        }

        private int _RSIOverboughtLevel;
        public int RSIOverboughtLevel
        {
            get => _RSIOverboughtLevel;
            set { _RSIOverboughtLevel = value; PropertyChanged?.InvokeAll(this, nameof(RSIOverboughtLevel)); }
        }

        private int minSignalPeriot;
        public int MinSignalPeriot
        {
            get => minSignalPeriot;
            set { minSignalPeriot = value; PropertyChanged?.InvokeAll(this, nameof(MinSignalPeriot)); }
        }

        private KlineInterval? klineInterval;
        public KlineInterval KlineInterval
        {
            get => klineInterval ??= (KlineInterval)Enum.Parse(typeof(KlineInterval), Settings.BotsSettings.RSISettings.KlineInterval);
            set { klineInterval = value; PropertyChanged?.InvokeAll(this, nameof(KlineInterval)); }
        }

        public KlineInterval[] KlineIntervals => (KlineInterval[])Enum.GetValues(typeof(Binance.Net.Enums.KlineInterval));
        #endregion
    }
}
