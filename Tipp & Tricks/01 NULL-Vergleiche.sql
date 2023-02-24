-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

-- Keiner dieser Vergleiche wird auf 'True' ausgewertet
IF NULL = NULL
	PRINT 'NULL = NULL';

IF NULL = NULL OR NOT NULL = NULL
	PRINT 'NULL = NULL OR NOT NULL = NULL';

IF NULL <> NULL
	PRINT 'NULL <> NULL';

IF NULL != NULL
	PRINT 'NULL != NULL';

-- Es MUSS der IS-Operator verwendet werden
IF NULL IS NULL
	PRINT 'NULL IS NULL';

IF NOT NULL IS NULL
	PRINT 'NOT NULL IS NULL';

IF NULL IS NULL OR NOT NULL IS NULL
	PRINT 'NULL IS NULL OR NOT NULL IS NULL';


