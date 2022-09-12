using Binance.Net.Enums;
using EASYTelegramSignalBot.Database;
using EASYTelegramSignalBot.Database.Models;
using EASYTelegramSignalBot.Finance.Models;
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
    public class PACModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler? PropertyChanged;

        public PACModel()
        {
            KlineSeries = new() { Name="Klines", Values = new ChartValues<OhlcPoint>() };
            TOC = new() { Title = "Top Of Channel", LineSmoothness = 0, Stroke = Brushes.Green, PointGeometrySize = 0, Values = new ChartValues<double>(), Fill = Brushes.Transparent };
            BOC = new() { Title = "Bottom Of Channel", LineSmoothness = 0, Stroke = Brushes.Red, PointGeometrySize = 0, Values = new ChartValues<double>(), Fill = Brushes.Transparent };
            KlineSeriesCollection = new()
            {
                KlineSeries,
                TOC,
                BOC
            };

            IndicatorsSeriesCollection = new()
            {
            };
        }

        #region LiveCharts
        public string? UISymbol { get; set; }
        public SeriesCollection KlineSeriesCollection { get; set; }
        public SeriesCollection IndicatorsSeriesCollection { get; set; }
        public CandleSeries KlineSeries { get; set; }
        public LineSeries TOC { get; set; }
        public LineSeries BOC { get; set; }

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
                SelectedUserSymbols = selectedUser?.PACSymbols;
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
            get => Settings.TelegramSettings.PACGroups;
            set => Settings.TelegramSettings.PACGroups = value ?? new();
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
        private ObservableCollection<Indicator>? symbols;
        public ObservableCollection<Indicator> Symbols
        {
            get => symbols ??= new();
            set { symbols = value; PropertyChanged?.InvokeAll(this, nameof(Symbols)); }
        }

        private Indicator? selectedSymbol;
        public Indicator? SelectedSymbol
        {
            get => selectedSymbol;
            set { selectedSymbol = value; PropertyChanged?.InvokeAll(this, nameof(SelectedSymbol)); }
        }
        #endregion

        #region Telegram Messages
        private string? sellSignalString;
        public string SellSignalString
        {
            get => sellSignalString ?? "";
            set { sellSignalString = value; PropertyChanged?.InvokeAll(this, nameof(SellSignalString)); }
        }

        private string? buySignalString;
        public string BuySignalString
        {
            get => buySignalString ?? "";
            set { buySignalString = value; PropertyChanged?.InvokeAll(this, nameof(BuySignalString)); }
        }

        private string? exitSignalString;
        public string ExitSignalString
        {
            get => exitSignalString ?? "";
            set { exitSignalString = value; PropertyChanged?.InvokeAll(this, nameof(ExitSignalString)); }
        }
        #endregion

        #region Indicator Settings
        private int _SMMAPeriot;
        public int SMMAPeriot
        {
            get => _SMMAPeriot;
            set { _SMMAPeriot = value; PropertyChanged?.InvokeAll(this, nameof(SMMAPeriot)); }
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
            get => klineInterval ??= (KlineInterval)Enum.Parse(typeof(KlineInterval), Settings.BotsSettings.PACSettings.KlineInterval);
            set { klineInterval = value; PropertyChanged?.InvokeAll(this, nameof(KlineInterval)); }
        }

        public KlineInterval[] KlineIntervals => (KlineInterval[])Enum.GetValues(typeof(Binance.Net.Enums.KlineInterval));
        #endregion
    }
}
