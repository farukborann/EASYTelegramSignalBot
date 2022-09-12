using System;
using System.Windows.Threading;

namespace EASYTelegramSignalBot.Database
{
    public static class Connection
    {
        private static DispatcherTimer refreshContextTimer { get; set; }

        public static Context Context { get; set; }

        private static void Refresh(object sender, EventArgs e)
        {
            Context = new Context();
            //var _ = Context.Users;
        }
        static Connection()
        {
            Context = new();
            //var _ = Context.Users;

            refreshContextTimer = new DispatcherTimer
            {
                Interval = new TimeSpan(0, 5, 0)
            };
            refreshContextTimer.Tick += new EventHandler(Refresh);
            refreshContextTimer.Start();
        }
    }
}
