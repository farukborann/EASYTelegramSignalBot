using EASYTelegramSignalBot.ViewModels;
using System.Windows.Controls;

namespace EASYTelegramSignalBot.Views
{
    /// <summary>
    /// TDI.xaml etkileşim mantığı
    /// </summary>
    public partial class TDI : UserControl
    {
        public TDI()
        {
            InitializeComponent();
        }

        private void UserSymbolsListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ((TDIViewModel)DataContext).UserSymbolsListSelectionChanged();
        }
    }
}
