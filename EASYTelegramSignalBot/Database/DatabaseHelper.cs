using EASYTelegramSignalBot.Database.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace EASYTelegramSignalBot.Database
{
    public static class DatabaseHelper
    {
        //Users
        public static void DelUser(this DatabaseContext DbContext, User user)
        {
            DbContext.Remove(user);
        }

        public static List<User> GetTDIExpiredUsers(this DatabaseContext Context)
        {
            return Context.Users.Where(x => x.TDIExpiryDate <= DateTime.Now).ToList();
        }

        public static List<User> GetPACExpiredUsers(this DatabaseContext Context)
        {
            return Context.Users.Where(x => x.PACExpiryDate <= DateTime.Now).ToList();
        }

        public static List<User> GetUsers(this DatabaseContext Context)
        {
            return Context.Users.ToList();
        }
    }
}