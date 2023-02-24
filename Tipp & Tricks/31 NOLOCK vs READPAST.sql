-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

USE [AdventureWorks];

-- Tabelle [Person].[Person] hat 19.972 Zeilen

-- READ UNCOMMITED
SELECT * FROM [Person].[Person] (NOLOCK) where BusinessEntityId < 10;

-- SKIP locked rows
SELECT * FROM [Person].[Person] (READPAST) where BusinessEntityId < 10;

-- Achtung bei größeren Datenmengen
SELECT * FROM [Person].[Person] (NOLOCK); -- Ergebnis
SELECT * FROM [Person].[Person] (READPAST); -- Blockiert

-- == Mit anderer Verbindung ausführen == --
USE [AdventureWorks];

BEGIN TRANSACTION;
UPDATE TOP (10) [Person].[Person]
SET Firstname = 'Thorsten' WHERE BusinessEntityID < 5;