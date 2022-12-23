using System;
using System.Collections.Generic;

namespace Labb2bookstoresDb.DataAccess;

public partial class Kunder
{
    public int KundId { get; set; }

    public string? Förnamn { get; set; }

    public string? Efternamn { get; set; }

    public string? Postnummer { get; set; }

    public string? Epost { get; set; }

    public int? Ålder { get; set; }
}
