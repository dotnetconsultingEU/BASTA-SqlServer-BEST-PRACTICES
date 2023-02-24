-- Disclaimer:
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Es wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen steht der Autor gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

:SETVAR dbname dotnetconsulting_Identity
USE [master];
IF EXISTS (SELECT * FROM [sys].[databases] WHERE [name] = '$(dbname)')
BEGIN
	ALTER DATABASE [$(dbname)] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE [$(dbname)];
	PRINT '''$(dbname)''-Datenbank gelöscht';
END
GO
CREATE DATABASE [$(dbname)];
GO
USE [$(dbname)];
PRINT '''$(dbname)''-Datenbank erstellt und gewechselt';
GO

-- Tabelle mit Identität anlegen

CREATE TABLE [dbo].[DemoTable]
(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Wert1 VARCHAR(50),
	Wert2 VARCHAR(50)
);

-- Identitätswerte beim Einfügen setzen. Auf eigene Verantwortung
SET IDENTITY_INSERT [dbo].[DemoTable] ON;
INSERT [dbo].[DemoTable] 
	(ID, Wert1, Wert2)
	VALUES 
	(1, 'Wert1#1', 'Wert2#1'),
	(2, 'Wert1#1', 'Wert2#1'),
	(3, 'Wert1#1', 'Wert2#1');

SET IDENTITY_INSERT [dbo].[DemoTable] OFF;

-- Nach Identitätswerten filtern
SELECT * FROM [dbo].[DemoTable]
WHERE IDENTITYCOL = 1;

-- Identität abfragen und setzen
DBCC CHECKIDENT('[dbo].[DemoTable]', NORESEED);

DBCC CHECKIDENT('[dbo].[DemoTable]', RESEED, 100); -- 101 ist der nächste Wert
INSERT [dbo].[DemoTable] (Wert1, Wert2) VALUES ('Wert1#4', 'Wert2#4');

-- Letzte vergebenen Werte abfragen
SELECT Scope_Identity(); -- In diese Scope (Ad hoc, Proc, Trigger)
SELECT IDENT_CURRENT('[dbo].[DemoTable]'); -- für eine bestimmte Tabelle/ Sicht. Außerdem: IDENT_SEED() & IDENT_INCR()
SELECT @@identity; -- Generell in dieser Session

-- Ein Blick in die Tabelle
SELECT * FROM [dbo].[DemoTable];

-- BTW: IDENTITY() ist (auch) eine Funktion (in Verbindung mit INTO)
DROP TABLE IF EXISTS #temp;
GO

SELECT IDENTITY(INT, 1, 1) AS ID, *
INTO #temp
FROM [Sales].[vSalesPerson];

SELECT * FROM #temp;

