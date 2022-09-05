using Microsoft.EntityFrameworkCore;
using System;
using EASYTelegramSignalBot.Database.Models;

namespace EASYTelegramSignalBot.Database
{
    public class DatabaseContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(Settings.DatabaseConnectionString);
        }

        public void CheckDatabaseSettings()
        {
            if (Settings.ResetDatabaseFirstStart)
            {
                ResetDatabase();
            }
            else if (!Settings.IsDatabaseEnsureCreated)
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

        public DbSet<User> Users { get; set; }
    }
}
