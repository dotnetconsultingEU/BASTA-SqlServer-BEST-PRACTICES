-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

USE [AdventureWorks];

-- Tabelle [Person].[Person] hat 19.972 Zeilen

-- READ UNCOMMITED
SELECT * FROM [Person].[Person] (NOLOCK) where BusinessEntityId < 10;

-- SKIP locked rows
SELECT * FROM [Person].[Person] (READPAST) where BusinessEntityId < 10;

-- Achtung bei gr��eren Datenmengen
SELECT * FROM [Person].[Person] (NOLOCK); -- Ergebnis
SELECT * FROM [Person].[Person] (READPAST); -- Blockiert

-- == Mit anderer Verbindung ausf�hren == --
USE [AdventureWorks];

BEGIN TRANSACTION;
UPDATE TOP (10) [Person].[Person]
SET Firstname = 'Thorsten' WHERE BusinessEntityID < 5;