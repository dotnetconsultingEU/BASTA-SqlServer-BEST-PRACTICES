-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

DECLARE @text1 VARCHAR(100) = 'Nur heute 30% Rabatt';
DECLARE @text2 VARCHAR(100) = 'Nur heute 30€ Rabatt';

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