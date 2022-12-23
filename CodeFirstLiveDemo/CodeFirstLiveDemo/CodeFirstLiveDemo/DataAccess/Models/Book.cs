using System.ComponentModel.DataAnnotations;

namespace CodeFirstLiveDemo.DataAccess.Models;

public class Book
{
    [Key]
    [StringLength(13, MinimumLength = 13)]
    public string Isbn { get; set; }

    public string Title { get; set; }

    public Author Author { get; set; }


}