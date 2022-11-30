--CREATE DATABASE bookstores_db;

USE bookstores_db;

--I tabellen författare vill vi ha en ”Identietskolumn” (identity) kallad ID som PK.
--Därutöver vill vi ha kolumnerna: Förnamn, Efternamn och Födelsedatum i passande datatyper.

CREATE TABLE Författare (
Id int NOT NULL,
Förnamn nvarchar(100) NOT NULL,
Efternamn nvarchar(100) NOT NULL,
Födelsedatum Date,
CONSTRAINT PK_Id		PRIMARY KEY (Id)
);

INSERT INTO Författare (Id, Förnamn, Efternamn, Födelsedatum)
VALUES
('1', 'Andy', 'Weir', '1972-06-16'),
('2', 'Annie', 'Ernaux', '1940-09-01'),
('3', 'Lars', 'Kepler', '1967-01-20'),
('4', 'Stefan', 'Ekengren','1972-06-16'); 

--I tabellen böcker vill vi ha ISBN13 som primärnyckel med lämpliga constraints.
--Utöver det vill vi ha kolumnerna: Titel, Språk, Pris, och Utgivningsdatum av passande datatyper.
--Sist vill vi ha en FK-kolumn ”FörfattareID” som pekar mot tabellen ”Författare”.
--Utöver dessa kolumner får du gärna lägga till egna med information som du tycker kan vara bra att lagra om varje bok.

CREATE TABLE Böcker (
ISBN varchar CHECK (LEN(ISBN) = 13) NOT NULL,
Titel nvarchar(max) NOT NULL,
Språk nvarchar(100) NOT NULL,
Pris int,
Sidor int,
Vikt int,
Utgivningsdatum DATE,
FörlagId int NOT NULL,
FörfattareId int NOT NULL,

CONSTRAINT PK_ISBN				PRIMARY KEY (ISBN),
CONSTRAINT FK_FörfattareID		FOREIGN KEY (FörfattareId) REFERENCES Författare (Id),
CONSTRAINT FK_FörlagId			FOREIGN KEY (FörlagId) REFERENCES Förlag (FörlagId)
);


INSERT INTO Böcker (ISBN, Titel, Språk, Pris, Sidor, Utgivningsdatum, FörlagId, FörfattareID) 
VALUES
('9780553418026', 'The Martian', 'Engelska', '203', '416', '295', '2014-10-01', '2 ', '1'),

('9780593355275', 'Project Hail Mary', 'Engelska', '215', '496', '638', '2021-05-04', '7', '1'),

('9780553418026', 'Åren', 'Svenska', '203', '279', '428', '2022-10-24', '6', '2'),

('9782070402472', 'Les annees', 'Franska', ' 242', '253', '160', '2010-01-10', '3', '2'),

('9780553418026', 'Une Femme', 'Franska', '80', '93', '54', '1991-12-01', '8', '2'),

('9789100167110', 'Spindeln', 'Svenska', '209', '544', '598', '2022-10-19', '1', '3'),

('9780553418026', 'Eldvittnet', 'Svenska', '75', '561', '307', '2022-10-24', '4', '3'),

('9780553418026', 'Spegelmannen', 'Svenska', '75', '522', '280', '2021-11-11', '1', '3'),

('9780553418026', 'Sandmannen', 'Svenska', '203', '416', '295', '2022-10-24', '4', '3'),

('9789127179554', 'Potatis', 'Svenska', '249', '189', '888', '2022-10-24', '5', '4');

--Utöver ett identity-ID så behöver tabellen kolumner för att lagra butiksnamn samt addressuppgifter.

CREATE TABLE Butiker (
ButikId int NOT NULL,
Butiksnamn nvarchar(100),
Adress nvarchar(100),

CONSTRAINT PK_ButikId		PRIMARY KEY (ButikId)
);


INSERT INTO Butiker (ButikId, Butiksnamn, Adress)
VALUES
('1', 'Spåntorgetsbokhandel', 'Smörslottsgatan 64'),
('2', 'Stabbetorgetsbokhandel', 'Stabbetorget 6'),
('3', 'Trätorgetsbokhandel', 'Trätorget 1');



--I denna tabell vill vi ha 3 kolumner: ButikID som kopplas mot Butiker, ISBN som kopplas mot böcker,
--samt Antal som säger hur många exemplar det finns av en given bok i en viss butik. Som PK vill vi ha en kompositnyckel på kolumnerna ButikID och ISBN.

CREATE TABLE LagerSaldo (
ButikId int NOT NULL,
ISBN varchar CHECK (LEN(ISBN) = 13) NOT NULL,
Antal int,

CONSTRAINT FK_ButikId_Butiker		FOREIGN KEY(ButikId) REFERENCES Butiker(ButikId), 
CONSTRAINT FK_ISBN_Böcker			FOREIGN KEY(ISBN) REFERENCES Böcker(ISBN),
CONSTRAINT CK_LagerSaldo			PRIMARY KEY(ButikId, ISBN)
);



INSERT INTO LagerSaldo (ID, Förnamn, Efternamn, Födelsedatum)
VALUES 
(value1, value2, value3, ...); 

--De 4 tabellerna som är specificerade ovan är ett minimum att implementera. Utöver det ska du dock lägga till ytterligare minst 2 tabeller 
--(minst 4 för VG) med information som kan vara lämplig att lagra för bokhandelns syfte, och skapa nycklar och relationer mellan dessa.
--Exempel på tabeller skulle kunna vara ”Kunder”, ”Ordrar” och ”Förlag”. Vad behöver man spara för uppgifter i de olika tabellerna?
--Vad för andra tabeller kan vi behöva? Hur kommer de vara relaterade till varandra och våra 4 tidigare tabeller?
--Eventuellt kan vi behöva uppdatera våra 4 tidigare tabeller med kolumner för att relatera till de nya.


CREATE TABLE Kunder (
KundId int NOT NULL,
Förnamn nvarchar (100),		
Efternamn nvarchar (100),
Postnummer varchar CHECK (LEN(Postnummer) = 5),
Epost nvarchar UNIQUE,

CONSTRAINT PK_KundId		PRIMARY KEY(KundId)
);

INSERT INTO Kunder (KundId, Förnamn, Efternamn, Postnummer, Epost)
Values
('1', 'Förnamn', 'Efternamn', 'Postnummer', 'Epost'),
('2', 'Förnamn', 'Efternamn', 'Postnummer', 'Epost'),
('3', 'Förnamn', 'Efternamn', 'Postnummer', 'Epost'),
('4', 'Förnamn', 'Efternamn', 'Postnummer', 'Epost'),


CREATE TABLE Förlag (
FörlagId int NOT NULL,
Förlagsnamn nvarchar (100),

CONSTRAINT PK_FörlagId		PRIMARY KEY(FörlagId)
);


INSERT INTO Förlag (FörlagId, Förlagsnamn)
Values
('1', 'Albert Bonniers Förlag'),
('2', 'Ballantine Books'),
('3', 'Gallimard'),
('4', 'Månpocket'),
('5', 'Natur Kultur Allmänlitteratur'),
('6', 'Norstedts'),
('7', 'Random House US'),
('8', 'Reclam Philipp Jun');

