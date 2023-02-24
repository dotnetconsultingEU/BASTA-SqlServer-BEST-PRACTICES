-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

-- ON => Wenn ein Wert NULL ist, ist das Gesamtergebnis ebenfalls NULL
-- OFF => Wenn ein Wert NULL ist, wird dieser ignoriert

-- Standard ist ON
DBCC USEROPTIONS();

DECLARE @v1 VARCHAR(100) = 'Walle, walle mache Strecke';
DECLARE @v2 VARCHAR(100) = NULL;

SELECT @v1 + @v2; -- => NULL

SET CONCAT_NULL_YIELDS_NULL OFF;

SELECT @v1 + @v2; -- => Walle, walle manche Strecke
GO

-- Unabh�ngig von CONCAT_NULL_YIELDS_NULL und mit allen Datentypen
-- funktioniert die CONCAT()-Funktion

DECLARE @v1 VARCHAR(100) = 'Event ';
DECLARE @v2 VARCHAR(100) = NULL;
DECLARE @v3 DATETIME = GETDATE();

SELECT CONCAT(@v1, @v2, 'Zeitpunkt: ', @v3); -- => Walle, walle manche Strecke
