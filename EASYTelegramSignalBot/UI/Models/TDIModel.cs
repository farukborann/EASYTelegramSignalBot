using EASYTelegramSignalBot.Database;
using LiveCharts;
using LiveCharts.Defaults;
using LiveCharts.Wpf;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using WpfClient.MVVM;
using System.Windows.Media;
using EASYTelegramSignalBot.Finance.Models;
using EASYTelegramSignalBot.Database.Models;

namespace EASYTelegramSignalBot.Models
{
    public class TDIModel : ObservableObject
    {
        public TDIModel()
        {
            KlineSeries = new() { Values = new ChartValues<OhlcPoint>() };
            KlineSeriesCollection = new()
            {
                KlineSeries
            };

            FastMA = new()   { Title = "RSI Price Line", Stroke=Brushes.Green, PointGeometrySize=0, Values = new ChartValues<double>(), Fill = Brushes.Transparent };
            SlowMA = new()   { Title = "Trade Signal Line", Stroke = Brushes.Red, PointGeometrySize = 0,Values = new ChartValues<double>(), Fill = Brushes.Transparent };
            UpVB = new()     { Title = "Up Votality Band", Stroke = Brushes.Blue, PointGeometrySize = 0, Values = new ChartValues<double>(), Fill = Brushes.Transparent };
            MiddleVB = new() { Title = "Middle Votality Band", Stroke = Brushes.Yellow, PointGeometrySize = 0, Values = new ChartValues<double>(), Fill = Brushes.Transparent };
            DownVB = new()   { Title = "Down Votality Band", Stroke = Brushes.Blue, PointGeometrySize = 0, Values = new ChartValues<double>(), Fill = Brushes.Transparent };
            IndicatorsSeriesCollection = new()
            {
                FastMA,
                SlowMA,
                UpVB,
                MiddleVB,
                DownVB
            };
        }

        /* LiveCharts */
        public string UISymbol { get; set; }
        public SeriesCollection KlineSeriesCollection { get; set; }
        public SeriesCollection IndicatorsSeriesCollection { get; set; }
        public CandleSeries KlineSeries { get; set; }
        public LineSeries FastMA {get; set; }
        public LineSeries SlowMA { get; set; }
        public LineSeries UpVB { get; set; }
        public LineSeries MiddleVB { get; set; }
        public LineSeries DownVB { get; set; }

        private List<string> labels;
        public List<string> Labels
        {
            get { return labels ??= new(); }
            set
            {
                labels = value;
                OnPropertyChanged(nameof(Labels));
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
        /* Live Charts End */

        private ObservableCollection<User> users { get; set; }
        public ObservableCollection<User> Users
        {
            get
            {
                Connection.Context.Users.Load();
                return users ??= Connection.Context.Users.Local.ToObservableCollection();
            }
            set
            {
                users = value;
                RaisePropertyChangedEvent(nameof(Users));
            }
        }

        private User? selectedUser { get; set; }
        public User? SelectedUser
        {
            get
            {
                return selectedUser;
            }
            set
            {
                selectedUser = value;
                RaisePropertyChangedEvent(nameof(SelectedUser));
            }
        }

        private ObservableCollection<Indicator> symbols { get; set; }
        public ObservableCollection<Indicator> Symbols
        {
            get
            {
                return symbols ??= new();
            }
            set
            {
                symbols = value;
                RaisePropertyChangedEvent(nameof(Symbols));
            }
        }


        private Indicator? selectedSymbol { get; set; }
        public Indicator? SelectedSymbol
        {
            get
            {
                return selectedSymbol;
            }
            set
            {
                selectedSymbol = value;
                RaisePropertyChangedEvent(nameof(SelectedSymbol));
            }
        }

        private string addUserString { get; set; }
        public string AddUserString
        {
            get
            {
                if (string.IsNullOrEmpty(addUserString)) return "";
                return addUserString;
            }
            set
            {
                addUserString = value;
                RaisePropertyChangedEvent(nameof(AddUserString));
                RaisePropertyChangedEvent(nameof(IsAddUserButtonEnabled));
            }
        }

        private int? addUserDays { get; set; }
        public int AddUserDays
        {
            get
            {
                return addUserDays ?? 30;
            }
            set
            {
                addUserDays = value < 1 ? 1 : value;
                RaisePropertyChangedEvent(nameof(AddUserDays));
                RaisePropertyChangedEvent(nameof(IsAddUserButtonEnabled));
            }
        }

        public bool? IsAddUserButtonEnabled
        {
            get
            {
                if (string.IsNullOrEmpty(addUserString)) return false;
                return true;
            }
        }

        private string addSymbolString { get; set; }
        public string AddSymbolString
        {
            get
            {
                if (string.IsNullOrEmpty(addSymbolString)) return "";
                return addSymbolString;
            }
            set
            {
                addSymbolString = value;
                RaisePropertyChangedEvent(nameof(AddSymbolString));
                RaisePropertyChangedEvent(nameof(IsAddSymbolButtonEnabled));
            }
        }

        public bool? IsAddSymbolButtonEnabled
        {
            get
            {
                if (string.IsNullOrEmpty(addSymbolString)) return false;
                return true;
            }
        }
    }
}
