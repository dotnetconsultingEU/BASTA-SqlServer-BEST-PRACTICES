-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

DECLARE @v1 VARCHAR(10) = NULL;
DECLARE @v2 VARCHAR(10) = 'v2';
DECLARE @v3 VARCHAR(10) = 'v3';
DECLARE @v4 VARCHAR(50) = 'v4';

-- Erster Wert NULL, dann Zweiten liefern
SELECT ISNULL(@v1, @v4);

-- Ist ein Wert NULL, wird nach dem jeweils n�chsten geschaut
SELECT COALESCE(@v1, @v2, @v3, @v4, 'Default');
