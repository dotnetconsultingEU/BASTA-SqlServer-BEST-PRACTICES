-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

-- Morgen
SELECT DATEADD(DAY, 1, GETDATE());
-- Gestern
SELECT DATEADD(DAY, -1, GETDATE());

--NANOSECOND, MICROSECOND, MILLISECOND
--SECOND, MINUTE, HOUR
--DAY (DAYOFYEAR, WEEKDAY), WEEK
--MONTH, QUARTER, YEAR

-- Datum/ Uhrzeit aus Fragmenten erstellen
SELECT TIMEFROMPARTS (18, 15, 59, 0, 0);
SELECT DATEFROMPARTS (1971, 12, 18);

-- Fragmente aus Datum/ Uhrzeit
SELECT DATEPART (DAY, GETDATE());
SELECT DATEPART (DAYOFYEAR, GETDATE());
SELECT DATEPART (TZOFFSET, '2019-05-10  00:00:01.1234567 +05:30');

--NANOSECOND, MICROSECOND, MILLISECOND
--SECOND, MINUTE, HOUR
--DAY, DAYOFYEAR, WEEKDAY, WEEK, ISO_WEEK
--MONTH, QUARTER, YEAR
--TZOFFSET

SELECT YEAR(GETDATE());
SELECT MONTH(GETDATE());
SELECT DAY(GETDATE());
