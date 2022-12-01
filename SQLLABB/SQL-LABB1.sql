--CREATE DATABASE bookstoresDb;

--USE bookstoresDb;

--I tabellen författare vill vi ha en ”Identietskolumn” (identity) kallad ID som PK.
--Därutöver vill vi ha kolumnerna: Förnamn, Efternamn och Födelsedatum i passande datatyper.

--CREATE TABLE Författare (
--Id int NOT NULL,
--Förnamn nvarchar(100) NOT NULL,
--Efternamn nvarchar(100) NOT NULL,
--Födelsedatum Date,
--CONSTRAINT PK_Id		PRIMARY KEY (Id)
--);

--INSERT INTO Författare (Id, Förnamn, Efternamn, Födelsedatum)
--VALUES
--('1', 'Andy', 'Weir', '1972-06-16'),
--('2', 'Annie', 'Ernaux', '1940-09-01'),
--('3', 'Lars', 'Kepler', '1967-01-20'),
--('4', 'Stefan', 'Ekengren','1972-06-16'); 

--CREATE TABLE Förlag (
--FörlagId int NOT NULL,
--Förlagsnamn nvarchar (100),

--CONSTRAINT PK_FörlagId		PRIMARY KEY(FörlagId)
--);

--INSERT INTO Förlag (FörlagId, Förlagsnamn)
--Values
--('1', 'Albert Bonniers Förlag'),
--('2', 'Ballantine Books'),
--('3', 'Gallimard'),
--('4', 'Månpocket'),
--('5', 'Natur Kultur Allmänlitteratur'),
--('6', 'Norstedts'),
--('7', 'Random House US'),
--('8', 'Reclam Philipp Jun');

--select * from Förlag

--I tabellen böcker vill vi ha ISBN13 som primärnyckel med lämpliga constraints.
--Utöver det vill vi ha kolumnerna: Titel, Språk, Pris, och Utgivningsdatum av passande datatyper.
--Sist vill vi ha en FK-kolumn ”FörfattareID” som pekar mot tabellen ”Författare”.
--Utöver dessa kolumner får du gärna lägga till egna med information som du tycker kan vara bra att lagra om varje bok.

--CREATE TABLE Böcker (
--ISBN varchar (13) NOT NULL,
--Titel nvarchar(max) NOT NULL,
--Språk nvarchar(100) NOT NULL,
--Pris int NOT NULL,
--Sidor int,
--Vikt int,
--Utgivningsdatum DATE,
--FörlagId int NOT NULL,
--FörfattareId int NOT NULL,
--CHECK (LEN(ISBN) = 13),
--CONSTRAINT PK_ISBN				PRIMARY KEY (ISBN),
--CONSTRAINT FK_FörfattareID		FOREIGN KEY (FörfattareId) REFERENCES Författare (Id),
--CONSTRAINT FK_FörlagId			FOREIGN KEY (FörlagId) REFERENCES Förlag (FörlagId)
--);

--DROP TABLE Böcker;


--INSERT INTO Böcker (ISBN, Titel, Språk, Pris, Sidor, Vikt, Utgivningsdatum, FörlagId, FörfattareID) 
--VALUES
--('9780553418026', 'The Martian', 'Engelska', '203', '416', '295', '2014-10-01', '2 ', '1'),
--('9780593355275', 'Project Hail Mary', 'Engelska', '215', '496', '638', '2021-05-04', '7', '1'),
--('9789113129655', 'Åren', 'Svenska', '203', '279', '428', '2022-10-24', '6', '2'),
--('9782070402472', 'Les annees', 'Franska', ' 242', '253', '160', '2010-01-10', '3', '2'),
--('9783150092781', 'Une Femme', 'Franska', '80', '93', '54', '1991-12-01', '8', '2'),
--('9789100167110', 'Spindeln', 'Svenska', '209', '544', '598', '2022-10-19', '1', '3'),
--('9789175030944', 'Eldvittnet', 'Svenska', '75', '561', '307', '2022-10-24', '4', '3'),
--('9789100191924', 'Spegelmannen', 'Svenska', '75', '522', '280', '2021-11-11', '1', '3'),
--('9789175032313', 'Sandmannen', 'Svenska', '203', '416', '295', '2022-10-24', '4', '3'),
--('9789127179554', 'Potatis', 'Svenska', '249', '189', '888', '2022-10-24', '5', '4');

--select * from Böcker
--Utöver ett identity-ID så behöver tabellen kolumner för att lagra butiksnamn samt addressuppgifter.

