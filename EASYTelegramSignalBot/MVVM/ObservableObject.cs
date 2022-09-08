using System.ComponentModel;

namespace WpfClient.MVVM
{
    public class ObservableObject : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler? PropertyChanged;

        public PropertyChangedEventHandler? GetHandler()
        {
            return PropertyChanged;
        }

        public void RaisePropertyChangedEvent(params string[] propertyNames)
        {
            foreach (string? propertyName in propertyNames)
            {
                PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
}
