-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

-- OK
SELECT CONVERT(INT, '100') AS ValueInt;
SELECT TRY_CONVERT(INT, '100') AS ValueInt;
SELECT PARSE('123' AS INT) AS ValueInt;
SELECT TRY_PARSE('123' AS INT);

-- Fehler
SELECT CONVERT(INT, 'A100.000') AS ValueInt;
SELECT TRY_CONVERT(INT, 'A100.000') AS ValueInt;
SELECT PARSE('Eins' AS INT)
SELECT TRY_PARSE('Eins' AS INT)


SELECT ISNULL(TRY_PARSE('Eins' AS INT), 99);
SELECT ISNULL(TRY_PARSE('2012-99-99' AS DATE), GETDATE());

