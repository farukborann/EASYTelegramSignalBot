using Microsoft.EntityFrameworkCore;
using System;

namespace EASYTelegramSignalBot.Database.Models
{
    public class Context : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(Settings.DatabaseSettings.DatabaseConnectionString);
        }
        public Context()
        {
            CheckDatabaseSettings();
        }

        public void CheckDatabaseSettings()
        {
            if (Settings.DatabaseSettings.ResetDatabaseFirstStart)
            {
                ResetDatabase();
            }
            else if (!Settings.DatabaseSettings.IsDatabaseEnsureCreated)
            {
                CreateDatabase();
            }
            SaveChanges();
        }

        public void CreateDatabase()
        {
            Database.EnsureCreated();
            Settings.SetDatabaseEnsureCreated();
            Console.WriteLine("| Database Created |");
        }

        public void ResetDatabase()
        {
            Database.EnsureDeleted();
            Settings.DatabaseResetted();
            Console.WriteLine("| Database resetted |\nPlease start bot again. Press a button for exit...");
            Console.ReadKey();
            Environment.Exit(0);
        }

        public DbSet<Entities.User> Users { get; set; }

    }
}
