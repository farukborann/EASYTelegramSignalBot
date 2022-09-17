using Binance.Net.Enums;
using EASYTelegramSignalBot.Database;
using EASYTelegramSignalBot.Database.Models;
using EASYTelegramSignalBot.Finance;
using EASYTelegramSignalBot.Finance.Binance;
using EASYTelegramSignalBot.Finance.Indicators;
using EASYTelegramSignalBot.Finance.Models;
using EASYTelegramSignalBot.Models;
using EASYTelegramSignalBot.Telegram;
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
    internal class TDIViewModel : UserControl
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

        public TDIModel Model { get; set; }

        public TDIViewModel()
        {
            Model = new();

            AddUserCommand = new DelegateCommand((o) => AddUser());
            DelUserCommand = new DelegateCommand((o) => DelUser());
            SetUISymbolCommand = new DelegateCommand((o) => SetUISymbol());
            AddSymbolCommand = new DelegateCommand((o) => AddSymbol());
            AddAllSymbolsCommand = new DelegateCommand((o) => AddAllSymbols());
            DelSymbolCommand = new DelegateCommand((o) => DelSymbol());
            AddUserSymbolCommand = new DelegateCommand((o) => AddUserSymbol());
            DelUserSymbolCommand = new DelegateCommand((o) => DelUserSymbol());
            AddGroupCommand = new DelegateCommand((o) => AddGroup());
            DelGroupCommand = new DelegateCommand((o) => DelGroup());
            SaveSettingsCommand = new DelegateCommand((o) => SaveSettings());

            LoadSettings();

            SetSubscriptions();
        }

        private void SetSubscriptions()
        {
            foreach (string? symbol in Settings.BotsSettings.TDISettings.Symbols.ToList())
            {
                try
                {
                    Model.Symbols.Add(new TDI(symbol, Model.KlineInterval, (string symbol, Dictionary<string, List<object>> values) => { }, SendSignalMessage, true) { });
                }
                catch (Exception ex)
                {
                    MessageBoxResult deleteSymbol = MessageBox.Show($"TDI {symbol} eklenirken bir hata meydana geldi : {ex.Message}\nSembol silinsin mi ?", "Hata", MessageBoxButton.YesNo, MessageBoxImage.Error);
                    if (deleteSymbol == MessageBoxResult.Yes)
                    {
                        Settings.BotsSettings.TDISettings.Symbols.Remove(symbol);
                        Settings.SaveSettings();
                    }
                }
            }
            UILoader.Instance.SetPageReady("TDI", () => Continue());
        }

        private Task Continue()
        {
            foreach (Indicator? symbol in Model.Symbols) symbol.Continue();
            return Task.CompletedTask;
        }

        #region LiveCharts
        public void UpdateUI(string symbol, Dictionary<string, List<object>> Values)
        {
            if (symbol != Model.UISymbol) return;

            List<Kline>? Klines = Values["Klines"].Select(x => (Kline)x).ToList();
            UpdateKlines(Klines);

            List<object>? FastMA = Values["FastMA"].ToList();
            List<object>? SlowMA = Values["SlowMA"].ToList();
            List<object>? UpVB = Values["UpVB"].ToList();
            List<object>? MiddleVB = Values["MiddleVB"].ToList();
            List<object>? DownVB = Values["DownVB"].ToList();
            UpdateIndicators(Klines, FastMA, SlowMA, UpVB, MiddleVB, DownVB);
        }

        public void SetUISymbol()
        {
            if (Model.SelectedSymbol == null) return;
            if (Model.SelectedSymbol.Symbol == Model.UISymbol) return;
            if (Model.Symbols.Count < 1) return;

            if (Model.Symbols.Any(x => x.Symbol == Model.UISymbol))
            {
                Model.Symbols.First(x => x.Symbol == Model.UISymbol).UpdateAction = (string symbol, Dictionary<string, List<object>> values) => { };
            }
            Model.KlineSeriesCollection.ToList().ForEach(x => x.Values.Clear());
            Model.IndicatorsSeriesCollection.ToList().ForEach(x => x.Values.Clear());
            Model.UISymbol = Model.SelectedSymbol.Symbol;
            UpdateUI(Model.UISymbol, Model.Symbols.First(x => x.Symbol == Model.UISymbol).Values);
            Model.Symbols.First(x => x.Symbol == Model.UISymbol).UpdateAction = UpdateUI;
            Model.KlineSeries.Title = Model.UISymbol;
        }

        public void UpdateKlines(IEnumerable<Kline> Klines)
        {
            if (Model.KlineSeries.Values.Count == 0)
            {
                Model.KlineSeries.Values.AddRange(Klines.Select(x => new OhlcPoint((double)x._Open, (double)x._High, (double)x._Low, (double)x._Close)).ToList());
                Model.Labels = Klines.Select(x => x._OpenDate.ToString("h:mm")).ToList();
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

        public void UpdateIndicators(IEnumerable<Kline> Klines, IEnumerable<object> FastMA, IEnumerable<object> SlowMA, IEnumerable<object> UpVB, IEnumerable<object> MiddleVB, IEnumerable<object> DownVB)
        {
            UpdateIndicator(Klines, Model.FastMA.Values, FastMA);
            UpdateIndicator(Klines, Model.SlowMA.Values, SlowMA);
            UpdateIndicator(Klines, Model.UpVB.Values, UpVB);
            UpdateIndicator(Klines, Model.MiddleVB.Values, MiddleVB);
            UpdateIndicator(Klines, Model.DownVB.Values, DownVB);
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
                    User? user = new User(Model.AddUserString) { TDI = true };
                    Connection.Context.CreateUser(user);
                    Model.SelectedUser = user;
                    MessageBox.Show("Kullanıcı başarıyla eklendi.", "Kullanıcı Eklendi", MessageBoxButton.OK);
                }
                else if (Connection.Context.Users.Any(x => x.Username == Model.AddUserString && x.TDI == false))
                {
                    User? user = Connection.Context.Users.First(x => x.Username == Model.AddUserString && x.TDI == false);
                    user.TDI = true;
                    Connection.Context.SaveChanges();
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
                User? user = Connection.Context.Users.First(x => x.Username == Model.SelectedUser.Username);
                user.TDI = false;
                Connection.Context.SaveChanges();
                Model.SelectedUser = user;

                MessageBox.Show("Kullanıcı başarıyla silindi.", "Kullanıcı Silindi", MessageBoxButton.OK);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Bir hata meydana geldi : {ex.Message}", "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void AddUserSymbol()
        {
            try
            {
                if (Model.SelectedUser == null) return;
                bool showMessage = false;

                if (Model.SelectedUser.TDISymbols.Any(x => x.Key.Equals(Model.AddUserSymbolString)))
                {
                    int addDays = Model.AddUserDays == 0 ? 999999 : Model.AddUserDays;

                    DateTime newDate = Model.SelectedUser.TDISymbols.First(x => x.Key.Equals(Model.AddUserSymbolString)).Value >= DateTime.Now ?
                        Model.SelectedUser.TDISymbols.First(x => x.Key.Equals(Model.AddUserSymbolString)).Value.AddDays(addDays) :
                        DateTime.Now.AddDays(addDays);

                    Model.SelectedUser.TDISymbols[Model.AddUserSymbolString ?? ""] = newDate;
                }
                else
                {
                    Model.SelectedUser.TDISymbols.Add(Model.AddUserSymbolString ?? "", DateTime.Now.AddDays(Model.AddUserDays));
                    showMessage = true;
                }

                Model.SelectedUser.SaveUserSymbols();
                Connection.Context.SaveChanges();
                Model.SelectedUserSymbols = new(Model.SelectedUser.TDISymbols);

                if (showMessage) MessageBox.Show("Kullanıcıya sembol başarıyla eklendi.", "Sembol Eklendi", MessageBoxButton.OK);

            }
            catch (Exception ex)
            {
                MessageBox.Show($"Bir hata meydana geldi : {ex.Message}", "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void DelUserSymbol()
        {
            try
            {
                if (Model.SelectedUser == null || Model.SelectedUserSymbols?.Count == 0) return;

                Model.SelectedUser.TDISymbols.Remove(Model.SelectedUserSymbol?.Key ?? "");
                Model.SelectedUser.SaveUserSymbols();
                Connection.Context.SaveChanges();

                Model.SelectedUserSymbols = new(Model.SelectedUser.TDISymbols);
                MessageBox.Show("Sembol başarıyla silindi.", "Kullanıcı Silindi", MessageBoxButton.OK);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Bir hata meydana geldi : {ex.Message}", "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        public void AddGroup()
        {
            if (string.IsNullOrEmpty(Model.AddGroupString)) return;
            Settings.TelegramSettings.TDIGroups.Add(Model.AddGroupString);
            Settings.SaveSettings();
            MessageBox.Show("Grup başarıyla eklendi", "Grup Eklendi", MessageBoxButton.OK);
        }

        public void DelGroup()
        {
            Settings.TelegramSettings.TDIGroups.Remove(Model.SelectedGroup ?? "");
            Settings.SaveSettings();
            MessageBox.Show("Grup başarıyla silindi", "Grup Silindi", MessageBoxButton.OK);
        }
        #endregion  

        #region Symbols
        public void DelSymbol()
        {
            if (Model.SelectedSymbol == null) return;
            string? symbol = Model.SelectedSymbol.Symbol;

            Settings.BotsSettings.TDISettings.Symbols.Remove(Model.SelectedSymbol.Symbol);
            Model.SelectedSymbol.Dispose();

            Settings.BotsSettings.TDISettings.Symbols.Remove(Model.SelectedSymbol.Symbol);
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
                    Model.SelectedSymbol = Model.Symbols.First(x => x.Symbol == Model.AddSymbolString);
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

        private void _AddSymbol(string symbol)
        {
            Model.Symbols.Add(new TDI(symbol, Model.KlineInterval, (string symbol, Dictionary<string, List<object>> values) => { }, SendSignalMessage) { });
            Settings.BotsSettings.TDISettings.Symbols.Add(symbol);
            Settings.SaveSettings();
        }

        public Task AddAllSymbols()
        {
            CryptoExchange.Net.Objects.WebCallResult<Binance.Net.Objects.Models.Spot.BinanceExchangeInfo>? exchangeInfos = StaticBinance.Client.SpotApi.ExchangeData.GetExchangeInfoAsync().Result;
            Model.Symbols.Clear();
            Settings.BotsSettings.TDISettings.Symbols.Clear();
            exchangeInfos.Data.Symbols.ToList().ForEach(x =>
            {
                try
                {
                    _AddSymbol(x.Name);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"{x.Name} eklenirken bir hata meydana geldi : {ex.Message}", "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            });

            return Task.Delay(0);
        }
        #endregion 

        #region Telegram Messages
        public void SendSignalMessage(string symbol, Dictionary<string, List<object>> values, Enums.SignalType type)
        {
            string message = type switch
            {
                Enums.SignalType.StrongSell => Settings.BotsSettings.TDISettings.SignalMessages.Sell + "\n(Güçlü Sat)",
                Enums.SignalType.MediumSell => Settings.BotsSettings.TDISettings.SignalMessages.Sell + "\n(Sat)",
                Enums.SignalType.StrongBuy => Settings.BotsSettings.TDISettings.SignalMessages.Buy + "\n(Güçlü Al)",
                Enums.SignalType.MediumBuy => Settings.BotsSettings.TDISettings.SignalMessages.Buy + "\n(Al)",
                _ => "",
            };

            if (string.IsNullOrEmpty(message)) return;

            message = message.Replace("{Symbol}", symbol).Replace("{Price}", Math.Round(((Kline)values["Klines"].Last()).Close, 2).ToString());

            Telegram.Bots.TDI.SendMessages(message, symbol);
        }
        #endregion

        #region Indicator Settings
        public void SaveSettings()
        {
            Settings.BotsSettings.TDISettings.SignalMessages.Sell = Model.SellSignalString;
            Settings.BotsSettings.TDISettings.SignalMessages.Buy = Model.BuySignalString;
            Settings.BotsSettings.TDISettings.SignalMessages.Exit = Model.ExitSignalString;

            Settings.BotsSettings.TDISettings.RSIPeriot = Model.RSIPeriot;
            Settings.BotsSettings.TDISettings.RSIPLPeriot = Model.RSIPLPeriot;
            Settings.BotsSettings.TDISettings.VotalityBandPeriot = Model.VBPeriot;
            Settings.BotsSettings.TDISettings.TSLPeriot = Model.TSLPeriot;
            Settings.BotsSettings.TDISettings.RSIOversoldLevel = Model.RSIOversoldLevel;
            Settings.BotsSettings.TDISettings.RSIOverboughtLevet = Model.RSIOverboughtLevel;

            Settings.BotsSettings.TDISettings.MinSignalPeriot = Model.MinSignalPeriot;
            Settings.BotsSettings.TDISettings.KlineInterval = Enum.GetName(typeof(KlineInterval), Model.KlineInterval);
            Settings.SaveSettings();

            MessageBox.Show("Ayarlar başarıyla kaydedildi.", "Ayarlar kaydedildi", MessageBoxButton.OK);
        }

        public void LoadSettings()
        {
            Model.SellSignalString = Settings.BotsSettings.TDISettings.SignalMessages.Sell;
            Model.BuySignalString = Settings.BotsSettings.TDISettings.SignalMessages.Buy;
            Model.ExitSignalString = Settings.BotsSettings.TDISettings.SignalMessages.Exit;

            Model.RSIPeriot = Settings.BotsSettings.TDISettings.RSIPeriot;
            Model.RSIPLPeriot = Settings.BotsSettings.TDISettings.RSIPLPeriot;
            Model.TSLPeriot = Settings.BotsSettings.TDISettings.TSLPeriot;
            Model.VBPeriot = Settings.BotsSettings.TDISettings.VotalityBandPeriot;
            Model.RSIOversoldLevel = Settings.BotsSettings.TDISettings.RSIOversoldLevel;
            Model.RSIOverboughtLevel = Settings.BotsSettings.TDISettings.RSIOverboughtLevet;

            Model.MinSignalPeriot = Settings.BotsSettings.TDISettings.MinSignalPeriot;
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
