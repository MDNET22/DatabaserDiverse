--use everyloop;


--select * from GameOfThrones;


--select Title, CONCAT(FORMAT(Season, 'S0#') ,FORMAT(EpisodeInSeason, 'E0#')) as Episode
--FROM GameOfThrones;


--select Title,
--CASE
--    WHEN EpisodeInSeason < 10 THEN CONCAT(FORMAT(Season, 'S0#') ,FORMAT(EpisodeInSeason, 'E0#'))
--    WHEN EpisodeInSeason >= 10 THEN CONCAT(FORMAT(Season, 'S0#') ,FORMAT(EpisodeInSeason, 'E#'))
--END AS Episode
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

--select * from Elements2;

--delete from Elements2
--where name = 'D%' and name = 'K%' and name = 'M%' and name = 'O%' and name = 'U%';

 --DELETE FROM Elements2
 --WHERE [Name] IN ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium') or
 --[Name] LIKE 'd%' or [name] like 'k%' or [name] like 'm%' or [name] like 'o%' or [name] like'u%';

 --truncate table users tar bort alla rader ur users



 --DELETE FROM Elements3
 --WHERE [Name] IN ('Erbium', 'Helium', 'Nitrogen', 'Platinum', 'Selenium', 'd%', 'k%', 'm%', 'm%', 'u%');

 --select * into Elements3 from Elements;


 --select * from Elements5;

--SELECT Symbol, [Name], 
--    CASE 
--        WHEN SUBSTRING([Name], 1, 2) = Symbol AND LEN(Symbol) > 1 THEN 'Yes'
--        WHEN SUBSTRING([Name], 1, 1) = Symbol AND LEN(Symbol) < 2 THEN 'Yes'
--        ELSE 'No'
--END AS Yesno 
--INTO Elements5
--FROM Elements;


--SELECT [Name]
--      ,[Red]
--      ,[Green]
--      ,[Blue]
--	  into Colors2
--  FROM [dbo].[Colors]


--SELECT CONVERT(INT, CONVERT(VARBINARY, '0x1FFFFF', 1))

--select * from Colors2;
--select * from Colors; 

--SELECT CONVERT(Varbinary(1), Red) RedHex, CONVERT(Varbinary(1), Green) GreenHex, CONVERT(Varbinary(1), Blue) BlueHex FROM Colors3;


--SELECT CONVERT(Varbinary(1), Red)+ CONVERT(Varbinary(1), Green) + CONVERT(Varbinary(1), Blue) as code FROM Colors2;

--SELECT [name], '#' + format(Red, 'X') + format(green, 'X') + format(blue, 'X') as Code, Red, Green, Blue from Colors2;

--SELECT [Name], CONVERT(Varbinary(1), Red)+ CONVERT(Varbinary(1), Green) + CONVERT(Varbinary(1), Blue) as code, Red, Green, Blue
--INTO Colors6 
--FROM Colors;

--SELECT [Name], CONCAT('#', CONVERT(VARCHAR(max), code, 2)) AS newCode, Red, Green, Blue FROM Colors6;

