using EASYTelegramSignalBot.Database.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.ObjectModel;

namespace EASYTelegramSignalBot.Database
{
    public class Context : Models.Context
    {
        private ObservableCollection<User>? _Users { get; set; }
        public ObservableCollection<User> Users
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
            base.Remove(user);
            Users.Remove(user);
        }

        public void CreateUser(User user)
        {
            base.Add(user);
            Users.Add(user);
        }
    }
}
