using System;
using System.Collections.Generic;

namespace Labb2bookstoresDb.DataAccess;

public partial class Böcker
{
    public string Isbn { get; set; } = null!;

    public string Titel { get; set; } = null!;

    public string Språk { get; set; } = null!;

    public int Pris { get; set; }

    public int? Sidor { get; set; }

    public int? Vikt { get; set; }

    public DateTime? Utgivningsdatum { get; set; }

    public int FörlagId { get; set; }

    public int FörfattareId { get; set; }

    public virtual Författare Författare { get; set; } = null!;

    public virtual Förlag Förlag { get; set; } = null!;

    public virtual ICollection<LagerSaldo> LagerSaldos { get; } = new List<LagerSaldo>();
}
