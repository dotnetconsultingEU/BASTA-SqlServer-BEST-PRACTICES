-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

USE AdventureWorks;
GO

-- Vor SQL Server 2012
DECLARE @Von INT;
DECLARE @Bis INT;

SET @Von = 21;
SET @Bis = 30;

SELECT * FROM 
(SELECT ROW_NUMBER() OVER (ORDER BY [BusinessEntityId]) AS [RowNr], * FROM [Person].[Person]) T
WHERE RowNr BETWEEN @Von AND @Bis;

-- Ab SQL Server 2012
GO
DECLARE @Von INT = 21;
DECLARE @Bis INT = 30;

SELECT * FROM [Person].[Person]
ORDER BY [BusinessEntityId]
OFFSET (@Von - 1) ROWS
FETCH NEXT @Bis - @Von + 1 ROWS ONLY;
