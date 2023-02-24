-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

DECLARE @text1 VARCHAR(100) = 'Wasserbett';
DECLARE @text2 VARCHAR(100) = 'WASSERBETT';

-- Gew�hnlich ist SQL Server nicht case-sensitive. Ist dies erforderlich
-- muss eine entsprechende Collation angegeben werden.

IF @text1 = 'Wasserbett'
	PRINT '@text1: Wasserbett';
IF @text2 = 'Wasserbett'
	PRINT '@text2: Wasserbett (falsch)';

-- Unterst�tze Collations abrufen
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