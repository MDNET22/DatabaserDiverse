using System;
using System.Collections.Generic;

namespace Labb2bookstoresDb.DataAccess;

public partial class Butiker
{
    public int ButikId { get; set; }

    public string? Butiksnamn { get; set; }

    public string? Adress { get; set; }

    public virtual ICollection<LagerSaldo> LagerSaldos { get; } = new List<LagerSaldo>();
}
