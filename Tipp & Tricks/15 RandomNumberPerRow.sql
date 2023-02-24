-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

USE [AdventureWorks];
GO

DECLARE @MaxRandom INT = 14; -- Zufallszahlen von 0..13 sind gesucht

SELECT CAST(RAND() * @MaxRandom AS INT),		-- RAND() wird nur einmal pro Abfrage ausgef�hrt
	   ABS(CHECKSUM(NewId())) % @MaxRandom      -- NewID() wird pro Zeile ausgef�hrt
	   -- ,'|' '|', * 
FROM [Person].[Person];  -- Dummy Tabelle f�r ein paar Zeilen



