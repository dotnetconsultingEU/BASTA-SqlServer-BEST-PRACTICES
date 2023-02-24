-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

DECLARE @text1 VARCHAR(100) = 'Wasserbett';
DECLARE @text2 VARCHAR(100) = 'WASSERBETT';

-- Gewöhnlich ist SQL Server nicht case-sensitive. Ist dies erforderlich
-- muss eine entsprechende Collation angegeben werden.

IF @text1 = 'Wasserbett'
	PRINT '@text1: Wasserbett';
IF @text2 = 'Wasserbett'
	PRINT '@text2: Wasserbett (falsch)';

-- Unterstütze Collations abrufen
SELECT * FROM sys.fn_helpcollations()
WHERE [name] LIKE 'SQL_Latin1_General_CP1_C[I;S]_AS';

-- Wichtig ist 'CS' oder 'CI' in dem Namen der Collation
-- CS: Case sensitive
-- CI: Case insensitive
-- Funktioniert mit allen Vergleichen (z.B. auch mit LIKE)
IF @text1 = 'Wasserbett' COLLATE SQL_Latin1_General_CP1_CS_AS
	PRINT '@text1: Wasserbett';
IF @text2 = 'Wasserbett' COLLATE SQL_Latin1_General_CP1_CI_AS
	PRINT '@text2: Wasserbett';