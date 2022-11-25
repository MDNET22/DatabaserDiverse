use everyloop;

--1: Ta ut (select) en rad för varje (unik) period i tabellen ”Elements” med följande kolumner: 
--”period”, ”from” med lägsta atomnumret i perioden, ”to” med högsta atomnumret i perioden, 
--”average isotopes” med genomsnittligt antal isotoper visat med 2 decimaler, ”symbols” 
--med en kommaseparerad lista av alla ämnen i perioden.
--select * from Elements;
         
--SELECT 
--DISTINCT [Period], 
--MIN(Number) AS [from],
--MAX(Number) AS [to],
--ROUND(AVG(CONVERT(float, Stableisotopes)), 2) AS [average isotopes],
--STRING_AGG(Symbol, ', ') AS [symbols]
--FROM [Elements]
--GROUP BY Period;


--2: För varje stad som har 2 eller fler kunder i tabellen Customers, ta ut (select) följande 
--kolumner: ”Region”, ”Country”, ”City”, samt ”Customers” som anger hur många kunder som 
--finns i staden.

--select * from company.customers;

--SELECT Region, Country, City, COUNT(City) AS Customers
--FROM company.customers
--GROUP BY City, Region, Country,
--HAVING COUNT(City) > 1;


--3: Skapa en varchar-variabel och skriv en select-sats som sätter värdet: 
--”Säsong 1 sändes från april till juni 2011. Totalt sändes 10 avsnitt, som i genomsnitt 
--sågs av 2.5 miljoner människor i USA.”, följt av radbyte/char(13), följt av 
--”Säsong 2 sändes …” osv. När du sedan skriver (print) variabeln till messages ska du 
--alltså få en rad för varje säsong enligt ovan, med data sammanställt från tabellen GameOfThrones. 
--Tips: Ange ’sv’ som tredje parameter i format() för svenska månader.


--DECLARE @GameOfThrones AS varchar(max)
--SELECT @GameOfThrones=''

--SELECT 
--@GameOfThrones +=  
--'Säsong ' + CONVERT(VARCHAR, Season) + ' sändes från ' + 
--FORMAT(MIN([Original air date]), 'MMMM', 'sv') + ' till ' + 
--FORMAT(MAX([Original air date]), 'MMMM yyyy', 'sv') + '. Totalt sändes ' + 
--CONVERT(VARCHAR, MAX(EpisodeInSeason)) + ' avsnitt, som i genomsnitt sågs av ' +
--CONVERT(VARCHAR, ROUND(AVG([U.S. viewers(millions)]), 2)) + ' miljoner människor i USA.' + CHAR(13)
--FROM GameOfThrones
--GROUP BY Season
--PRINT @GameOfThrones;


--4: Ta ut (select) alla användare i tabellen ”Users” så du får tre kolumner: ”Namn” som har 
--fulla namnet; ”Ålder” som visar hur många år personen är idag (ex. ’45 år’); ”Kön” som visar 
--om det är en man eller kvinna. Sortera raderna efter för- och efternamn.

--SELECT
--CONCAT(FirstName, ' ', LastName) AS Namn, 
--CONCAT(DATEDIFF(year, SUBSTRING([ID], 1, 6), GETDATE()), + ' år') AS Ålder, 
--CASE
--    WHEN SUBSTRING([ID], 10, 1) %2 = 0 THEN 'Kvinna'
--    ELSE 'Man'
--END AS Kön
--FROM Users
--ORDER BY FirstName, LastName

--5: Ta ut en lista över regioner i tabellen ”Countries” där det för varje region framgår 
--regionens namn, antal länder i regionen, totalt antal invånare, total area, befolkningstätheten 
--med 2 decimaler, samt spädbarnsdödligheten per 100.000 födslar avrundat till heltal.

--SELECT 
--Region, 
--COUNT(Country) AS Countries, 
--SUM(CONVERT (bigint, [Population])) AS population,
--SUM([Area (sq# mi#)]) AS TotalArea,
--ROUND(AVG(CONVERT(float, REPLACE([Pop# Density (per sq# mi#)], ',', ''))) / 10, 2) AS Density,
--ROUND(AVG(CONVERT(float, REPLACE([Infant mortality (per 1000 births)], ',', ''))), 0) AS InfantMortality
--FROM Countries
--GROUP BY Region;

--6: Från tabellen ”Airports”, gruppera per land och ta ut kolumner som visar: land, 
--antal flygplatser (IATA-koder), antal som saknar ICAO-kod, samt hur många procent av 
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