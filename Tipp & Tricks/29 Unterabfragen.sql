-- Disclaimer:
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Es wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen steht der Autor gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

-- Datenbank wechseln
USE Adventureworks;
GO

SELECT *, -- Spalten wie gewöhnlich auswählen
	-- In Klammern kann die skalare Rückgabe einer Unterabfrage 
	-- als Spalte verwendet werden
	(SELECT MAX(LEN([Lastname])) FROM [Person].[Person]) AS 'Maximale Länge'
FROM [Person].[Person];

SELECT *, -- Spalten wie gewöhnlich auswählen
	-- Die Unterabfrage kann durch die Hauptabfrage eingeschränkt werden 
	(SELECT COUNT(*) FROM [Person].[Person] WHERE [Lastname] = [pv].[Lastname]) AS 'Anzahl des Namens'
FROM [Person].[Person] [pv];

-- Damit lassen sich gleiche Namen in der Forma "x von y" durchnummerieren
SELECT *, -- Spalten wie gewöhnlich auswählen
	-- Die Unterabfrage kann durch die Hauptabfrage eingeschränkt werden 
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

-- Für z.B. Einschränkungen auf ROW_NUMBER() muss die gesamte Abfrage
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