using EASYTelegramSignalBot.ViewModels;
using System.Windows.Controls;

namespace EASYTelegramSignalBot.Views
{
    /// <summary>
    /// TDI.xaml etkileşim mantığı
    /// </summary>
    public partial class RSI : UserControl
    {
        public RSI()
        {
            InitializeComponent();
        }

        private void UserSymbolsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ((RSIViewModel)DataContext).UserSymbolsListSelectionChanged();
        }
    }
}
