-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

-- Ab SQL Server 2016 muss nicht mehr geprüft werden, ob
-- DROP ausgeführt werden kann
-- CREATE oder ALTER ausgeführt werden können

USE [AdventureWorks];
GO

-- Tabelle nur löschen wenn vorhanden
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

-- Und wieder löschen
DROP PROCEDURE IF EXISTS [dbo].[usp_DoDemo];
GO

DROP PROCEDURE IF EXISTS [dbo].[usp_DoDemo];
GO
