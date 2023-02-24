-- Disclaimer:
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Es wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen steht der Autor gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

-- Datenbank wechseln
USE Adventureworks;
GO

SELECT *, -- Spalten wie gew�hnlich ausw�hlen
	-- In Klammern kann die skalare R�ckgabe einer Unterabfrage 
	-- als Spalte verwendet werden
	(SELECT MAX(LEN([Lastname])) FROM [Person].[Person]) AS 'Maximale L�nge'
FROM [Person].[Person];

SELECT *, -- Spalten wie gew�hnlich ausw�hlen
	-- Die Unterabfrage kann durch die Hauptabfrage eingeschr�nkt werden 
	(SELECT COUNT(*) FROM [Person].[Person] WHERE [Lastname] = [pv].[Lastname]) AS 'Anzahl des Namens'
FROM [Person].[Person] [pv];

-- Damit lassen sich gleiche Namen in der Forma "x von y" durchnummerieren
SELECT *, -- Spalten wie gew�hnlich ausw�hlen
	-- Die Unterabfrage kann durch die Hauptabfrage eingeschr�nkt werden 
	ROW_NUMBER() OVER (PARTITION BY [Lastname] ORDER BY [BusinessEntityId]) AS 'Akt Nr',
	(SELECT COUNT(*) FROM [Person].[Person] WHERE [Lastname] = [pv].[Lastname]) AS 'Anzahl des Namens'
FROM [Person].[Person] [pv];

-- Damit lassen sich gleiche Namen in der Form "x von y" durchnummerieren
SELECT 
	CONCAT(ROW_NUMBER() OVER (PARTITION BY [Lastname] ORDER BY [BusinessEntityId]), 
		   ' von ',
	       (SELECT COUNT(*) FROM [Person].[Person] WHERE [Lastname] = [pv].[Lastname])
		  ) AS 'Nummerierung', 
	[Lastname],
	[BusinessEntityId]
FROM [Person].[Person] [pv]
ORDER BY [Lastname], [BusinessEntityId];




-- Alle Spalten und eine Nummerierung ausgeben
SELECT 
	ROW_NUMBER() OVER (PARTITION BY [Lastname] ORDER BY [BusinessEntityId] ) AS 'Nr',
	*
FROM [Person].[Person] [pv];

-- F�r z.B. Einschr�nkungen auf ROW_NUMBER() muss die gesamte Abfrage
-- als Unterabfrage gekapselt werden
SELECT * FROM 
(
	SELECT 
		ROW_NUMBER() OVER (PARTITION BY [Lastname] ORDER BY [BusinessEntityId]) AS 'Nr',
		*
	FROM [Person].[Person] [pv]
) _ ; 
-- Der Unterscore ('_') ist ein Alias der vorhanden sein muss auch wenn
-- er nicht verwendet wird, sonst gibt es einen Fehler

-- Damit kann gefiltert (oder auch sortiert, etc.) werden
SELECT * FROM 
(
	SELECT 
		ROW_NUMBER() OVER (PARTITION BY [Lastname] ORDER BY [BusinessEntityId]) AS 'Nr',
		*
	FROM [Person].[Person] [pv]
) _ 
WHERE Nr = 1;