--CREATE TABLE Butiker (
--ButikId int NOT NULL,
--Butiksnamn nvarchar(100),
--Adress nvarchar(100),

--CONSTRAINT PK_ButikId		PRIMARY KEY (ButikId)
--);


--INSERT INTO Butiker (ButikId, Butiksnamn, Adress)
--VALUES
--('1', 'Spåntorgetsbokhandel', 'Smörslottsgatan 64'),
--('2', 'Stabbetorgetsbokhandel', 'Stabbetorget 6'),
--('3', 'Trätorgetsbokhandel', 'Trätorget 1');



--I denna tabell vill vi ha 3 kolumner: ButikID som kopplas mot Butiker, ISBN som kopplas mot böcker,
--samt Antal som säger hur många exemplar det finns av en given bok i en viss butik. Som PK vill vi ha en kompositnyckel på kolumnerna ButikID och ISBN.

--CREATE TABLE LagerSaldo (
--ButikId int NOT NULL,
--ISBN varchar (13) NOT NULL,
--Antal int NOT NULL,
--CHECK (LEN(ISBN) = 13),
--CONSTRAINT FK_ButikId_Butiker		FOREIGN KEY(ButikId) REFERENCES Butiker(ButikId), 
--CONSTRAINT FK_ISBN_Böcker			FOREIGN KEY(ISBN) REFERENCES Böcker(ISBN),
--CONSTRAINT CK_LagerSaldo			PRIMARY KEY(ButikId, ISBN)
--);

--INSERT INTO LagerSaldo (ButikId, ISBN, Antal)
--VALUES 
--('1', '9780553418026', '3'),
--('1', '9780593355275', '2'),
--('1', '9789113129655', '5'),
--('1', '9782070402472', '7'),
--('1', '9783150092781', '3'),
--('1', '9789100167110', '10'),
--('1', '9789175030944', '0'),
--('1', '9789100191924', '42'),
--('1', '9789175032313', '1'), 
--('1', '9789127179554', '0'), 
--('2', '9780553418026', '1'),
--('2', '9780593355275', '14'),
--('2', '9789113129655', '22'),
--('2', '9782070402472', '7'),
--('2', '9783150092781', '4'),
--('2', '9789100167110', '8'),
--('2', '9789175030944', '3'),
--('2', '9789100191924', '0'),
--('2', '9789175032313', '5'), 
--('2', '9789127179554', '0'), 
--('3', '9780553418026', '2'),
--('3', '9780593355275', '4'),
--('3', '9789113129655', '8'),
--('3', '9782070402472', '0'),
--('3', '9783150092781', '6'),
--('3', '9789100167110', '3'),
--('3', '9789175030944', '5'),
--('3', '9789100191924', '0'),
--('3', '9789175032313', '2'), 
--('3', '9789127179554', '11'); 

--De 4 tabellerna som är specificerade ovan är ett minimum att implementera. Utöver det ska du dock lägga till ytterligare minst 2 tabeller 
--(minst 4 för VG) med information som kan vara lämplig att lagra för bokhandelns syfte, och skapa nycklar och relationer mellan dessa.
--Exempel på tabeller skulle kunna vara ”Kunder”, ”Ordrar” och ”Förlag”. Vad behöver man spara för uppgifter i de olika tabellerna?
--Vad för andra tabeller kan vi behöva? Hur kommer de vara relaterade till varandra och våra 4 tidigare tabeller?
--Eventuellt kan vi behöva uppdatera våra 4 tidigare tabeller med kolumner för att relatera till de nya.


--CREATE TABLE Kunder (
--KundId int NOT NULL,
--Förnamn nvarchar (100),		
--Efternamn nvarchar (100),
--Postnummer varchar (5),
--Epost varchar(319) UNIQUE,
--Ålder int,
--CHECK (LEN(Postnummer) = 5),
--CONSTRAINT PK_KundId		PRIMARY KEY(KundId)
--);

--DROP TABLE Kunder;

--INSERT INTO Kunder (KundId, Förnamn, Efternamn, Postnummer, Epost, Ålder)
--Values
--('1', 'Marcus', 'Almström', '71194', 'Marcus.almstrom@spamherelots.com', '18'),
--('2', 'Natalia', 'Lif', '73143', 'Natalia.lif@mailmetrash.com', '59'),
--('3', 'Adolfina', 'Höglund', '92292', 'Adolfina.hoglund@mailinater.com', '38'),
--('4', 'Bror', 'Nelson', '87243', 'Bror.nelson@dodgit.com', '31');


