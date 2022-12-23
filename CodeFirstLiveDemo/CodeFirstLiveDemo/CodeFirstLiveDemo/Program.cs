// See https://aka.ms/new-console-template for more information

using CodeFirstLiveDemo.DataAccess;
using CodeFirstLiveDemo.DataAccess.Models;

Console.WriteLine("Hello, World!");

var BookstoreContext = new BookstoreContext();

var astrid = new Author()
{
    Firstname = "Astrid",
    Lastname = "Lindgren"
};

var ronja = new Book()
{
    Isbn = 
}