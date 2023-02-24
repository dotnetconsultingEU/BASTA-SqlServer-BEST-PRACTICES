-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

-- Datenbank Snapshot anlegen (Windows)
USE [master];
GO
CREATE DATABASE AdventureWorksSnapshot ON
( NAME = AdventureWorks_Data, FILENAME = 'C:\Temp\Databases\AdventureWorks_Data.snapshot' )
AS SNAPSHOT OF AdventureWorks;
GO

-- Datenbank Snapshot anlegen (Linux)
CREATE DATABASE AdventureWorksSnapshot ON
( NAME = AdventureWorks_Data, FILENAME = '/var/opt/mssql/data/AdventureWorks_Data.snapshot' )
AS SNAPSHOT OF AdventureWorks;
GO

-- Snapshots und Datenbank sind technisch sehr �hnlich
SELECT * FROM sys.databases;

-- Restore der DB auf den Stand des Snapshots
USE MASTER;
ALTER DATABASE AdventureWorks SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
RESTORE DATABASE AdventureWorks FROM DATABASE_SNAPSHOT = 'AdventureWorksSnapshot';

-- Snapshot l�schen
USE MASTER;
-- Es darf keine Verbindungen zum Snapshot geben
DROP DATABASE AdventureWorksSnapShot;


