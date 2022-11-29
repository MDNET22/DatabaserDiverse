--CREATE DATABASE bookstores_db;

--USE bookstores_db;

--I tabellen författare vill vi ha en ”Identietskolumn” (identity) kallad ID som PK.
--Därutöver vill vi ha kolumnerna: Förnamn, Efternamn och Födelsedatum i passande datatyper.

--CREATE TABLE författare (
--    [ID] int NOT NULL PRIMARY KEY,
--    [Förnamn] varchar(50) NOT NULL,
--    [Efternamn] varchar(50) NOT NULL,
--    [Födelsedatum] int
--);

--I tabellen böcker vill vi ha ISBN13 som primärnyckel med lämpliga constraints.
--Utöver det vill vi ha kolumnerna: Titel, Språk, Pris, och Utgivningsdatum av passande datatyper.
--Sist vill vi ha en FK-kolumn ”FörfattareID” som pekar mot tabellen ”Författare”.
--Utöver dessa kolumner får du gärna lägga till egna med information som du tycker kan vara bra att lagra om varje bok.

--CREATE TABLE böcker (
--    [ISBN13] NUMBER (13) NOT NULL PRIMARY KEY,
--    [Titel] nvarchar(max) NOT NULL,
--    [Språk] nvarchar(max) NOT NULL,
--    [Pris] DECIMAL(12, 2),
--    [Utgivningsdatum] DATETIME2,
--	  [FörfattareID] int FOREIGN KEY REFERENCES Författare(ID)
--);

--Utöver ett identity-ID så behöver tabellen kolumner för att lagra butiksnamn samt addressuppgifter.

--CREATE TABLE butiker (
--    [ID] int NOT NULL,
--    [Butiksnamn] nvarchar(max),
--    [Adressuppgifter] nvarchar(max)
--);

--I denna tabell vill vi ha 3 kolumner: ButikID som kopplas mot Butiker, ISBN som kopplas mot böcker,
--samt Antal som säger hur många exemplar det finns av en given bok i en viss butik. Som PK vill vi ha en kompositnyckel på kolumnerna ButikID och ISBN.

--CREATE TABLE lagerSaldo (
--    [ButikID] int FOREIGN KEY REFERENCES Butiker(ID),
--    [ISBN] NUMBER (13) NOT NULL FOREIGN KEY REFERENCES Böcker(ISBN13),
--    [Antal] int(255),
--);

--De 4 tabellerna som är specificerade ovan är ett minimum att implementera. Utöver det ska du dock lägga till ytterligare minst 2 tabeller 
--(minst 4 för VG) med information som kan vara lämplig att lagra för bokhandelns syfte, och skapa nycklar och relationer mellan dessa.
--Exempel på tabeller skulle kunna vara ”Kunder”, ”Ordrar” och ”Förlag”. Vad behöver man spara för uppgifter i de olika tabellerna?
--Vad för andra tabeller kan vi behöva? Hur kommer de vara relaterade till varandra och våra 4 tidigare tabeller?
--Eventuellt kan vi behöva uppdatera våra 4 tidigare tabeller med kolumner för att relatera till de nya.



-- kunder
--Kundnummer?
-- e-mail adress? Unique
-- Antal ordrar?

--CREATE TABLE kunder (
--    [ButikID] int FOREIGN KEY REFERENCES Butiker(ID),
--    [ISBN] NUMBER (13) NOT NULL FOREIGN KEY REFERENCES Böcker(ISBN13),
--    [Antal] int(255),
--);

--ordrar
-- FK till kundnummer? email?


--CREATE TABLE ordrar (
--    [ButikID] int FOREIGN KEY REFERENCES Butiker(ID),
--    [ISBN] NUMBER (13) NOT NULL FOREIGN KEY REFERENCES Böcker(ISBN13),
--    [Antal] int(255),
--);

--förlag

--CREATE TABLE förlag (
--    [ButikID] int FOREIGN KEY REFERENCES Butiker(ID),
--    [ISBN] NUMBER (13) NOT NULL FOREIGN KEY REFERENCES Böcker(ISBN13),
--    [Antal] int(255),
--);



-- Create table 

--Syntax Create table tabellnamn (
	--	kolumn1 datatyp, ..
	--	Kolumn datatyp,

	--	datetime2 datum tid 

