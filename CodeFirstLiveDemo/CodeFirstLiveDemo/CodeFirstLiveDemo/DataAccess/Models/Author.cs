namespace CodeFirstLiveDemo.DataAccess.Models;

public class Author
{
    public int Id { get; set; }

    public string Firstname { get; set; }

    public string Lastname { get; set; }

    public ICollection<Book> Books { get; set; }
}