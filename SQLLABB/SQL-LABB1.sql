--CREATE DATABASE bookstoresDb;

--USE bookstoresDb;

--I tabellen f�rfattare vill vi ha en �Identietskolumn� (identity) kallad ID som PK.
--D�rut�ver vill vi ha kolumnerna: F�rnamn, Efternamn och F�delsedatum i passande datatyper.

--CREATE TABLE F�rfattare (
--Id int NOT NULL,
--F�rnamn nvarchar(100) NOT NULL,
--Efternamn nvarchar(100) NOT NULL,
--F�delsedatum Date,
--CONSTRAINT PK_Id		PRIMARY KEY (Id)
--);

--INSERT INTO F�rfattare (Id, F�rnamn, Efternamn, F�delsedatum)
--VALUES
--('1', 'Andy', 'Weir', '1972-06-16'),
--('2', 'Annie', 'Ernaux', '1940-09-01'),
--('3', 'Lars', 'Kepler', '1967-01-20'),
--('4', 'Stefan', 'Ekengren','1972-06-16'); 

--CREATE TABLE F�rlag (
--F�rlagId int NOT NULL,
--F�rlagsnamn nvarchar (100),

--CONSTRAINT PK_F�rlagId		PRIMARY KEY(F�rlagId)
--);

--INSERT INTO F�rlag (F�rlagId, F�rlagsnamn)
--Values
--('1', 'Albert Bonniers F�rlag'),
--('2', 'Ballantine Books'),
--('3', 'Gallimard'),
--('4', 'M�npocket'),
--('5', 'Natur Kultur Allm�nlitteratur'),
--('6', 'Norstedts'),
--('7', 'Random House US'),
--('8', 'Reclam Philipp Jun');

--select * from F�rlag

--I tabellen b�cker vill vi ha ISBN13 som prim�rnyckel med l�mpliga constraints.
--Ut�ver det vill vi ha kolumnerna: Titel, Spr�k, Pris, och Utgivningsdatum av passande datatyper.
--Sist vill vi ha en FK-kolumn �F�rfattareID� som pekar mot tabellen �F�rfattare�.
--Ut�ver dessa kolumner f�r du g�rna l�gga till egna med information som du tycker kan vara bra att lagra om varje bok.

--CREATE TABLE B�cker (
--ISBN varchar (13) NOT NULL,
--Titel nvarchar(max) NOT NULL,
--Spr�k nvarchar(100) NOT NULL,
--Pris int NOT NULL,
--Sidor int,
--Vikt int,
--Utgivningsdatum DATE,
--F�rlagId int NOT NULL,
--F�rfattareId int NOT NULL,
--CHECK (LEN(ISBN) = 13),
--CONSTRAINT PK_ISBN				PRIMARY KEY (ISBN),
--CONSTRAINT FK_F�rfattareID		FOREIGN KEY (F�rfattareId) REFERENCES F�rfattare (Id),
--CONSTRAINT FK_F�rlagId			FOREIGN KEY (F�rlagId) REFERENCES F�rlag (F�rlagId)
--);

--DROP TABLE B�cker;


--INSERT INTO B�cker (ISBN, Titel, Spr�k, Pris, Sidor, Vikt, Utgivningsdatum, F�rlagId, F�rfattareID) 
--VALUES
--('9780553418026', 'The Martian', 'Engelska', '203', '416', '295', '2014-10-01', '2 ', '1'),
--('9780593355275', 'Project Hail Mary', 'Engelska', '215', '496', '638', '2021-05-04', '7', '1'),
--('9789113129655', '�ren', 'Svenska', '203', '279', '428', '2022-10-24', '6', '2'),
--('9782070402472', 'Les annees', 'Franska', ' 242', '253', '160', '2010-01-10', '3', '2'),
--('9783150092781', 'Une Femme', 'Franska', '80', '93', '54', '1991-12-01', '8', '2'),
--('9789100167110', 'Spindeln', 'Svenska', '209', '544', '598', '2022-10-19', '1', '3'),
--('9789175030944', 'Eldvittnet', 'Svenska', '75', '561', '307', '2022-10-24', '4', '3'),
--('9789100191924', 'Spegelmannen', 'Svenska', '75', '522', '280', '2021-11-11', '1', '3'),
--('9789175032313', 'Sandmannen', 'Svenska', '203', '416', '295', '2022-10-24', '4', '3'),
--('9789127179554', 'Potatis', 'Svenska', '249', '189', '888', '2022-10-24', '5', '4');

