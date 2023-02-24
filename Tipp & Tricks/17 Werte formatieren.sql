-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

-- Formatieren ab SQL Server 2012

DECLARE @date DATE = '2012-01-12';
SELECT FORMAT(@date, 'dd/MM/yyyy', 'en-US');
SELECT FORMAT(@date, 'dd/MM/yyyy', 'de-DE');
SELECT FORMAT(@date, 'd', 'de-DE');
SELECT FORMAT(@date, 'yyyy-MM-dd');
SELECT FORMAT(@date, 'dddd, dd. MMM yyyy', 'de-DE');

DECLARE @amount DECIMAL(12,2) = 1234567.34;
SELECT FORMAT(@amount, 'C', 'de-DE');
SELECT FORMAT(@amount, 'C', 'en-US');
SELECT FORMAT(@amount, 'C', 'en-GB');

DECLARE @value DECIMAL(12,2) = 1234567.34;
SELECT FORMAT(@value, 'N2', 'de-DE');
SELECT FORMAT(@value, 'N0', 'en-US');
SELECT FORMAT(@value, 'N', 'en-GB');

DECLARE @value int = 15;
SELECT FORMAT(@value, 'X');
