-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

DECLARE @count INT = 0;

WHILE @count < 2000
BEGIN
	-- Print wird nur zeitverz�gert im SSMS angezeigt
	PRINT CONCAT('Count: ',@count);

	-- RAISERROR ... WITH NOWAIT hat diese Einschr�nkung nicht
	-- RAISERROR (N'Count: %d',10, 1, @count) WITH NOWAIT;
	
	SET @count = @count + 1;
	WAITFOR DELAY '0:0:3';
END
