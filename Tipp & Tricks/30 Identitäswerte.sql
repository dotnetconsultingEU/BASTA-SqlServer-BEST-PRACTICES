-- Disclaimer:
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Es wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen steht der Autor gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

:SETVAR dbname dotnetconsulting_Identity
USE [master];
IF EXISTS (SELECT * FROM [sys].[databases] WHERE [name] = '$(dbname)')
BEGIN
	ALTER DATABASE [$(dbname)] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE [$(dbname)];
	PRINT '''$(dbname)''-Datenbank gel�scht';
END
GO
CREATE DATABASE [$(dbname)];
GO
USE [$(dbname)];
PRINT '''$(dbname)''-Datenbank erstellt und gewechselt';
GO

-- Tabelle mit Identit�t anlegen

CREATE TABLE [dbo].[DemoTable]
(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Wert1 VARCHAR(50),
	Wert2 VARCHAR(50)
);

-- Identit�tswerte beim Einf�gen setzen. Auf eigene Verantwortung
SET IDENTITY_INSERT [dbo].[DemoTable] ON;
INSERT [dbo].[DemoTable] 
	(ID, Wert1, Wert2)
	VALUES 
	(1, 'Wert1#1', 'Wert2#1'),
	(2, 'Wert1#1', 'Wert2#1'),
	(3, 'Wert1#1', 'Wert2#1');

SET IDENTITY_INSERT [dbo].[DemoTable] OFF;

-- Nach Identit�tswerten filtern
SELECT * FROM [dbo].[DemoTable]
WHERE IDENTITYCOL = 1;

-- Identit�t abfragen und setzen
DBCC CHECKIDENT('[dbo].[DemoTable]', NORESEED);

DBCC CHECKIDENT('[dbo].[DemoTable]', RESEED, 100); -- 101 ist der n�chste Wert
INSERT [dbo].[DemoTable] (Wert1, Wert2) VALUES ('Wert1#4', 'Wert2#4');

-- Letzte vergebenen Werte abfragen
SELECT Scope_Identity(); -- In diese Scope (Ad hoc, Proc, Trigger)
SELECT IDENT_CURRENT('[dbo].[DemoTable]'); -- f�r eine bestimmte Tabelle/ Sicht. Au�erdem: IDENT_SEED() & IDENT_INCR()
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

