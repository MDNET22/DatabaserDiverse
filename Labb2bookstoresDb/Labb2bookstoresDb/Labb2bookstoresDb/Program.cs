using Labb2bookstoresDb;
using Microsoft.EntityFrameworkCore;
using Labb2bookstoresDb.DataAccess;
using System;

//Skriv en applikation kopplad mot databasen för bokhandel som ni skapade i labb 1. Användaren ska kunna lista lagersaldo för de olika butikerna,
//samt kunna lägga till och ta bort böcker från butikerna. När man lägger till böcker ska man kunna välja från samtliga böcker som redan finns i sortimentet (boktabellen).

using (var context = new BookstoresDbContext())
{
    while (true)
    {
        Menu();

        var input = Console.ReadLine();
        switch (input)
        {
            case "1":
                ChooseBookStore();
                break;
            case "2":
                AddBook();
                break;
            case "3":
                RemoveBook();
                break;
            case "4":
                EditBook();
                break;
            case "5":
                ListAllBooks();
                break;
            case "6":
                return;
                break;
            default:
                Menu();
                break;
        }
    }

void Menu()
    {
        Console.WriteLine("Välj en av följande alternativ:");
        Console.WriteLine("1. Välj Butik och se lagersaldo");
        Console.WriteLine("2. Lägg till bok i butik");
        Console.WriteLine("3. Ta bort en bok från en butik");
        Console.WriteLine("4. Redigera bok");
        Console.WriteLine("5. Lista alla böcker");
        Console.WriteLine("6. Avsluta");
    }

    void ChooseBookStore()
    {
        Console.WriteLine("Vilken butik vill du se lagersaldot för?");
        Console.WriteLine("Följande butiker finns att välja på:");
        var bookstores = context.Butikers.ToList();
        for (int i = 0; i < bookstores.Count; i++)
        {
            Console.WriteLine($"{i + 1}. {bookstores[i].Butiksnamn}");
        }
        var input = Console.ReadLine();
        int selection;
        if (!int.TryParse(input, out selection))
        {
            Console.WriteLine("Ogiltigt val. Var vänlig försök igen.");
            return;
        }
        if (selection < 1 || selection > bookstores.Count)
        {
            Console.WriteLine("Ogiltigt val. Var vänlig försök igen.");
            return;
        }
        var bookstoreId = bookstores[selection - 1].ButikId;
        var inventory = context.GetLagerSaldosForButik(bookstoreId);
        foreach (var item in inventory)
        {
            var book = context.Böckers.FirstOrDefault(b => b.Isbn == item.Isbn);
            Console.WriteLine($"{book.Titel} har {item.Antal} exemplar kvar");
        }
    }

    void ListAllBooks()
    {
        var books = context.Böckers.ToList();
        for (int i = 0; i < books.Count; i++)
        {
            Console.WriteLine($"{i + 1}. {books[i].Isbn} {books[i].Titel}");
        }
    }

    void AddBook()
    {
        Console.WriteLine("Vilken butik vill du lägga till en bok i?");
        Console.WriteLine("Följande butiker finns att välja på:");
        var bookstores = context.Butikers.ToList();
        for (int i = 0; i < bookstores.Count; i++)
        {
            Console.WriteLine($"{i + 1}. {bookstores[i].Butiksnamn}");
        }
        var input = Console.ReadLine();
        int selection;
        if (!int.TryParse(input, out selection))
        {
            Console.WriteLine("Ogiltigt val. Var vänlig försök igen.");
            return;
        }
        if (selection < 1 || selection > bookstores.Count)
        {
            Console.WriteLine("Ogiltigt val. Var vänlig försök igen.");
            return;
        }
        var bookstoreId = bookstores[selection - 1].ButikId;
        Console.WriteLine("Följande böcker finns att välja på:");
        var books = context.Böckers.ToList();
        for (int i = 0; i < books.Count; i++)
        {
            Console.WriteLine($"{i + 1}. {books[i].Titel}");
        }
        Console.WriteLine("Välj bok att lägga till genom att skriva in motsvarande siffra:");
        var bookInput = Console.ReadLine();
        int bookSelection;
        if (!int.TryParse(bookInput, out bookSelection))
        {
            Console.WriteLine("Ogiltigt val. Var vänlig försök igen.");
            return;
        }
        if (bookSelection < 1 || bookSelection > books.Count)
        {
            Console.WriteLine("Ogiltigt val. Var vänlig försök igen.");
            return;
        }
        var bookId = books[bookSelection - 1].Isbn;
        Console.WriteLine("Ange antal exemplar att lägga till:");
        var amountInput = Console.ReadLine();
        int amount;
        if (!int.TryParse(amountInput, out amount))
        {
            Console.WriteLine("Ogiltigt val. Var vänlig försök igen.");
            return;
        }
        var inventory = context.LagerSaldos.FirstOrDefault(l => l.ButikId == bookstoreId && l.Isbn == bookId);
        if (inventory == null)
        {
            context.LagerSaldos.Add(new LagerSaldo { ButikId = bookstoreId, Isbn = bookId, Antal = amount });
        }
        else
        {
            inventory.Antal += amount;
        }
        context.SaveChanges();
    }

    void RemoveBook()
    {
        Console.WriteLine("Vilken butik vill du ta bort en bok från?");
        var bookstoreName = Console.ReadLine();
        var bookstoreId = context.Butikers.FirstOrDefault(b => b.Butiksnamn == bookstoreName).ButikId;
        Console.WriteLine("Vilken bok vill du ta bort?");
        var bookTitle = Console.ReadLine();
        var bookId = context.Böckers.FirstOrDefault(b => b.Titel == bookTitle).Isbn;
        var bookToRemove = context.LagerSaldos.FirstOrDefault(l => l.ButikId == bookstoreId && l.Isbn == bookId);
        context.LagerSaldos.Remove(bookToRemove);
        context.SaveChanges();
    }

    void EditBook()
    {
        Console.WriteLine("Vilken butik vill du uppdatera en bok i?");
        Console.WriteLine("Följande butiker finns att välja på:");
        var bookstores = context.Butikers.ToList();
        for (int i = 0; i < bookstores.Count; i++)
        {
            Console.WriteLine($"{i + 1}. {bookstores[i].Butiksnamn}");
        }
        var input = Console.ReadLine();
        int selection;
        if (!int.TryParse(input, out selection))
        {
            Console.WriteLine("Ogiltigt val. Var vänlig försök igen.");
            return;
        }
        if (selection < 1 || selection > bookstores.Count)
        {
            Console.WriteLine("Ogiltigt val. Var vänlig försök igen.");
            return;
        }
        var bookstoreId = bookstores[selection - 1].ButikId;
        Console.WriteLine("Vilken bok vill du uppdatera?");
        Console.WriteLine("Följande böcker finns att välja på:");
        var booksInStore = context.GetLagerSaldosForButik(bookstoreId).ToList();
        for (int i = 0; i < booksInStore.Count; i++)
        {
            Console.WriteLine($"{i + 1}. {context.Böckers.FirstOrDefault(b => b.Isbn == booksInStore[i].Isbn).Titel}");
        }
        input = Console.ReadLine();
        if (!int.TryParse(input, out selection))
        {
            Console.WriteLine("Ogiltigt val. Var vänlig försök igen.");
            return;
        }
        if (selection < 1 || selection > booksInStore.Count)
        {
            Console.WriteLine("Ogiltigt val. Var vänlig försök igen.");
            return;
        }
        var bookId = booksInStore[selection - 1].Isbn;
        Console.WriteLine("Hur många exemplar vill du lägga till?");
        var amount = Console.ReadLine();
        var bookToUpdate = context.LagerSaldos.FirstOrDefault(l => l.ButikId == bookstoreId && l.Isbn == bookId);
        bookToUpdate.Antal += int.Parse(amount);
        context.SaveChanges();
    }
}




