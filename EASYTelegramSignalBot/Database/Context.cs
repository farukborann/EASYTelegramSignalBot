using EASYTelegramSignalBot.Database.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.ObjectModel;

namespace EASYTelegramSignalBot.Database
{
    public class Context : Models.Context
    {
        private ObservableCollection<User>? _Users { get; set; }
        public new ObservableCollection<User> Users
        {
            get
            {
                if (_Users == null)
                {
                    _Users = new ObservableCollection<User>();
                    base.Users.ForEachAsync(x => _Users.Add(new User(x)));
                }
                return _Users;
            }
        }

        public void DeleteUser(User user)
        {
            base.Remove(user.GetOriginalEntity());
            Users.Remove(user);
            SaveChanges();
        }

        public void CreateUser(User user)
        {
            base.Add(user.GetOriginalEntity());
            Users.Add(user);
            SaveChanges();
        }
    }
}
