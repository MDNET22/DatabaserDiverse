using System;
using System.Collections.Generic;

namespace Labb2bookstoresDb.DataAccess;

public partial class Förlag
{
    public int FörlagId { get; set; }

    public string? Förlagsnamn { get; set; }

    public virtual ICollection<Böcker> Böckers { get; } = new List<Böcker>();
}
