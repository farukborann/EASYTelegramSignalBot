using System;
using System.Collections.Generic;
using System.Linq;

namespace EASYTelegramSignalBot.UI.Helpers
{
    public class UILoader : IDisposable
    {
        private bool isDisposed;

        private Dictionary<string, Tuple<bool, Action?>> PageIsReady { get; set; }

        public UILoader()
        {
            PageIsReady = new()
            {
                {"TDI", new(false, null) },
                {"RSI", new(false, null) },
                {"PAC", new(false, null) },
                {"News", new(false, null) }
            };
        }

        public void SetPageReady(string PageName, Action? action)
        {
            PageIsReady[PageName] = new(true, action);

            if (PageIsReady.Values.All(x => x.Item1 == true))
            {
                foreach (Tuple<bool, Action?>? item in PageIsReady.Values)
                {
                    if (item.Item2 == null) continue;
                    //Task.Run(() => item.Item2);
                    item.Item2();
                }
                Dispose(true);
            }
        }

        private static UILoader? _instance { get; set; }
        public static UILoader Instance
        {
            get
            {
                if (_instance == null) _instance = new();
                return _instance;
            }
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (isDisposed) return;

            PageIsReady.Clear();

            isDisposed = true;
        }

    }
}
