-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

USE [AdventureWorks];
GO

DECLARE @MaxRandom INT = 14; -- Zufallszahlen von 0..13 sind gesucht

SELECT CAST(RAND() * @MaxRandom AS INT),		-- RAND() wird nur einmal pro Abfrage ausgeführt
	   ABS(CHECKSUM(NewId())) % @MaxRandom      -- NewID() wird pro Zeile ausgeführt
	   -- ,'|' '|', * 
FROM [Person].[Person];  -- Dummy Tabelle für ein paar Zeilen



