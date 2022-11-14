--CREATE DATABASE DjurDb;

--CREATE DATABASE KlassenDb;
--USE DjurDb;

--CREATE TABLE DjurTbl (
--	[ID] int Primary Key,
--	[Namn] nvarchar(max) not null
--);

--INSERT INTO DjurTbl ([Id], [Namn])
--VALUES (4, 'Kanin'); 

--SELECT * FROM DjurTbl
--WHERE Namn LIKE '%a%';

--DROP DATABASE DjurDb;

--CREATE TABLE PersonTbl (
--	[ID] int Primary Key,
--	[Förnamn] nvarchar(max) not null,
--	[Efternamn] nvarchar(max) not null,
--	[Ålder] int,
--	[Hemort] nvarchar(max) not null
--);


--INSERT INTO PersonTbl ([Id], [Förnamn], [Efternamn], [Ålder], [Hemort])
--VALUES (5, 'Farid', 'Afradi', 33, 'Göteborg');

SELECT * FROM PersonTbl;