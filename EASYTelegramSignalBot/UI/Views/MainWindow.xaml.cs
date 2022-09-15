using EASYTelegramSignalBot.NewsBot;
using EASYTelegramSignalBot.Telegram;
using System.Runtime.InteropServices;

namespace EASYTelegramSignalBot.UI.Views
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : MahApps.Metro.Controls.MetroWindow
    {
        [DllImport("Kernel32")]
        private static extern void AllocConsole();

        public MainWindow()
        {
            AllocConsole();

            Settings.LoadSettings();

            Clients.StartBotClients();
            CryptopanicNewsBot _ = new();

            InitializeComponent();
        }
    }
}