--select * from B�cker
--Ut�ver ett identity-ID s� beh�ver tabellen kolumner f�r att lagra butiksnamn samt addressuppgifter.

--CREATE TABLE Butiker (
--ButikId int NOT NULL,
--Butiksnamn nvarchar(100),
--Adress nvarchar(100),

--CONSTRAINT PK_ButikId		PRIMARY KEY (ButikId)
--);


--INSERT INTO Butiker (ButikId, Butiksnamn, Adress)
--VALUES
--('1', 'Sp�ntorgetsbokhandel', 'Sm�rslottsgatan 64'),
--('2', 'Stabbetorgetsbokhandel', 'Stabbetorget 6'),
--('3', 'Tr�torgetsbokhandel', 'Tr�torget 1');



--I denna tabell vill vi ha 3 kolumner: ButikID som kopplas mot Butiker, ISBN som kopplas mot b�cker,
--samt Antal som s�ger hur m�nga exemplar det finns av en given bok i en viss butik. Som PK vill vi ha en kompositnyckel p� kolumnerna ButikID och ISBN.

--CREATE TABLE LagerSaldo (
--ButikId int NOT NULL,
--ISBN varchar (13) NOT NULL,
--Antal int NOT NULL,
--CHECK (LEN(ISBN) = 13),
--CONSTRAINT FK_ButikId_Butiker		FOREIGN KEY(ButikId) REFERENCES Butiker(ButikId), 
--CONSTRAINT FK_ISBN_B�cker			FOREIGN KEY(ISBN) REFERENCES B�cker(ISBN),
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

--De 4 tabellerna som �r specificerade ovan �r ett minimum att implementera. Ut�ver det ska du dock l�gga till ytterligare minst 2 tabeller 
--(minst 4 f�r VG) med information som kan vara l�mplig att lagra f�r bokhandelns syfte, och skapa nycklar och relationer mellan dessa.
--Exempel p� tabeller skulle kunna vara �Kunder�, �Ordrar� och �F�rlag�. Vad beh�ver man spara f�r uppgifter i de olika tabellerna?
--Vad f�r andra tabeller kan vi beh�va? Hur kommer de vara relaterade till varandra och v�ra 4 tidigare tabeller?
--Eventuellt kan vi beh�va uppdatera v�ra 4 tidigare tabeller med kolumner f�r att relatera till de nya.


--CREATE TABLE Kunder (
--KundId int NOT NULL,
--F�rnamn nvarchar (100),		
--Efternamn nvarchar (100),
--Postnummer varchar (5),
--Epost varchar(319) UNIQUE,
--�lder int,
--CHECK (LEN(Postnummer) = 5),
--CONSTRAINT PK_KundId		PRIMARY KEY(KundId)
--);

--DROP TABLE Kunder;

--INSERT INTO Kunder (KundId, F�rnamn, Efternamn, Postnummer, Epost, �lder)
--Values
--('1', 'Marcus', 'Almstr�m', '71194', 'Marcus.almstrom@spamherelots.com', '18'),
--('2', 'Natalia', 'Lif', '73143', 'Natalia.lif@mailmetrash.com', '59'),
--('3', 'Adolfina', 'H�glund', '92292', 'Adolfina.hoglund@mailinater.com', '38'),
--('4', 'Bror', 'Nelson', '87243', 'Bror.nelson@dodgit.com', '31');


--Vi vill �ven ha en vy som sammanst�ller data fr�n tabellerna.
--Vyn ska inneh�lla f�ljande 4 kolumner (med en rad per f�rfattare):
--�Namn� � Hela namnet p� f�rfattaren. ��lder� � Hur gammal f�rfattaren �r.
--�Titlar� � Hur m�nga olika titlar vi har i �B�cker� av den angivna f�rfattaren.
--�Lagerv�rde� � Totala v�rdet (pris) f�r f�rfattarens b�cker i samtliga butiker.
--Exempel data: �select top 1 * from TitlarPerF�rfattare� Namn
--�lder Titlar Lagerv�rde Emma Askling 43 �r 3 st 4182 kr


-- Fyra kolumner (med en rad per f�rfattare)
-- "Namn" hela namnet p� f�rfattaren
--Titlar 
--Lagerv�rde
--Exempel data
--�lder titlar lagerv�rde emma Askling 32 �r 3 st 4182 kr


--select * from F�rfattare
--select * from B�cker
--select * from F�rlag
--select * from Butiker
--select * from LagerSaldo
--select * from Kunder


--select CONCAT(F�rfattare.F�rnamn, ' ', F�rfattare.Efternamn) AS Namn, CONCAT(DATEDIFF(year, F�delsedatum, GETDATE()), + ' �r') AS �lder from F�rfattare


--SELECT CONCAT(F�rfattare.F�rnamn, ' ', F�rfattare.Efternamn) AS Namn, CONCAT(DATEDIFF(year, F�delsedatum, GETDATE()), + ' �r') AS �lder,
--COUNT(B�cker.ISBN) AS Titlar
--from B�cker
--join F�rfattare on B�cker.F�rfattareId = F�rfattare.Id
--Group by F�rfattareId, F�rnamn, Efternamn, F�delsedatum;

--SELECT LagerSaldo.ButikId, LagerSaldo.ISBN, SUM(B�cker.Pris) AS Lagerv�rde
--From LagerSaldo
--join B�cker on LagerSaldo.ISBN = B�cker.ISBN
--Group by ButikId, LagerSaldo.ISBN;

--select B�cker.Pris from B�cker

--select ISBN, SUM(Antal) from LagerSaldo
--group by ISBN;

--select F�rfattare.F�rnamn, COUNT(B�cker.ISBN), SUM(Antal) * B�cker.Pris from B�cker
--join F�rfattare on B�cker.F�rfattareId = F�rfattare.Id
--join LagerSaldo on B�cker.ISBN = LagerSaldo.ISBN
--Group by F�rfattare.F�rnamn, B�cker.Pris;


--SELECT CONCAT(F�rnamn,  ' ',  Efternamn) AS Namn, 
--CONCAT(DATEDIFF(hour, F�delsedatum, GETDATE())/8766, ' �r')  AS �lder, 
--CONCAT(COUNT(DISTINCT Titel), ' st') As Titlar, 
--CONCAT(SUM(LagerSaldo.Antal * B�cker.Pris), ' kr') AS Lagerv�rde FROM B�cker
--JOIN F�rfattare ON B�cker.F�rfattareId = F�rfattare.Id
--JOIN LagerSaldo ON B�cker.ISBN = LagerSaldo.ISBN
--GROUP BY F�rnamn, Efternamn, F�delsedatum;

--SELECT CONCAT(F�rnamn,  ' ',  Efternamn) AS Namn, 
--CONCAT(DATEDIFF(year, F�delsedatum, GETDATE()), + ' �r')  AS �lder, 
--CONCAT(COUNT(DISTINCT Titel), ' st') As Titlar, 
--CONCAT(SUM(LagerSaldo.Antal * B�cker.Pris), ' kr') AS Lagerv�rde FROM B�cker
--JOIN F�rfattare ON B�cker.F�rfattareId = F�rfattare.Id
--JOIN LagerSaldo ON B�cker.ISBN = LagerSaldo.ISBN
--GROUP BY F�rnamn, Efternamn, F�delsedatum;

--CREATE VIEW vTitlarPerF�rfattare
--AS
--SELECT CONCAT(F�rnamn,  ' ',  Efternamn) AS Namn, 
--CONCAT(DATEDIFF(year, F�delsedatum, GETDATE()), + ' �r')  AS �lder, 
--CONCAT(COUNT(DISTINCT Titel), ' st') As Titlar, 
--CONCAT(SUM(LagerSaldo.Antal * B�cker.Pris), ' kr') AS Lagerv�rde FROM B�cker
--JOIN F�rfattare ON B�cker.F�rfattareId = F�rfattare.Id
--JOIN LagerSaldo ON B�cker.ISBN = LagerSaldo.ISBN
--GROUP BY F�rnamn, Efternamn, F�delsedatum;

--DROP VIEW vTitlarLagerPerF�rfattare;

select * from vTitlarPerF�rfattare;