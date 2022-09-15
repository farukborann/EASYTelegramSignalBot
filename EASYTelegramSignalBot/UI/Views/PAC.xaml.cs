using EASYTelegramSignalBot.ViewModels;
using System.Windows.Controls;

namespace EASYTelegramSignalBot.UI.Views
{
    /// <summary>
    /// TDI.xaml etkileşim mantığı
    /// </summary>
    public partial class PAC : UserControl
    {
        private bool isFirstLoad { get; set; }
        public PAC()
        {
            isFirstLoad = true;
            InitializeComponent();
            isFirstLoad = false;
        }

        private void UserSymbolsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ((PACViewModel)DataContext).UserSymbolsListSelectionChanged();
        }

        private void KlineInterval_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (isFirstLoad) return;
            ((PACViewModel)DataContext).ChangeKlineInterval();
        }
    }
}
