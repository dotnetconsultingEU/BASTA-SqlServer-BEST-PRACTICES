-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

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


