--use everyloop;


--select * from GameOfThrones;


--select Title, CONCAT(FORMAT(Season, 'S0#') ,FORMAT(EpisodeInSeason, 'E0#')) as Episode
--FROM GameOfThrones;

--select * from Users2;

--SELECT LOWER(CONCAT(SUBSTRING(FirstName, 1, 2), SUBSTRING(LastName, 1, 2))) AS UserName
--FROM Users2;

--update Users2
--set UserName = LOWER(CONCAT(SUBSTRING(FirstName, 1, 2),
--SUBSTRING(LastName, 1, 2)));

--select * from Airports2;

--update Airports2
--set Time = '-'
--where Time IS NULL;


--update Airports2
--set DST = '-'
--where DST IS NULL;

--Ta bort de rader från (kopia på) tabellen Elements där ”Name” är någon av följande:
--'Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium', samt alla rader där ”Name” börjar
--på någon av bokstäverna d, k, m, o, eller u.

--delete from Elements2
--where Name IN ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium')
--and Name IN ('d%', 'k%', 'm%', 'o%', 'u%'); 

--DELETE FROM Elements2
-- WHERE [Name] IN ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium') or
-- [Name] LIKE 'D%' or [name] like 'K%' or [name] like 'M%' or [name] like 'O%' or [name] like 'U%';

--select * from Elements3;

--delete from Elements3
--where name = 'D%' and name = 'K%' and name = 'M%' and name = 'O%' and name = 'U%';

 --DELETE FROM Elements3
 --WHERE [Name] IN ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium') or
 --[Name] LIKE 'd%' or [name] like 'k%' or [name] like 'm%' or [name] like 'o%' or [name] like'u%';