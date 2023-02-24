-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

DECLARE @text1 VARCHAR(100) = 'Nur heute 30% Rabatt';
DECLARE @text2 VARCHAR(100) = 'Nur heute 30� Rabatt';

-- Die Suche nach dem %-Zeichen kann nicht so aussehen
IF @text1 LIKE '%%%'
	PRINT '@text1: %-Zeichen gefunden (falsch)';
IF @text2 LIKE '%%%'
	PRINT '@text2: %-Zeichen gefunden (falsch)';

-- Vielmehr kann ein Escape-Zeichen definiert werden, das vor
-- dem gesuchen %-Zeichen (oder _-Zeichen) steht so das dieses
-- als einfaches Zeichen und nicht als Platzhalter angesehen wird
IF @text1 LIKE '%\%%' ESCAPE '\'
	PRINT '@text1: %-Zeichen gefunden';
IF @text2 LIKE '%\%%' ESCAPE '\'
	PRINT '@text2: %-Zeichen gefunden';