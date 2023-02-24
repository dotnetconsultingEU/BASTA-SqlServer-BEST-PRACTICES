-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.
-- Thorsten Kansy, www.dotnetconsulting.eu

-- Datenbank (erneut) anlegen und wechseln
:SETVAR dbname dotnetconsulting_StoredProcedures
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

-- Stored Procedure anlegen
CREATE PROCEDURE [dbo].[usp_StoredProcedure_DumpTempTable]
AS
BEGIN
    SET NOCOUNT ON;

	-- Ausgabe zum Test
	SELECT * FROM #t1;
END;
GO

-- Stored Procedure anlegen
CREATE PROCEDURE [dbo].[usp_StoredProcedure_TempTable]
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @t INT = 99;

	-- Temporäre Tabelle in der SP erstellen
	-- Diese MUSS nicht in der SP gelöscht werden 
	SELECT * INTO #t1 FROM [sys].[databases] ORDER BY [name]

	-- Ausgabe zum Test
	-- Für diese SP ist die Temp Tabelle vorhanden
	EXEC [dbo].[usp_StoredProcedure_DumpTempTable];
END;
GO

-- Aufruf
EXEC [dbo].[usp_StoredProcedure_TempTable]; 

-- Temp Tabelle nicht (mehr) vorhanden
SELECT * FROM #t1;
