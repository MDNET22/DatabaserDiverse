using Labb2bookstoresDb;
using Microsoft.EntityFrameworkCore;
using Labb2bookstoresDb.DataAccess;
using System;

//Skriv en applikation kopplad mot databasen för bokhandel som ni skapade i labb 1. Användaren ska kunna lista lagersaldo för de olika butikerna,
//samt kunna lägga till och ta bort böcker från butikerna. När man lägger till böcker ska man kunna välja från samtliga böcker som redan finns i sortimentet (boktabellen).

using (var context = new BookstoresDbContext())
{
    var bookMenu = new BookMenu(context);
    bookMenu.ShowMenu();
}