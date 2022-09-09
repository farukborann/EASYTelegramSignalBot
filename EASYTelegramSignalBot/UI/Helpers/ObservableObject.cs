using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EASYTelegramSignalBot.UI.Helpers
{
    public static class ObservableObject
    {
        public static void InvokeAll(this PropertyChangedEventHandler? propertyChangedEventHandler, object sender, params string[] propertyNames)
        {
            foreach (string? propertyName in propertyNames)
            {
                propertyChangedEventHandler?.Invoke(sender, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
}
