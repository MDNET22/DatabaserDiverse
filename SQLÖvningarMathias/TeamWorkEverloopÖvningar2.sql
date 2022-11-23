--use everyloop;

--select * from company.orders;
--select * from company.products;
--select * from company.order_details;


-- Övning 1 // Företagets totala produktkatalog består av 77 unika produkter. Om vi kollar bland våra ordrar, hur stor andel av dessa produkter har vi någon gång leverarat till London?

--SELECT CONVERT(float, COUNT(DISTINCT ProductId)) / CONVERT(float, 77) * 100 as Antal
--FROM
--        company.orders 
--JOIN    company.order_details ON company.orders.Id = OrderId
--JOIN    company.products ON ProductId = company.products.Id
--WHERE ShipCity = 'London';

-- Övning 2 // Magnus

--SELECT * FROM company.orders ORDER BY ShipCity ASC;
--SELECT * FROM company.order_details;
--SELECT COUNT(DISTINCT OrderId) as OrderIdCount, ShipCity
--FROM
--        company.orders 
--JOIN    company.order_details ON company.orders.Id = OrderId
--JOIN    company.products ON ProductId = company.products.Id
--GROUP BY ShipCity;

-- Övning 2 // Till vilken stad har vi levererat flest unika produkter?
--SELECT ShipCity, COUNT(DISTINCT ProductName) as nProducts FROM company.orders 
--JOIN company.order_details ON company.orders.Id = OrderId
--JOIN company.products ON ProductID = company.products.Id
--GROUP BY ShipCity
--ORDER BY nProducts DESC;

-- Övning 3 // Av de produkter som inte längre finns I vårat sortiment, hur mycket har vi sålt för totalt till Tyskland?
--SELECT ProductId, ShipName, company.order_details.UnitPrice, Quantity, Discount FROM company.orders
--JOIN company.order_details ON company.orders.Id = OrderId
--JOIN company.products ON ProductId = company.products.Id
--WHERE ShipCountry like 'Germany' AND Discontinued = 1;

--SELECT SUM((company.order_details.UnitPrice*Quantity)*(1-Discount)) AS Sum_of_discontinued_prods FROM company.orders
--JOIN company.order_details ON company.orders.Id = OrderId
--JOIN company.products ON ProductId = company.products.Id
--WHERE ShipCountry like 'Germany' AND Discontinued = 1;

-- Övning 4 // För vilken produktkategori har vi högst lagervärde?
--SELECT categories.Id, categories.CategoryName, SUM(UnitsInStock) AS TotalUnits 
--FROM company.products
--JOIN company.categories ON company.products.CategoryId = company.categories.Id
--GROUP BY categories.Id, categories.CategoryName
--ORDER BY TotalUnits DESC;

-- Övning 5 // Från vilken leverantör har vi sålt flest produkter totalt under sommaren 2013?

--select * from company.products
--select * from company.suppliers;
--select * from company.orders

--SELECT * from company.orders 
--WHERE OrderDate >= '2013-06-01' AND OrderDate < '2013-09-01';


--select * from company.orders
--join company.order_details on company.orders.Id = company.order_details.OrderId
--join company.products on company.order_details.ProductId = company.products.Id
--join company.suppliers on  

--SELECT CompanyName, COUNT(DISTINCT company.orders.Id) AS SumOrders FROM company.orders 
--JOIN company.order_details ON company.orders.Id = company.order_details.OrderId
--JOIN company.products ON company.order_details.ProductId = company.products.Id 
--JOIN company.suppliers ON company.products.SupplierId = company.suppliers.Id
--WHERE OrderDate >= '2013-06-01' AND OrderDate < '2013-09-01'
--GROUP BY CompanyName
--ORDER BY SumOrders DESC;

--SELECT top 1 CompanyName,  SUM(Quantity) AS SumProducts FROM company.orders 
--JOIN company.order_details ON company.orders.Id = OrderId
--JOIN company.products ON company.order_details.ProductId = company.products.Id
--join company.suppliers ON company.products.SupplierId = company.suppliers.Id
--WHERE OrderDate >= '2013-06-01' AND OrderDate < '2013-09-01'
--GROUP BY CompanyName
--ORDER BY SumProducts DESC;

---- Svar på uppgift 5

-- Av alla audiospår, vilken artist har längst total speltid?


--declare @playlist varchar(max) = 'Heavy Metal Classic';

--select * from music.tracks
--join music.albums on music.tracks.AlbumId = music.albums.AlbumId
--join music.artists on music.albums.Artistid = music.artists.ArtistId
--join music.genres on music.tracks.GenreId = music.genres.GenreId
--join music.playlist_track ON music.tracks.TrackId = music.playlist_track.TrackId
--where PlaylistId = 17;

-- Genre 	Artist 	Album 	Track 	Length 	Size 	Composer

--select * into music.tracks2 from music.tracks;

-- Byta ut null mot .
--update music.tracks
--set Composer = '-'
--where Composer is null;

--SELECT genres.Name AS Genre, artists.Name AS Artist, albums.Title AS Album, tracks.Name AS Track, Milliseconds AS Length, Bytes AS Size, Composer
--FROM music.tracks 
--JOIN music.albums ON music.tracks.AlbumId = music.albums.AlbumId
--JOIN music.artists ON music.albums.Artistid = music.artists.ArtistId
--JOIN music.genres ON music.tracks.GenreId = music.genres.GenreId
--JOIN music.playlist_track ON music.tracks.TrackId = music.playlist_track.TrackId
--WHERE PlaylistId = 17;

SELECT genres.Name AS Genre, artists.Name AS Artist, albums.Title AS Album, tracks.Name AS Track, 
RIGHT(CONVERT(CHAR(8),DATEADD(second, (Milliseconds / (1000)), 0),108),5) AS Length,
CONCAT(ROUND(CONVERT(float, Bytes / CONVERT(float, 1048576)), 1), ' MiB') AS Size, Composer
FROM music.tracks
JOIN music.albums ON music.tracks.AlbumId = music.albums.AlbumId
JOIN music.artists ON music.albums.Artistid = music.artists.ArtistId
JOIN music.genres ON music.tracks.GenreId = music.genres.GenreId
JOIN music.playlist_track ON music.tracks.TrackId = music.playlist_track.TrackId
WHERE PlaylistId = 17;