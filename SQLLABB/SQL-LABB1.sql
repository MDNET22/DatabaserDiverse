--CREATE DATABASE bookstores_db;

--USE bookstores_db;

--I tabellen f�rfattare vill vi ha en �Identietskolumn� (identity) kallad ID som PK.
--D�rut�ver vill vi ha kolumnerna: F�rnamn, Efternamn och F�delsedatum i passande datatyper.

--CREATE TABLE f�rfattare (
--    [ID] int NOT NULL PRIMARY KEY,
--    [F�rnamn] varchar(50) NOT NULL,
--    [Efternamn] varchar(50) NOT NULL,
--    [F�delsedatum] int
--);

--I tabellen b�cker vill vi ha ISBN13 som prim�rnyckel med l�mpliga constraints.
--Ut�ver det vill vi ha kolumnerna: Titel, Spr�k, Pris, och Utgivningsdatum av passande datatyper.
--Sist vill vi ha en FK-kolumn �F�rfattareID� som pekar mot tabellen �F�rfattare�.
--Ut�ver dessa kolumner f�r du g�rna l�gga till egna med information som du tycker kan vara bra att lagra om varje bok.

--CREATE TABLE b�cker (
--    [ISBN13] NUMBER (13) NOT NULL PRIMARY KEY,
--    [Titel] nvarchar(max) NOT NULL,
--    [Spr�k] nvarchar(max) NOT NULL,
--    [Pris] DECIMAL(12, 2),
--    [Utgivningsdatum] DATETIME2,
--	  [F�rfattareID] int FOREIGN KEY REFERENCES F�rfattare(ID)
--);

--Ut�ver ett identity-ID s� beh�ver tabellen kolumner f�r att lagra butiksnamn samt addressuppgifter.

--CREATE TABLE butiker (
--    [ID] int NOT NULL,
--    [Butiksnamn] nvarchar(max),
--    [Adressuppgifter] nvarchar(max)
--);

--I denna tabell vill vi ha 3 kolumner: ButikID som kopplas mot Butiker, ISBN som kopplas mot b�cker,
--samt Antal som s�ger hur m�nga exemplar det finns av en given bok i en viss butik. Som PK vill vi ha en kompositnyckel p� kolumnerna ButikID och ISBN.

--CREATE TABLE lagerSaldo (
--    [ButikID] int FOREIGN KEY REFERENCES Butiker(ID),
--    [ISBN] NUMBER (13) NOT NULL FOREIGN KEY REFERENCES B�cker(ISBN13),
--    [Antal] int(255),
--);

--De 4 tabellerna som �r specificerade ovan �r ett minimum att implementera. Ut�ver det ska du dock l�gga till ytterligare minst 2 tabeller 
--(minst 4 f�r VG) med information som kan vara l�mplig att lagra f�r bokhandelns syfte, och skapa nycklar och relationer mellan dessa.
--Exempel p� tabeller skulle kunna vara �Kunder�, �Ordrar� och �F�rlag�. Vad beh�ver man spara f�r uppgifter i de olika tabellerna?
--Vad f�r andra tabeller kan vi beh�va? Hur kommer de vara relaterade till varandra och v�ra 4 tidigare tabeller?
--Eventuellt kan vi beh�va uppdatera v�ra 4 tidigare tabeller med kolumner f�r att relatera till de nya.



-- kunder
--Kundnummer?
-- e-mail adress? Unique
-- Antal ordrar?

--CREATE TABLE kunder (
--    [ButikID] int FOREIGN KEY REFERENCES Butiker(ID),
--    [ISBN] NUMBER (13) NOT NULL FOREIGN KEY REFERENCES B�cker(ISBN13),
--    [Antal] int(255),
--);

--ordrar
-- FK till kundnummer? email?


--CREATE TABLE ordrar (
--    [ButikID] int FOREIGN KEY REFERENCES Butiker(ID),
--    [ISBN] NUMBER (13) NOT NULL FOREIGN KEY REFERENCES B�cker(ISBN13),
--    [Antal] int(255),
--);

--f�rlag

--CREATE TABLE f�rlag (
--    [ButikID] int FOREIGN KEY REFERENCES Butiker(ID),
--    [ISBN] NUMBER (13) NOT NULL FOREIGN KEY REFERENCES B�cker(ISBN13),
--    [Antal] int(255),
--);



-- Create table 

--Syntax Create table tabellnamn (
	--	kolumn1 datatyp, ..
	--	Kolumn datatyp,

	--	datetime2 datum tid 

