--CREATE DATABASE BSdb;

--USE BSdb;

--I tabellen författare vill vi ha en ”Identietskolumn” (identity) kallad ID som PK.
--Därutöver vill vi ha kolumnerna: Förnamn, Efternamn och Födelsedatum i passande datatyper.

--CREATE TABLE Författare (
--    ID int,
--    Förnamn varchar(255),
--    Efternamn varchar(255),
--    Födelsedatum varchar(255),
--);

--I tabellen böcker vill vi ha ISBN13 som primärnyckel med lämpliga constraints.
--Utöver det vill vi ha kolumnerna: Titel, Språk, Pris, och Utgivningsdatum av passande datatyper.
--Sist vill vi ha en FK-kolumn ”FörfattareID” som pekar mot tabellen ”Författare”.
--Utöver dessa kolumner får du gärna lägga till egna med information som du tycker kan vara bra att lagra om varje bok.

--CREATE TABLE Böcker (
--    ISBN13 int,
--    Titel varchar(255),
--    Språk varchar(255),
--    Pris varchar(255),
--    Utgivningsdatum varchar(255),
--	  FörfattareID varchar(255)
--);

--Utöver ett identity-ID så behöver tabellen kolumner för att lagra butiksnamn samt addressuppgifter.

--CREATE TABLE Butiker (
--    ID int,
--    Butiksnamn varchar(255),
--    Adressuppgifter varchar(255)
--);

--I denna tabell vill vi ha 3 kolumner: ButikID som kopplas mot Butiker, ISBN som kopplas mot böcker,
--samt Antal som säger hur många exemplar det finns av en given bok i en viss butik. Som PK vill vi ha en kompositnyckel på kolumnerna ButikID och ISBN.

--CREATE TABLE LagerSaldo (
--    ButikID int,
--    ISBN int(255),
--    Antal int(255),
--);

--De 4 tabellerna som är specificerade ovan är ett minimum att implementera. Utöver det ska du dock lägga till ytterligare minst 2 tabeller 
--(minst 4 för VG) med information som kan vara lämplig att lagra för bokhandelns syfte, och skapa nycklar och relationer mellan dessa.
--Exempel på tabeller skulle kunna vara ”Kunder”, ”Ordrar” och ”Förlag”. Vad behöver man spara för uppgifter i de olika tabellerna?
--Vad för andra tabeller kan vi behöva? Hur kommer de vara relaterade till varandra och våra 4 tidigare tabeller?
--Eventuellt kan vi behöva uppdatera våra 4 tidigare tabeller med kolumner för att relatera till de nya.