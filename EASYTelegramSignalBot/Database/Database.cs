using Microsoft.EntityFrameworkCore;
using System;
using System.Windows.Threading;

namespace EASYTelegramSignalBot.Database
{
    public static class Connection
    {
        private static DispatcherTimer refreshContextTimer { get; set; }

        public static DatabaseContext Context { get; set; }

        private static void Refresh(object sender, EventArgs e)
        {
            Context = new DatabaseContext();
            Context.Users.Load();
        }
        static Connection()
        {
            Context = new();
            Context.Users.Load();

            refreshContextTimer = new DispatcherTimer();
            refreshContextTimer.Interval = new TimeSpan(0, 5, 0);
            refreshContextTimer.Tick += new EventHandler(Refresh);
            refreshContextTimer.Start();
        }
    }
}
