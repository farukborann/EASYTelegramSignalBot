using EASYTelegramSignalBot.Database.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.ObjectModel;

namespace EASYTelegramSignalBot.Database
{
    public class Context : Models.Context
    {
        public new ObservableCollection<User> Users { get; set; }

        public Context()
        {
            Users = new ObservableCollection<User>();
            base.Users.ForEachAsync(x => Users.Add(new User(x)));
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
