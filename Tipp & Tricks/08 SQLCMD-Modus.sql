-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

-- Variable definieren
:SETVAR dbname dotnetconsulting_DemoDb
PRINT'$(dbname)';

-- OS-Befehl
!!DIR

-- Aufhören bei einem Fehler
:ON ERROR EXIT

-- Im Skript, Verbindung zu einem anderen SQL Server wechseln
:CONNECT (local)
SELECT @@Servername;
GO

:CONNECT (localdb)\MSSQLLocalDB
SELECT @@Servername;

-- Backup auf einem Server erstellen & auf einem Anderen einspielen
:SETVAR dbname AdventureWorks
:CONNECT (localdb)\MSSQLLocalDB
BACKUP DATABASE [$(dbname)] TO  DISK = N'c:\temp\databases\$(dbname).bak' 
WITH NOFORMAT, INIT, SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

:CONNECT (local)
USE [master]
RESTORE DATABASE [$(dbname)Restore] FROM 
DISK = N'C:\Temp\Databases\$(dbname).bak' WITH  FILE = 1,  
MOVE N'$(dbname)2012' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\$(dbname)Restore2012.mdf',  
MOVE N'$(dbname)2012_log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\$(dbname)2012_log.ldf',  NOUNLOAD,  STATS = 5
