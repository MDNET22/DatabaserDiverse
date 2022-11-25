use everyloop;

--1: Ta ut (select) en rad f�r varje (unik) period i tabellen �Elements� med f�ljande kolumner: 
--�period�, �from� med l�gsta atomnumret i perioden, �to� med h�gsta atomnumret i perioden, 
--�average isotopes� med genomsnittligt antal isotoper visat med 2 decimaler, �symbols� 
--med en kommaseparerad lista av alla �mnen i perioden.
--select * from Elements;
         
--SELECT 
--DISTINCT [Period], 
--MIN(Number) AS [from],
--MAX(Number) AS [to],
--ROUND(AVG(CONVERT(float, Stableisotopes)), 2) AS [average isotopes],
--STRING_AGG(Symbol, ', ') AS [symbols]
--FROM [Elements]
--GROUP BY Period;


--2: F�r varje stad som har 2 eller fler kunder i tabellen Customers, ta ut (select) f�ljande 
--kolumner: �Region�, �Country�, �City�, samt �Customers� som anger hur m�nga kunder som 
--finns i staden.

--select * from company.customers;

--SELECT Region, Country, City, COUNT(City) AS Customers
--FROM company.customers
--GROUP BY City, Region, Country,
--HAVING COUNT(City) > 1;


--3: Skapa en varchar-variabel och skriv en select-sats som s�tter v�rdet: 
--�S�song 1 s�ndes fr�n april till juni 2011. Totalt s�ndes 10 avsnitt, som i genomsnitt 
--s�gs av 2.5 miljoner m�nniskor i USA.�, f�ljt av radbyte/char(13), f�ljt av 
--�S�song 2 s�ndes �� osv. N�r du sedan skriver (print) variabeln till messages ska du 
--allts� f� en rad f�r varje s�song enligt ovan, med data sammanst�llt fr�n tabellen GameOfThrones. 
--Tips: Ange �sv� som tredje parameter i format() f�r svenska m�nader.


--DECLARE @GameOfThrones AS varchar(max)
--SELECT @GameOfThrones=''

--SELECT 
--@GameOfThrones +=  
--'S�song ' + CONVERT(VARCHAR, Season) + ' s�ndes fr�n ' + 
--FORMAT(MIN([Original air date]), 'MMMM', 'sv') + ' till ' + 
--FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv') + '. Totalt s�ndes ' + 
--CONVERT(VARCHAR, MAX(EpisodeInSeason)) + ' avsnitt, som i genomsnitt s�gs av ' +
--CONVERT(VARCHAR, ROUND(AVG([U.S. viewers(millions)]), 2)) + ' miljoner m�nniskor i USA.' + CHAR(13)
--FROM GameOfThrones
--GROUP BY Season
--PRINT @GameOfThrones;


--4: Ta ut (select) alla anv�ndare i tabellen �Users� s� du f�r tre kolumner: �Namn� som har 
--fulla namnet; ��lder� som visar hur m�nga �r personen �r idag (ex. �45 �r�); �K�n� som visar 
--om det �r en man eller kvinna. Sortera raderna efter f�r- och efternamn.

--SELECT
--CONCAT(FirstName, ' ', LastName) AS Namn, 
--CONCAT(DATEDIFF(year, SUBSTRING([ID], 1, 6), GETDATE()), + ' �r') AS �lder, 
--CASE
--    WHEN SUBSTRING([ID], 10, 1) %2 = 0 THEN 'Kvinna'
--    ELSE 'Man'
--END AS K�n
--FROM Users
--ORDER BY FirstName, LastName

--5: Ta ut en lista �ver regioner i tabellen �Countries� d�r det f�r varje region framg�r 
--regionens namn, antal l�nder i regionen, totalt antal inv�nare, total area, befolkningst�theten 
--med 2 decimaler, samt sp�dbarnsd�dligheten per 100.000 f�dslar avrundat till heltal.

--SELECT 
--Region, 
--COUNT(Country) AS Countries, 
--SUM(CONVERT (bigint, [Population])) AS population,
--SUM([Area (sq# mi#)]) AS TotalArea,
--ROUND(AVG(CONVERT(float, REPLACE([Pop# Density (per sq# mi#)], ',', ''))) / 10, 2) AS Density,
--ROUND(AVG(CONVERT(float, REPLACE([Infant mortality (per 1000 births)], ',', ''))), 0) AS InfantMortality
--FROM Countries
--GROUP BY Region;

--6: Fr�n tabellen �Airports�, gruppera per land och ta ut kolumner som visar: land, 
--antal flygplatser (IATA-koder), antal som saknar ICAO-kod, samt hur m�nga procent av 
--flygplatserna i varje land som saknar ICAO-kod.

--select * from Airports;

--SELECT * FROM Airports
--ORDER BY [Location served];

SELECT COUNT(IATA) AS [Count IATA], 
SUBSTRING([Location served], LEN([Location served]) - CHARINDEX(',', REVERSE([Location served])) + 3, LEN([Location served])) AS Country,
SUM(CASE
    WHEN ICAO IS NULL THEN 1 ELSE 0 END) 
AS [Count Missing ICAO],
    FORMAT(CONVERT(float, SUM(CASE
        WHEN ICAO IS NULL THEN 1 ELSE 0 END)) / (COUNT(IATA)), 'p') AS [Percent missing ICAO] 
FROM Airports
GROUP BY SUBSTRING([Location served], LEN([Location served]) - CHARINDEX(',', REVERSE([Location served])) + 3, LEN([Location served]))
ORDER BY Country;