using EASYTelegramSignalBot.Models;
using EASYTelegramSignalBot.Database;
using EASYTelegramSignalBot.Telegram;
using EASYTelegramSignalBot.Finance.Binance;
using EASYTelegramSignalBot.Finance.Indicators;
using static EASYTelegramSignalBot.Finance.Models.Indicator;
using LiveCharts;
using LiveCharts.Defaults;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using System.Windows.Controls;
using System.Collections.Generic;
using Telegram.Bot;
using WpfClient.MVVM;
using EASYTelegramSignalBot.Database.Models;
using EASYTelegramSignalBot.Finance;
using System.Threading.Tasks;

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

            Model.UISymbol = Settings.TDIBotSymbols.FirstOrDefault() ?? "";

            foreach (var symbol in Settings.TDIBotSymbols)
            {
                if(symbol == Model.UISymbol)
                {
                    Model.Symbols.Add(new TDI(symbol, Binance.Net.Enums.KlineInterval.OneMinute, UpdateUI, SendSignalMessage) { } );
                    Model.KlineSeries.Title = symbol;
                    continue;
                }

                Model.Symbols.Add(new TDI(symbol, Binance.Net.Enums.KlineInterval.OneMinute, (string symbol, Dictionary<string, List<object>> values) => { }, SendSignalMessage) { });
            }
        }

        public void UpdateUI(string symbol, Dictionary<string, List<object>> Values)
        {
            if (symbol != Model.UISymbol) return;

            var Klines = Values["Klines"].Select(x => (Kline)x).ToList();
            UpdateKlines(Klines);

            var FastMA = Values["FastMA"].ToList();
            var SlowMA = Values["SlowMA"].ToList();
            var UpVB = Values["UpVB"].ToList();
            var MiddleVB = Values["MiddleVB"].ToList();
            var DownVB = Values["DownVB"].ToList();
            UpdateIndicators(Klines, FastMA, SlowMA, UpVB, MiddleVB, DownVB);
        }

        public void SendSignalMessage(string symbol, SignalType type)
        {
            foreach (User user in Model.Users)
            {
                if (user.ChatId != 0) BotClients.GeneralClient.SendTextMessageAsync(Settings.GeneralTelegramChannelId, $"TDI Sinyali Alındı {symbol}");
            }
        }

        public void SetUISymbol()
        {
            if (Model.SelectedSymbol == null) return;
            if (Model.SelectedSymbol.Symbol == Model.UISymbol) return;
            if (Model.Symbols.Count < 1) return;

            if(Model.Symbols.Where(x => x.Symbol == Model.UISymbol).Count() > 0)
            {
                Model.Symbols.First(x => x.Symbol == Model.UISymbol).UpdateAction = (string symbol, Dictionary<string, List<object>> values) => { };
            }
            Model.KlineSeriesCollection.ToList().ForEach(x => x.Values.Clear());
            Model.IndicatorsSeriesCollection.ToList().ForEach(x => x.Values.Clear());
            Model.UISymbol = Model.SelectedSymbol.Symbol;
            Model.Symbols.First(x => x.Symbol == Model.UISymbol).UpdateAction = UpdateUI;
            Model.KlineSeries.Title = Model.UISymbol;
        }

        public void DelSymbol()
        {
            if (Model.SelectedSymbol == null) return;
            var symbol = Model.SelectedSymbol.Symbol;

            Settings.TDIBotSymbols.Remove(Model.SelectedSymbol.Symbol);
            Model.SelectedSymbol.Dispose();

            Settings.TDIBotSymbols.Remove(Model.SelectedSymbol.Symbol);
            Settings.SaveSettings();

            Model.Symbols.Remove(Model.SelectedSymbol);


            if(Model.UISymbol == symbol && Model.Symbols.Count > 0)
            {
                Model.SelectedSymbol = Model.Symbols[0];
                SetUISymbol();
            }
        }

        public void AddSymbol()
        {
            try
            {
                if(Model.Symbols.Any(x => x.Symbol == Model.AddSymbolString))
                {
                    MessageBox.Show("Bu sembol zaten mevcut.", "Sembol mevcut", MessageBoxButton.OK, MessageBoxImage.Information);
                    return;
                }

                if (!StaticBinance.Client.SpotApi.ExchangeData.GetExchangeInfoAsync().Result.Data.Symbols.Any(x => x.Name == Model.AddSymbolString))
                {
                    MessageBox.Show("Böyle bir sembol bulunamadı!", "Sembol bulunamadı", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                _AddSymbol(Model.AddSymbolString);
                MessageBox.Show("Sembol başarıyla eklendi.", "Sembol Eklendi", MessageBoxButton.OK);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Bir hata meydana geldi : {ex.Message}", "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private bool _AddSymbol(string symbol)
        {
            Settings.TDIBotSymbols.Add(symbol);
            Model.Symbols.Add(new TDI(symbol, Binance.Net.Enums.KlineInterval.OneMinute, (string symbol, Dictionary<string, List<object>> values) => { }, SendSignalMessage) { });
            Settings.SaveSettings();
            return true;
        }

        public async Task AddAllSymbols()
        {
            var exchangeInfos = StaticBinance.Client.SpotApi.ExchangeData.GetExchangeInfoAsync().Result;
            Model.Symbols.Clear();
            Settings.TDIBotSymbols.Clear();
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
                var LastKline = Klines.Last();
                var LastChartKline = (OhlcPoint?)Model.KlineSeriesCollection[0].Values[^1];

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
            if(values.Count == 0)
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

        public void AddUser()
        {
            try
            {
                if (!Connection.Context.Users.Any(x => x.UserName == Model.AddUserString))
                {
                    Connection.Context.Add(new User() { UserName = Model.AddUserString, TDI = true, TDIExpiryDate = DateTime.Now.AddDays(Model.AddUserDays)});
                }
                else
                {
                    User user = Connection.Context.Users.First(x => x.UserName == Model.AddUserString);
                    var addDays = Model.AddUserDays == 0 ? 999999 : Model.AddUserDays;
                    user.TDIExpiryDate = user.TDIExpiryDate >= DateTime.Now ? user.TDIExpiryDate.AddDays(addDays) : DateTime.Now.AddDays(addDays);
                    user.TDI = true;
                }
                Connection.Context.SaveChanges();

                MessageBox.Show("Kullanıcı başarıyla eklendi.", "Kullanıcı Eklendi", MessageBoxButton.OK);
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
                Connection.Context.DelUser(Model.SelectedUser);
                Connection.Context.SaveChanges();

                MessageBox.Show("Kullanıcı başarıyla silindi.", "Kullanıcı Silindi", MessageBoxButton.OK);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Bir hata meydana geldi : {ex.Message}", "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
