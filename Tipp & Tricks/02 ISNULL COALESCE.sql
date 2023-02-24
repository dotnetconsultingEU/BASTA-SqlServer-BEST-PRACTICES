-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

DECLARE @v1 VARCHAR(10) = NULL;
DECLARE @v2 VARCHAR(10) = 'v2';
DECLARE @v3 VARCHAR(10) = 'v3';
DECLARE @v4 VARCHAR(50) = 'v4';

-- Erster Wert NULL, dann Zweiten liefern
SELECT ISNULL(@v1, @v4);

-- Ist ein Wert NULL, wird nach dem jeweils nächsten geschaut
SELECT COALESCE(@v1, @v2, @v3, @v4, 'Default');
