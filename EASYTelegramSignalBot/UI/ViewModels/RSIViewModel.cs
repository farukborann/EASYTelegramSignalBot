using Binance.Net.Enums;
using EASYTelegramSignalBot.Database;
using EASYTelegramSignalBot.Database.Models;
using EASYTelegramSignalBot.Finance;
using EASYTelegramSignalBot.Finance.Binance;
using EASYTelegramSignalBot.Finance.Indicators.RSI;
using EASYTelegramSignalBot.Finance.Models;
using EASYTelegramSignalBot.Models;
using EASYTelegramSignalBot.UI.Helpers;
using LiveCharts;
using LiveCharts.Defaults;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace EASYTelegramSignalBot.ViewModels
{
    internal class RSIViewModel : UserControl
    {
        public ICommand AddUserCommand { get; set; }
        public ICommand DelUserCommand { get; set; }
        public ICommand SetUISymbolCommand { get; set; }
        public ICommand AddSymbolCommand { get; set; }
        public ICommand AddAllSymbolsCommand { get; set; }
        public ICommand DelSymbolCommand { get; set; }
        public ICommand AddUserSymbolCommand { get; set; }
        public ICommand DelUserSymbolCommand { get; set; }
        public ICommand AddGroupCommand { get; set; }
        public ICommand DelGroupCommand { get; set; }
        public ICommand SaveSettingsCommand { get; set; }

        public RSIModel Model { get; set; }

        public RSIViewModel()
        {
            Model = new();

            AddUserCommand = new DelegateCommand((o) => AddUser());
            DelUserCommand = new DelegateCommand((o) => DelUser());
            SetUISymbolCommand = new DelegateCommand((o) => SetUISymbol());
            AddSymbolCommand = new DelegateCommand((o) => AddSymbol());
            AddAllSymbolsCommand = new DelegateCommand((o) => AddAllSymbols());
            DelSymbolCommand = new DelegateCommand((o) => DelSymbol());
            AddGroupCommand = new DelegateCommand((o) => AddGroup());
            DelGroupCommand = new DelegateCommand((o) => DelGroup());
            SaveSettingsCommand = new DelegateCommand((o) => SaveSettings());

            LoadSettings();

            SetSubscriptions();
        }

        private void SetSubscriptions()
        {
            foreach (string? symbol in Settings.BotsSettings.RSISettings.Symbols.ToList())
            {
                try
                {
                    Model.Symbols.Add(new RSI(symbol, Model.KlineInterval, (string symbol, RSIResult values) => { }, SendSignalMessage, true) { });
                }
                catch (Exception ex)
                {
                    MessageBoxResult deleteSymbol = MessageBox.Show($"{symbol} eklenirken bir hata meydana geldi : {ex.Message}\nSembol silinsin mi ?", "Hata", MessageBoxButton.YesNo, MessageBoxImage.Error);
                    if (deleteSymbol == MessageBoxResult.Yes)
                    {
                        Settings.BotsSettings.RSISettings.Symbols.Remove(symbol);
                        Settings.SaveSettings();
                    }
                }
            }
            UILoader.Instance.SetPageReady("RSI", () => Continue());
        }

        private Task Continue()
        {
            foreach (RSI? symbol in Model.Symbols) symbol.Continue();
            return Task.CompletedTask;
        }

        #region LiveCharts
        public void UpdateUI(string symbol, RSIResult Values)
        {
            if (symbol != Model.UISymbol) return;

            List<Kline>? Klines = Values.Klines.ToList();
            UpdateKlines(Klines);

            List<object>? RSI = Values.RSI.Select(x => (object)x).ToList();
            UpdateIndicators(Klines, RSI);
        }

        public void SetUISymbol()
        {
            if (Model.SelectedSymbol == null) return;
            if (Model.SelectedSymbol.Symbol == Model.UISymbol) return;
            if (Model.Symbols.Count < 1) return;

            if (Model.Symbols.Any(x => x.Symbol == Model.UISymbol))
            {
                Model.Symbols.First(x => x.Symbol == Model.UISymbol).UpdateAction = (string symbol, RSIResult values) => { };
            }
            Model.KlineSeriesCollection.ToList().ForEach(x => x.Values.Clear());
            Model.IndicatorsSeriesCollection.ToList().ForEach(x => x.Values.Clear());
            Model.UISymbol = Model.SelectedSymbol.Symbol;
            Model.Symbols.First(x => x.Symbol == Model.UISymbol).UpdateAction = UpdateUI;
            Model.KlineSeries.Title = Model.UISymbol;
        }

        public void UpdateKlines(IEnumerable<Kline> Klines)
        {
            if (Model.KlineSeries.Values.Count == 0)
            {
                Model.Labels = Klines.Select(x => x._OpenDate.ToString("h:mm")).ToList();
                Model.KlineSeries.Values.AddRange(Klines.Select(x => new OhlcPoint((double)x._Open, (double)x._High, (double)x._Low, (double)x._Close)).ToList());
                return;
            }

            if (Model.Labels.Last() == Klines.Last()._OpenDate.ToString("h:mm"))
            {
                Kline? LastKline = Klines.Last();
                OhlcPoint? LastChartKline = (OhlcPoint?)Model.KlineSeriesCollection[0].Values[^1];

                if (LastChartKline == null) return;
                LastChartKline.Close = (double)LastKline._Close;
                if (LastChartKline.High < (double)LastKline._High) LastChartKline.High = (double)LastKline._High;
                if (LastChartKline.Low < (double)LastKline._Low) LastChartKline.Low = (double)LastKline._Low;
                return;
            }

            Model.Labels.RemoveAt(0);
            Model.KlineSeriesCollection[0].Values.RemoveAt(0);

            Model.Labels.Add(Klines.Last()._OpenDate.ToString("h:mm"));
            Model.KlineSeriesCollection[0].Values.Add(new OhlcPoint((double)Klines.Last()._Open, (double)Klines.Last()._High, (double)Klines.Last()._Low, (double)Klines.Last()._Close));
        }

        public void UpdateIndicators(IEnumerable<Kline> Klines, IEnumerable<object> RSI)
        {
            UpdateIndicator(Klines, Model.RSI.Values, RSI);
        }

        private void UpdateIndicator(IEnumerable<Kline> Klines, IChartValues values, IEnumerable<object> newValues)
        {
            if (values.Count == 0)
            {
                values.AddRange(newValues.Select(x => (object)Convert.ToDouble(x)));
                return;
            }

            if (Model.Labels.Last() == Klines.Last()._OpenDate.ToString("h:mm"))
            {
                values[^1] = newValues.Last();
                return;
            }

            values.Add(newValues.Last());
        }
        #endregion

        #region Users And Groups
        public void UserSymbolsListSelectionChanged()
        {
            Model.AddUserSymbolString = Model.SelectedUserSymbol?.Key;
        }

        public void AddUser()
        {
            try
            {
                if (!Connection.Context.Users.Any(x => x.Username == Model.AddUserString))
                {
                    User? user = new User(Model.AddUserString ?? "") { };
                    Connection.Context.CreateUser(user);
                    Model.SelectedUser = user;
                    MessageBox.Show("Kullanıcı başarıyla eklendi.", "Kullanıcı Eklendi", MessageBoxButton.OK);
                }
                else
                {
                    User user = Connection.Context.Users.First(x => x.Username == Model.AddUserString);
                    Model.SelectedUser = user;
                }
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
                Connection.Context.DeleteUser(Model.SelectedUser);
                Connection.Context.SaveChanges();

                MessageBox.Show("Kullanıcı başarıyla silindi.", "Kullanıcı Silindi", MessageBoxButton.OK);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Bir hata meydana geldi : {ex.Message}", "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void AddGroup()
        {
            if (string.IsNullOrEmpty(Model.AddGroupString)) return;
            Settings.TelegramSettings.RSIGroups.Add(Model.AddGroupString);
            Settings.SaveSettings();
            Model.GroupIds?.Add(Model.AddGroupString);
            MessageBox.Show("Grup başarıyla eklendi", "Grup Eklendi", MessageBoxButton.OK);
        }

        public void DelGroup()
        {
            Settings.TelegramSettings.RSIGroups.Remove(Model.SelectedGroup ?? "");
            Settings.SaveSettings();
            Model.GroupIds?.Remove(Model.SelectedGroup ?? "");
            MessageBox.Show("Grup başarıyla silindi", "Grup Silindi", MessageBoxButton.OK);
        }
        #endregion  

        #region Symbols
        public void DelSymbol()
        {
            if (Model.SelectedSymbol == null) return;
            string? symbol = Model.SelectedSymbol.Symbol;

            Settings.BotsSettings.RSISettings.Symbols.Remove(Model.SelectedSymbol.Symbol);
            Model.SelectedSymbol.Dispose();

            Settings.BotsSettings.RSISettings.Symbols.Remove(Model.SelectedSymbol.Symbol);
            Settings.SaveSettings();

            Model.Symbols.Remove(Model.SelectedSymbol);


            if (Model.UISymbol == symbol && Model.Symbols.Count > 0)
            {
                Model.SelectedSymbol = Model.Symbols[0];
                SetUISymbol();
            }
        }

        public void AddSymbol()
        {
            try
            {
                if (Model.Symbols.Any(x => x.Symbol == Model.AddSymbolString))
                {
                    MessageBox.Show("Bu sembol zaten mevcut.", "Sembol mevcut", MessageBoxButton.OK, MessageBoxImage.Information);
                    return;
                }

                _AddSymbol(Model.AddSymbolString ?? "");
                MessageBox.Show("Sembol başarıyla eklendi.", "Sembol Eklendi", MessageBoxButton.OK);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Bir hata meydana geldi : {ex.Message}", "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void _AddSymbol(string symbol, bool isPaused = false)
        {
            Model.Symbols.Add(new RSI(symbol, Model.KlineInterval, (string symbol, RSIResult values) => { }, SendSignalMessage, isPaused: isPaused) { });
            Settings.BotsSettings.RSISettings.Symbols.Add(symbol);
            Settings.SaveSettings();
        }

        public Task AddAllSymbols()
        {
            Model.Symbols.ToList().ForEach(x => x.Dispose());
            Model.Symbols.Clear();
            Settings.BotsSettings.RSISettings.Symbols.Clear();
            StaticBinance.ExchangeInfos.Spot.ToList().ForEach(x =>
            {
                try
                {
                    if (!x.Name.EndsWith("USDT")) return;
                    _AddSymbol(x.Name, true);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"{x.Name} eklenirken bir hata meydana geldi : {ex.Message}", "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
                }

                foreach (RSI? symbol in Model.Symbols)
                {
                    symbol.Continue();
                }
            });

            return Task.Delay(0);
        }
        #endregion 

        #region Telegram Messages
        public void SendSignalMessage(string symbol, RSIResult values, Enums.SignalType type)
        {
            string message = type switch
            {
                Enums.SignalType.UpperLine => Settings.BotsSettings.RSISettings.SignalMessages.Overbought,
                Enums.SignalType.UnderLine => Settings.BotsSettings.RSISettings.SignalMessages.Oversold,
                Enums.SignalType.BetweenLines => Settings.BotsSettings.RSISettings.SignalMessages.BetweenLevels,
                _ => "",
            };

            if (string.IsNullOrEmpty(message)) return;

            Binance.Net.Objects.Models.Spot.BinanceSymbol? exchangeInfo = StaticBinance.ExchangeInfos.Spot.First(x => x.Name == symbol);
            Kline? lastKline = values.Klines.Last();

            var tickSize = exchangeInfo.PriceFilter?.TickSize ?? (decimal)0.00000001;

            string priceTrend = values.Klines[^2].Close > values.Klines[^1].Close ? " ⬇️" : " ⬆️";
            string price = Binance.Net.BinanceHelpers.FloorPrice(tickSize, lastKline.Close).ToString() + priceTrend;

            string rsi = Math.Round(values.RSI.Last(), 2).ToString();

            string periotShortString = Model.KlineInterval switch
            {
                KlineInterval.OneSecond => "1sn",
                KlineInterval.OneMinute => "1dk",
                KlineInterval.ThreeMinutes => "3dk",
                KlineInterval.FiveMinutes => "5dk",
                KlineInterval.FifteenMinutes => "15dk",
                KlineInterval.ThirtyMinutes => "30dk",
                KlineInterval.OneHour => "1s",
                KlineInterval.TwoHour => "2s",
                KlineInterval.FourHour => "4s",
                KlineInterval.SixHour => "6s",
                KlineInterval.EightHour => "8s",
                KlineInterval.TwelveHour => "12s",
                KlineInterval.OneDay => "1g",
                KlineInterval.ThreeDay => "3g",
                KlineInterval.OneWeek => "1h",
                KlineInterval.OneMonth => "1a",
                _ => $"{(int)Model.KlineInterval / 3600}s"
            };

            string periotLongString = Model.KlineInterval switch
            {
                KlineInterval.OneSecond => "1 Saniye",
                KlineInterval.OneMinute => "1 Dakika",
                KlineInterval.ThreeMinutes => "3 Dakika",
                KlineInterval.FiveMinutes => "5 Dakika",
                KlineInterval.FifteenMinutes => "15 Dakika",
                KlineInterval.ThirtyMinutes => "30 Dakika",
                KlineInterval.OneHour => "1 Saat",
                KlineInterval.TwoHour => "2 Saat",
                KlineInterval.FourHour => "4 Saat",
                KlineInterval.SixHour => "6 Saat",
                KlineInterval.EightHour => "8 Saat",
                KlineInterval.TwelveHour => "12 Saat",
                KlineInterval.OneDay => "1 Gün",
                KlineInterval.ThreeDay => "3 Gün",
                KlineInterval.OneWeek => "1 Hafta",
                KlineInterval.OneMonth => "1 Ay",
                _ => $"{(int)Model.KlineInterval / 3600} Saat"
            };

            message = message.Replace("{Symbol}", symbol)
                .Replace("{Price}", price)
                .Replace("{RSI}", rsi)
                .Replace("{PeriotLong}", periotLongString)
                .Replace("{PeriotShort}", periotShortString);

            Telegram.Bots.RSI.SendMessages(message, symbol);
        }
        #endregion

        #region Indicator Settings
        public void SaveSettings()
        {
            Settings.BotsSettings.RSISettings.SignalMessages.Oversold = Model.OversoldSignalString;
            Settings.BotsSettings.RSISettings.SignalMessages.Overbought = Model.OverboughtSignalString;
            Settings.BotsSettings.RSISettings.SignalMessages.BetweenLevels = Model.BetweenLevelsSignalString;

            Settings.BotsSettings.RSISettings.RSIPeriot = Model.RSIPeriot;
            Settings.BotsSettings.RSISettings.RSIOversoldLevel = Model.RSIOversoldLevel;
            Settings.BotsSettings.RSISettings.RSIOverboughtLevet = Model.RSIOverboughtLevel;

            Settings.BotsSettings.RSISettings.MinSignalPeriot = Model.MinSignalPeriot;
            Settings.BotsSettings.TDISettings.KlineInterval = Enum.GetName(typeof(KlineInterval), Model.KlineInterval);

            Settings.SaveSettings();

            MessageBox.Show("Ayarlar başarıyla kaydedildi.", "Ayarlar kaydedildi", MessageBoxButton.OK);
        }

        public void LoadSettings()
        {
            Model.OverboughtSignalString = Settings.BotsSettings.RSISettings.SignalMessages.Overbought;
            Model.OversoldSignalString = Settings.BotsSettings.RSISettings.SignalMessages.Oversold;
            Model.BetweenLevelsSignalString = Settings.BotsSettings.RSISettings.SignalMessages.BetweenLevels;

            Model.RSIPeriot = Settings.BotsSettings.RSISettings.RSIPeriot;
            Model.RSIOversoldLevel = Settings.BotsSettings.RSISettings.RSIOversoldLevel;
            Model.RSIOverboughtLevel = Settings.BotsSettings.RSISettings.RSIOverboughtLevet;

            Model.MinSignalPeriot = Settings.BotsSettings.RSISettings.MinSignalPeriot;
        }

        public void ChangeKlineInterval()
        {
            MessageBoxResult change = MessageBox.Show("Bu indikatöre ait tüm sembollerin candletick periyodu değişecektir.\nBu işlem sembol sayısına göre biraz zaman alabilir.\nDevam etmek istediğinizden emin misiniz ?", "Periyot değişikliği", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (change == MessageBoxResult.No)
            {
                Model.KlineInterval = Model.KlineIntervals.First(x => x.Equals(Model.Symbols.First().Interval));
                return;
            }

            Model.Symbols.ToList().ForEach(x => x.ChangeInterval(Model.KlineInterval));

            SaveSettings();
        }
        #endregion
    }
}
