-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

-- Thorsten Kansy, www.dotnetconsulting.eu

DECLARE @count INT = 0;

WHILE @count < 2000
BEGIN
	-- Print wird nur zeitverzögert im SSMS angezeigt
	PRINT CONCAT('Count: ',@count);

	-- RAISERROR ... WITH NOWAIT hat diese Einschränkung nicht
	-- RAISERROR (N'Count: %d',10, 1, @count) WITH NOWAIT;
	
	SET @count = @count + 1;
	WAITFOR DELAY '0:0:3';
END
