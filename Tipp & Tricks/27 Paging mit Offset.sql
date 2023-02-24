-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

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
