-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

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
