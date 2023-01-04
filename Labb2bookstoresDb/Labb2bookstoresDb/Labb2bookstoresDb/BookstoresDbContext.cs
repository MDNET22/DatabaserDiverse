using System;
using System.Collections.Generic;
using Labb2bookstoresDb.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace Labb2bookstoresDb;

public partial class BookstoresDbContext : DbContext
{
    public BookstoresDbContext()
    {
    }

    public BookstoresDbContext(DbContextOptions<BookstoresDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Butiker> Butikers { get; set; }

    public virtual DbSet<Böcker> Böckers { get; set; }

    public virtual DbSet<Författare> Författares { get; set; }

    public virtual DbSet<Förlag> Förlags { get; set; }

    public virtual DbSet<Kunder> Kunders { get; set; }

    public virtual DbSet<LagerSaldo> LagerSaldos { get; set; }

    public virtual DbSet<VTitlarPerFörfattare> VTitlarPerFörfattares { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Data Source=SUR;Initial Catalog=bookstoresDb;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Butiker>(entity =>
        {
            entity.HasKey(e => e.ButikId).HasName("PK_ButikId");

            entity.ToTable("Butiker");

            entity.Property(e => e.ButikId).ValueGeneratedNever();
            entity.Property(e => e.Adress).HasMaxLength(100);
            entity.Property(e => e.Butiksnamn).HasMaxLength(100);
        });

        modelBuilder.Entity<Böcker>(entity =>
        {
            entity.HasKey(e => e.Isbn).HasName("PK_ISBN");

            entity.ToTable("Böcker");

            entity.Property(e => e.Isbn)
                .HasMaxLength(13)
                .IsUnicode(false)
                .HasColumnName("ISBN");
            entity.Property(e => e.Språk).HasMaxLength(100);
            entity.Property(e => e.Utgivningsdatum).HasColumnType("date");

            entity.HasOne(d => d.Författare).WithMany(p => p.Böckers)
                .HasForeignKey(d => d.FörfattareId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_FörfattareID");

            entity.HasOne(d => d.Förlag).WithMany(p => p.Böckers)
                .HasForeignKey(d => d.FörlagId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_FörlagId");
        });

        modelBuilder.Entity<Författare>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_Id");

            entity.ToTable("Författare");

            entity.Property(e => e.Id).ValueGeneratedNever();
            entity.Property(e => e.Efternamn).HasMaxLength(100);
            entity.Property(e => e.Födelsedatum).HasColumnType("date");
            entity.Property(e => e.Förnamn).HasMaxLength(100);
        });

        modelBuilder.Entity<Förlag>(entity =>
        {
            entity.HasKey(e => e.FörlagId).HasName("PK_FörlagId");

            entity.ToTable("Förlag");

            entity.Property(e => e.FörlagId).ValueGeneratedNever();
            entity.Property(e => e.Förlagsnamn).HasMaxLength(100);
        });

        modelBuilder.Entity<Kunder>(entity =>
        {
            entity.HasKey(e => e.KundId).HasName("PK_KundId");

            entity.ToTable("Kunder");

            entity.HasIndex(e => e.Epost, "UQ__Kunder__0CCE4D17E66F1877").IsUnique();

            entity.Property(e => e.KundId).ValueGeneratedNever();
            entity.Property(e => e.Efternamn).HasMaxLength(100);
            entity.Property(e => e.Epost)
                .HasMaxLength(319)
                .IsUnicode(false);
            entity.Property(e => e.Förnamn).HasMaxLength(100);
            entity.Property(e => e.Postnummer)
                .HasMaxLength(5)
                .IsUnicode(false);
        });

        modelBuilder.Entity<LagerSaldo>(entity =>
        {
            entity.HasKey(e => new { e.ButikId, e.Isbn }).HasName("CK_LagerSaldo");

            entity.ToTable("LagerSaldo");

            entity.Property(e => e.Isbn)
                .HasMaxLength(13)
                .IsUnicode(false)
                .HasColumnName("ISBN");

            entity.HasOne(d => d.Butik).WithMany(p => p.LagerSaldos)
                .HasForeignKey(d => d.ButikId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ButikId_Butiker");

            entity.HasOne(d => d.IsbnNavigation).WithMany(p => p.LagerSaldos)
                .HasForeignKey(d => d.Isbn)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_ISBN_Böcker");
        });

        modelBuilder.Entity<VTitlarPerFörfattare>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("vTitlarPerFörfattare");

            entity.Property(e => e.Lagervärde)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.Namn).HasMaxLength(201);
            entity.Property(e => e.Titlar)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.Ålder)
                .HasMaxLength(15)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
