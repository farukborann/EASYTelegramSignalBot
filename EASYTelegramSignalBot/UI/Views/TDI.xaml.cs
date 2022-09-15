using EASYTelegramSignalBot.ViewModels;
using System.Windows.Controls;

namespace EASYTelegramSignalBot.UI.Views
{
    /// <summary>
    /// TDI.xaml etkileşim mantığı
    /// </summary>
    public partial class TDI : UserControl
    {
        private bool isFirstLoad { get; set; }
        public TDI()
        {
            isFirstLoad = true;
            InitializeComponent();
            isFirstLoad = false;
        }

        private void UserSymbolsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ((TDIViewModel)DataContext).UserSymbolsListSelectionChanged();
        }

        private void KlineInterval_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (isFirstLoad) return;
            ((TDIViewModel)DataContext).ChangeKlineInterval();
        }
    }
}
