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
--	[F�rnamn] nvarchar(max) not null,
--	[Efternamn] nvarchar(max) not null,
--	[�lder] int,
--	[Hemort] nvarchar(max) not null
--);


--INSERT INTO PersonTbl ([Id], [F�rnamn], [Efternamn], [�lder], [Hemort])
--VALUES (5, 'Farid', 'Afradi', 33, 'G�teborg');

SELECT * FROM PersonTbl;