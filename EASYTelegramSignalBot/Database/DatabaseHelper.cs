using EASYTelegramSignalBot.Database.Models;

namespace EASYTelegramSignalBot.Database
{
    public static class DatabaseHelper
    {
        //Users
        public static void DelUser(this DatabaseContext DbContext, User user)
        {
            DbContext.Remove(user);
        }
    }
}