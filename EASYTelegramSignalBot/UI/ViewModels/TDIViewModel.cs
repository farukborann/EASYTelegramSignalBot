using Binance.Net.Enums;
using EASYTelegramSignalBot.Database;
using EASYTelegramSignalBot.Database.Models;
using EASYTelegramSignalBot.Finance;
using EASYTelegramSignalBot.Finance.Binance;
using EASYTelegramSignalBot.Finance.Indicators.TDI;
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
                    Model.Symbols.Add(new TDI(symbol, Model.KlineInterval, (string symbol, TDIResult values) => { }, SendSignalMessage, true) { });
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
            foreach (TDI? symbol in Model.Symbols) symbol.Continue();
            return Task.CompletedTask;
        }

        #region LiveCharts
        public void UpdateUI(string symbol, TDIResult Values)
        {
            if (symbol != Model.UISymbol) return;

            List<Kline>? Klines = Values.Klines.ToList();
            UpdateKlines(Klines);

            List<object>? FastMA = Values.RSI_PL.Select(x => (object)x).ToList();
            List<object>? SlowMA = Values.TSL.Select(x => (object)x).ToList();
            //List<object>? UpVB = Values["UpVB"].ToList();
            //List<object>? MiddleVB = Values["MiddleVB"].ToList();
            //List<object>? DownVB = Values["DownVB"].ToList();
            //UpdateIndicators(Klines, FastMA, SlowMA, UpVB, MiddleVB, DownVB);
            UpdateIndicators(Klines, FastMA, SlowMA);
        }

        public void SetUISymbol()
        {
            if (Model.SelectedSymbol == null) return;
            if (Model.SelectedSymbol.Symbol == Model.UISymbol) return;
            if (Model.Symbols.Count < 1) return;

            if (Model.Symbols.Any(x => x.Symbol == Model.UISymbol))
            {
                Model.Symbols.First(x => x.Symbol == Model.UISymbol).UpdateAction = (string symbol, TDIResult values) => { };
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

        //public void UpdateIndicators(IEnumerable<Kline> Klines, IEnumerable<object> FastMA, IEnumerable<object> SlowMA, IEnumerable<object> UpVB, IEnumerable<object> MiddleVB, IEnumerable<object> DownVB)
        //{
        //    UpdateIndicator(Klines, Model.FastMA.Values, FastMA);
        //    UpdateIndicator(Klines, Model.SlowMA.Values, SlowMA);
        //    UpdateIndicator(Klines, Model.UpVB.Values, UpVB);
        //    UpdateIndicator(Klines, Model.MiddleVB.Values, MiddleVB);
        //    UpdateIndicator(Klines, Model.DownVB.Values, DownVB);
        //}
        public void UpdateIndicators(IEnumerable<Kline> Klines, IEnumerable<object> FastMA, IEnumerable<object> SlowMA)
        {
            UpdateIndicator(Klines, Model.FastMA.Values, FastMA);
            UpdateIndicator(Klines, Model.SlowMA.Values, SlowMA);
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
            Model.Symbols.Add(new TDI(symbol, Model.KlineInterval, (string symbol, TDIResult values) => { }, SendSignalMessage) { });
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
        public void SendSignalMessage(string symbol, TDIResult values, Enums.SignalType type)
        {
            string message = type switch
            {
                Enums.SignalType.StrongSell => Settings.BotsSettings.TDISettings.SignalMessages.Sell,
                Enums.SignalType.MediumSell => Settings.BotsSettings.TDISettings.SignalMessages.Sell,
                Enums.SignalType.StrongBuy => Settings.BotsSettings.TDISettings.SignalMessages.Buy,
                Enums.SignalType.MediumBuy => Settings.BotsSettings.TDISettings.SignalMessages.Buy,
                _ => "",
            };

            if (string.IsNullOrEmpty(message)) return;

            string signalTypeString = type switch
            {
                Enums.SignalType.StrongSell => "Güçlü Sat",
                Enums.SignalType.MediumSell => "Sat",
                Enums.SignalType.StrongBuy => "Güçlü Al",
                Enums.SignalType.MediumBuy => "Al",
                _ => "?",
            };

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
                _ => $"{(int)Model.KlineInterval / 3600}s"
            };


            Binance.Net.Objects.Models.Spot.BinanceSymbol? exchangeInfo = StaticBinance.ExchangeInfos.Spot.First(x => x.Name == symbol);
            Kline? lastKline = values.Klines.Last();

            var tickSize = exchangeInfo.PriceFilter?.TickSize ?? (decimal)0.00000001;

            string priceTrend = values.Klines[^2].Close > values.Klines[^1].Close ? " ⬇️" : " ⬆️";
            string price = Binance.Net.BinanceHelpers.FloorPrice(tickSize, lastKline.Close).ToString() + priceTrend;

            string lastBuySignalClose = "";
            if(values.LastBuySignalClose != null)
            {
                lastBuySignalClose = "\nGiriş Fiyatı  → " + Binance.Net.BinanceHelpers.FloorPrice(tickSize, (decimal)values.LastBuySignalClose).ToString();
            }

            double support, resistance;
            string supportText, resistanceText;
            if (values.PivotPoints == null) 
            {
                resistanceText = "?";
                supportText = "?";
            }
            else
            {
                support = values.PivotPoints.Last().Values.Where(x => x < (double)lastKline.Close).Max();
                supportText = Binance.Net.BinanceHelpers.FloorPrice(tickSize, (decimal)support).ToString();
            
                resistance = values.PivotPoints.Last().Values.Where(x => x > (double)lastKline.Close).Min();
                resistanceText = Binance.Net.BinanceHelpers.FloorPrice(tickSize, (decimal)resistance).ToString();
            }
            
            string rsiTrend = values.RSI[^2] > values.RSI[^1] ? " ⬇️" : " ⬆️";
            string rsi = Math.Round(values.RSI.Last(), 2).ToString() + rsiTrend;

            string rsiplTrend = values.RSI_PL[^2] > values.RSI_PL[^1] ? " ⬇️" : " ⬆️";
            string rsipl = Math.Round(values.RSI_PL.Last(), 2).ToString() + rsiplTrend;

            string tslTrend = values.TSL[^2] > values.TSL[^1] ? " ⬇️" : " ⬆️";
            string tsl = Math.Round(values.TSL.Last(), 2).ToString() + tslTrend;

            string upperbbTrend = values.UpperBB[^2] > values.UpperBB[^1] ? " ⬇️" : " ⬆️";
            string upperbb = Binance.Net.BinanceHelpers.FloorPrice(exchangeInfo.PriceFilter.TickSize, (decimal)values.UpperBB.Last()).ToString() + upperbbTrend;

            string lowerbbTrend = values.LowerBB[^2] > values.LowerBB[^1] ? " ⬇️" : " ⬆️";
            string lowerbb= Binance.Net.BinanceHelpers.FloorPrice(exchangeInfo.PriceFilter.TickSize, (decimal)values.LowerBB.Last()).ToString() + lowerbbTrend;

            string sma25Trend = values.SMA25[^2] > values.SMA25[^1] ? " ⬇️" : " ⬆️";
            string sma25 = Binance.Net.BinanceHelpers.FloorPrice(exchangeInfo.PriceFilter.TickSize, (decimal)values.SMA25.Last()).ToString() + sma25Trend;

            string sma50Trend = values.SMA50[^2] > values.SMA50[^1] ? " ⬇️" : " ⬆️";
            string sma50 = Binance.Net.BinanceHelpers.FloorPrice(exchangeInfo.PriceFilter.TickSize, (decimal)values.SMA50.Last()).ToString() + sma50Trend;

            string sma75Trend = values.SMA75[^2] > values.SMA75[^1] ? " ⬇️" : " ⬆️";
            string sma75 = Binance.Net.BinanceHelpers.FloorPrice(exchangeInfo.PriceFilter.TickSize, (decimal)values.SMA75.Last()).ToString() + sma75Trend;

            string sma100Trend = values.SMA100[^2] > values.SMA100[^1] ? " ⬇️" : " ⬆️";
            string sma100 = Binance.Net.BinanceHelpers.FloorPrice(exchangeInfo.PriceFilter.TickSize, (decimal)values.SMA100.Last()).ToString() + sma100Trend;

            message = message.Replace("{Symbol}", symbol).
                Replace("{Price}", price)
                .Replace("{SignalType}", signalTypeString)
                .Replace("{PeriotLong}", periotLongString)
                .Replace("{PeriotShort}", periotShortString)
                .Replace("{LastBuySignalClose}", lastBuySignalClose)
                .Replace("{RSI}", rsi)
                .Replace("{RSI_PL}", rsipl)
                .Replace("{TSL}", tsl)
                .Replace("{UpperBB}", upperbb)
                .Replace("{LowerBB}", lowerbb)
                .Replace("{Support}", supportText)
                .Replace("{Resistance}", resistanceText)
                .Replace("{SMA25}", sma25)
                .Replace("{SMA50}", sma50)
                .Replace("{SMA75}", sma75)
                .Replace("{SMA100}", sma100);

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
