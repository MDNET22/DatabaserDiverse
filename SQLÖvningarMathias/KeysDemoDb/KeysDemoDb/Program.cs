// See https://aka.ms/new-console-template for more information

using KeysDemoDb.Models;

Console.WriteLine("Hello, World!");

var KeysDemoContext = new KeysDemoDbContext();

KeysDemoContext.SaveChanges();