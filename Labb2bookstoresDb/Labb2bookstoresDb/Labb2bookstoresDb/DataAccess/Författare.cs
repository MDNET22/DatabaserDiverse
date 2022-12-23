using System;
using System.Collections.Generic;

namespace Labb2bookstoresDb.DataAccess;

public partial class Författare
{
    public int Id { get; set; }

    public string Förnamn { get; set; } = null!;

    public string Efternamn { get; set; } = null!;

    public DateTime? Födelsedatum { get; set; }

    public virtual ICollection<Böcker> Böckers { get; } = new List<Böcker>();
}
