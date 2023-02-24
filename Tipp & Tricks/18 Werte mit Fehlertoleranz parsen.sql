-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

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