--Vi vill även ha en vy som sammanställer data från tabellerna.
--Vyn ska innehålla följande 4 kolumner (med en rad per författare):
--”Namn” – Hela namnet på författaren. ”Ålder” – Hur gammal författaren är.
--”Titlar” – Hur många olika titlar vi har i ”Böcker” av den angivna författaren.
--”Lagervärde” – Totala värdet (pris) för författarens böcker i samtliga butiker.
--Exempel data: ”select top 1 * from TitlarPerFörfattare” Namn
--Ålder Titlar Lagervärde Emma Askling 43 år 3 st 4182 kr


-- Fyra kolumner (med en rad per författare)
-- "Namn" hela namnet på författaren
--Titlar 
--Lagervärde
--Exempel data
--ålder titlar lagervärde emma Askling 32 år 3 st 4182 kr


--select * from Författare
--select * from Böcker
--select * from Förlag
--select * from Butiker
--select * from LagerSaldo
--select * from Kunder


--select CONCAT(Författare.Förnamn, ' ', Författare.Efternamn) AS Namn, CONCAT(DATEDIFF(year, Födelsedatum, GETDATE()), + ' år') AS Ålder from Författare


--SELECT CONCAT(Författare.Förnamn, ' ', Författare.Efternamn) AS Namn, CONCAT(DATEDIFF(year, Födelsedatum, GETDATE()), + ' år') AS Ålder,
--COUNT(Böcker.ISBN) AS Titlar
--from Böcker
--join Författare on Böcker.FörfattareId = Författare.Id
--Group by FörfattareId, Förnamn, Efternamn, Födelsedatum;

--SELECT LagerSaldo.ButikId, LagerSaldo.ISBN, SUM(Böcker.Pris) AS Lagervärde
--From LagerSaldo
--join Böcker on LagerSaldo.ISBN = Böcker.ISBN
--Group by ButikId, LagerSaldo.ISBN;

--select Böcker.Pris from Böcker

--select ISBN, SUM(Antal) from LagerSaldo
--group by ISBN;

--select Författare.Förnamn, COUNT(Böcker.ISBN), SUM(Antal) * Böcker.Pris from Böcker
--join Författare on Böcker.FörfattareId = Författare.Id
--join LagerSaldo on Böcker.ISBN = LagerSaldo.ISBN
--Group by Författare.Förnamn, Böcker.Pris;


--SELECT CONCAT(Förnamn,  ' ',  Efternamn) AS Namn, 
--CONCAT(DATEDIFF(hour, Födelsedatum, GETDATE())/8766, ' År')  AS Ålder, 
--CONCAT(COUNT(DISTINCT Titel), ' st') As Titlar, 
--CONCAT(SUM(LagerSaldo.Antal * Böcker.Pris), ' kr') AS Lagervärde FROM Böcker
--JOIN Författare ON Böcker.FörfattareId = Författare.Id
--JOIN LagerSaldo ON Böcker.ISBN = LagerSaldo.ISBN
--GROUP BY Förnamn, Efternamn, Födelsedatum;

--SELECT CONCAT(Förnamn,  ' ',  Efternamn) AS Namn, 
--CONCAT(DATEDIFF(year, Födelsedatum, GETDATE()), + ' år')  AS Ålder, 
--CONCAT(COUNT(DISTINCT Titel), ' st') As Titlar, 
--CONCAT(SUM(LagerSaldo.Antal * Böcker.Pris), ' kr') AS Lagervärde FROM Böcker
--JOIN Författare ON Böcker.FörfattareId = Författare.Id
--JOIN LagerSaldo ON Böcker.ISBN = LagerSaldo.ISBN
--GROUP BY Förnamn, Efternamn, Födelsedatum;

--CREATE VIEW vTitlarPerFörfattare
--AS
--SELECT CONCAT(Förnamn,  ' ',  Efternamn) AS Namn, 
--CONCAT(DATEDIFF(year, Födelsedatum, GETDATE()), + ' år')  AS Ålder, 
--CONCAT(COUNT(DISTINCT Titel), ' st') As Titlar, 
--CONCAT(SUM(LagerSaldo.Antal * Böcker.Pris), ' kr') AS Lagervärde FROM Böcker
--JOIN Författare ON Böcker.FörfattareId = Författare.Id
--JOIN LagerSaldo ON Böcker.ISBN = LagerSaldo.ISBN
--GROUP BY Förnamn, Efternamn, Födelsedatum;

--DROP VIEW vTitlarLagerPerFörfattare;

select * from vTitlarPerFörfattare;