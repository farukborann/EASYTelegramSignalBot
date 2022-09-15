using EASYTelegramSignalBot.ViewModels;
using System.Windows.Controls;

namespace EASYTelegramSignalBot.UI.Views
{
    /// <summary>
    /// TDI.xaml etkileşim mantığı
    /// </summary>
    public partial class RSI : UserControl
    {
        private bool isFirstLoad { get; set; }

        public RSI()
        {
            isFirstLoad = true;
            InitializeComponent();
            isFirstLoad = false;
        }

        private void UserSymbolsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ((RSIViewModel)DataContext).UserSymbolsListSelectionChanged();
        }

        private void KlineInterval_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (isFirstLoad) return;
            ((RSIViewModel)DataContext).ChangeKlineInterval();
        }
    }
}

