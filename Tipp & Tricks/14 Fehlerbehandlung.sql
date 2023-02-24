-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.
-- Thorsten Kansy, www.dotnetconsulting.eu

-- Datenbank (erneut) anlegen und wechseln

:SETVAR dbname dotnetconsulting_Fehlerbehandlung
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
CREATE PROCEDURE [dbo].[usp_StoredProcedure_Errorhandling_LogErrorInfo]
AS
SELECT -- Details über den letzten Fehler ausgeben
     ERROR_NUMBER() AS ErrorNumber
    ,ERROR_SEVERITY() AS ErrorSeverity
    ,ERROR_STATE() AS ErrorState
    ,ERROR_PROCEDURE() AS ErrorProcedure
    ,ERROR_LINE() AS ErrorLine
    ,ERROR_MESSAGE() AS ErrorMessage;
GO

-- Stored Procedure anlegen
CREATE PROC [dbo].[usp_StoredProcedure_Errorhandling] 
AS
BEGIN
	-- Wenn keine spezielle Verarbeitung im Fehlerfall benötigt wird,
	-- reicht SET XACT_ABORT ON. Hier haben wir etwas spezielles vor
	SET XACT_ABORT OFF;

	BEGIN TRY
		-- 'Natürlicher Fehler'
		 SELECT 1/0;

		-- 'Künstliche' Fehler
		--THROW 50001, -- Fehlercode >= 50000
		--	  'Throw löst einen Fehler aus', -- Fehlertext
		--	  1; -- State

		--RAISERROR ('RAISERROR löst einen Fehler aus', -- Fehlertext
		--			11, -- Severity (Schweregrad) 11-19 ODER SETERROR werden vom CATCH-Block abgefangen
		--			1) -- State
		--			WITH LOG,			-- In das Serverlog schreiben
		--				 NOWAIT,		-- Sofort und ohne Verzögerung an den Client schicken
		--				 SETERROR;		-- Unabhängig von Severity als Fehler betrachten
	END TRY
	BEGIN CATCH
		IF @@Error != 0 --  Fehler vorhanden? Sollte so sein,aber das ist ja ein Demo
			EXECUTE [dbo].[usp_StoredProcedure_Errorhandling_LogErrorInfo];

		-- Fehler an Aufrufer 'hochreichen'?
		THROW;
	END CATCH
END;
GO

-- Aufruf
EXEC [dbo].[usp_StoredProcedure_Errorhandling]; 

