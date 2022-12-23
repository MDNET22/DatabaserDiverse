using CodeFirstLiveDemo.DataAccess.Models;
using Microsoft.EntityFrameworkCore;
using System;

namespace CodeFirstLiveDemo.DataAccess;

public class BookstoreContext : DbContext
{
    public DbSet<Book> Books { get; set; }

    public  DbSet<Author> Authors { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        base.OnConfiguring(optionsBuilder);
        optionsBuilder.UseSqlServer(
            connectionString:
            "Data Source=SUR;Database=Bookstore;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
    }
}


