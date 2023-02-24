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

-- SELECT * from Person.Address ORDER BY AddressID ASC

-- N�chste Zeile
SELECT AddressLine1, LEAD(AddressLine1) OVER (ORDER BY AddressID ASC) FROM Person.Address;
-- �bern�chste Zeile
SELECT AddressLine1, LEAD(AddressLine1, 2) OVER (ORDER BY AddressID ASC) FROM Person.Address;
-- �bern�chste Zeile mit Standardwert
SELECT AddressLine1, LEAD(AddressLine1, 2, '-') OVER (ORDER BY AddressID ASC) FROM Person.Address;

-- Vorherige Zeile
SELECT AddressLine1, LAG(AddressLine1) OVER (ORDER BY AddressID ASC) FROM Person.Address;
-- vor vorherige Zeile
SELECT AddressLine1, LAG(AddressLine1, 2) OVER (ORDER BY AddressID ASC) FROM Person.Address;
-- vor vorherige Zeile mit Standardwert
SELECT AddressLine1, LAG(AddressLine1, 2, '-') OVER (ORDER BY AddressID ASC) FROM Person.Address;