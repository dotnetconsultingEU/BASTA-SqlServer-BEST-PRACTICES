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

-- SELECT * from Person.Address ORDER BY AddressID ASC

-- Nächste Zeile
SELECT AddressLine1, LEAD(AddressLine1) OVER (ORDER BY AddressID ASC) FROM Person.Address;
-- Übernächste Zeile
SELECT AddressLine1, LEAD(AddressLine1, 2) OVER (ORDER BY AddressID ASC) FROM Person.Address;
-- Übernächste Zeile mit Standardwert
SELECT AddressLine1, LEAD(AddressLine1, 2, '-') OVER (ORDER BY AddressID ASC) FROM Person.Address;

-- Vorherige Zeile
SELECT AddressLine1, LAG(AddressLine1) OVER (ORDER BY AddressID ASC) FROM Person.Address;
-- vor vorherige Zeile
SELECT AddressLine1, LAG(AddressLine1, 2) OVER (ORDER BY AddressID ASC) FROM Person.Address;
-- vor vorherige Zeile mit Standardwert
SELECT AddressLine1, LAG(AddressLine1, 2, '-') OVER (ORDER BY AddressID ASC) FROM Person.Address;