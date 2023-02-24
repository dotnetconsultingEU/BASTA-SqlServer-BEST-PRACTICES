-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

-- Ab SQL Server 2016 muss nicht mehr gepr�ft werden, ob
-- DROP ausgef�hrt werden kann
-- CREATE oder ALTER ausgef�hrt werden k�nnen

USE [AdventureWorks];
GO

-- Tabelle nur l�schen wenn vorhanden
DROP TABLE IF EXISTS [dbo].[DatabaseLog];
DROP TABLE IF EXISTS [dbo].[DatabaseLog];
DROP TABLE IF EXISTS [dbo].[DatabaseLog];

-- Prozedur nur anlegen oder anpassen
CREATE OR ALTER PROCEDURE [dbo].[usp_DoDemo]
AS
	SELECT 1;
GO

CREATE OR ALTER PROCEDURE [dbo].[usp_DoDemo]
AS
	SELECT 2;
GO

CREATE OR ALTER PROCEDURE [dbo].[usp_DoDemo]
AS
	SELECT 3;
GO
-- Ausprobieren
EXEC [dbo].[usp_DoDemo];

-- Und wieder l�schen
DROP PROCEDURE IF EXISTS [dbo].[usp_DoDemo];
GO

DROP PROCEDURE IF EXISTS [dbo].[usp_DoDemo];
GO
