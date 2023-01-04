using Labb2bookstoresDb.DataAccess;

namespace Labb2bookstoresDb;

public class BookMenu
{
    private readonly BookstoresDbContext _context;

    public BookMenu(BookstoresDbContext context)
    {
        _context = context;
    }

    public void ShowMenu()
    {
        bool showMenu = true;
        while (showMenu)
        {
            Console.WriteLine("1. Lägg till bok");
            Console.WriteLine("2. Ta bort bok");
            Console.WriteLine("3. Redigera bok");
            Console.WriteLine("4. Visa böcker i lager");
            Console.WriteLine("5. Avsluta");

            Console.Write("Välj ett menyval: ");
            string choice = Console.ReadLine();

            switch (choice)
            {
                case "1":
                    AddBook();
                    break;
                case "2":
                    RemoveBook();
                    break;
                case "3":
                    EditBook();
                    break;
                case "4":
                    ShowBooksInStock();
                    break;
                case "5":
                    showMenu = false;
                    break;
                default:
                    Console.WriteLine("Ogiltigt menyval.");
                    break;
            }
        }
    }

    private void AddBook()
    {
        Console.Write("Ange ISBN: ");
        string isbn = Console.ReadLine();

        Console.Write("Ange författare ID: ");
        int authorId = int.Parse(Console.ReadLine());

        Console.Write("Ange förlags ID: ");
        int publisherId = int.Parse(Console.ReadLine());

        Console.Write("Ange språk: ");
        string language = Console.ReadLine();

        Console.Write("Ange utgivningsdatum (åååå-mm-dd): ");
        DateTime releaseDate = DateTime.Parse(Console.ReadLine());

        var book = new Böcker
        {
            Isbn = isbn,
            FörfattareId = authorId,
            FörlagId = publisherId,
            Språk = language,
            Utgivningsdatum = releaseDate
        };

        _context.Böckers.Add(book);
        _context.SaveChanges();

        Console.WriteLine("Boken har lagts till i databasen.");
    }

    private void RemoveBook()
    {
        Console.Write("Ange ISBN: ");
        string isbn = Console.ReadLine();

        var book = _context.Böckers.FirstOrDefault(b => b.Isbn == isbn);
        if (book == null)
        {
            Console.WriteLine("Kunde inte hitta boken med angivet ISBN.");
            return;
        }

        _context.Böckers.Remove(book);
        _context.SaveChanges();

        Console.WriteLine("Boken har tagits bort från databasen.");
    }

    private void EditBook()
    {
        Console.Write("Ange ISBN: ");
        string isbn = Console.ReadLine();

        var book = _context.Böckers.FirstOrDefault(b => b.Isbn == isbn);
        if (book == null)
        {
            Console.WriteLine("Kunde inte hitta boken med angivet ISBN.");
            return;
        }

        Console.Write("Ange nytt författare ID: ");
        int authorId = int.Parse(Console.ReadLine());

        Console.Write("Ange nytt förlags ID: ");
        int publisherId = int.Parse(Console.ReadLine());

        Console.Write("Ange nytt språk: ");
        string language = Console.ReadLine();

        Console.Write("Ange nytt utgivningsdatum (åååå-mm-dd): ");
        DateTime releaseDate = DateTime.Parse(Console.ReadLine());

        book.FörfattareId = authorId;
        book.FörlagId = publisherId;
        book.Språk = language;
        book.Utgivningsdatum = releaseDate;

        _context.Böckers.Update(book);
        _context.SaveChanges();

        Console.WriteLine("Boken har uppdaterats i databasen.");
    }

    private void ShowBooksInStock()
    {
        Console.WriteLine("Vilken butik vill du se lagersaldot för?");
        Console.WriteLine("Följande butiker finns att välja på:");
        var bookstores = _context.Butikers.ToList();
        for (int i = 0; i < bookstores.Count; i++)
        {
            Console.WriteLine($"{i + 1}. {bookstores[i].Butiksnamn}");
        }

        int storeId = int.Parse(Console.ReadLine());

        var books = from b in _context.Böckers
            join s in _context.LagerSaldos on b.Isbn equals s.Isbn
            join f in _context.Författares on b.FörfattareId equals f.Id
            where s.ButikId == storeId
            select new
            {
                Isbn = b.Isbn,
                Titel = b.Titel,
                FörfattareFörnamn = f.Förnamn,
                FörfattareEfternamn = f.Efternamn
            };

        Console.WriteLine("Följande böcker finns i lager på den valda butiken:");
        foreach (var book in books)
        {
            Console.WriteLine($"ISBN: {book.Isbn}, Titel: {book.Titel}, Författare: {book.FörfattareFörnamn} {book.FörfattareEfternamn}");
        }
    }
}