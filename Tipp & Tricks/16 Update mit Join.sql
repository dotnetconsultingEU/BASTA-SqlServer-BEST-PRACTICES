-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschr�nkungen verwendet oder ver�ndert werden.
-- Jedoch wird keine Garantie �bernommen, dass eine Funktionsf�higkeit mit aktuellen und 
-- zuk�nftigen API-Versionen besteht. Der Autor �bernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgef�hrt wird.
-- F�r Anregungen und Fragen stehe ich jedoch gerne zur Verf�gung.

-- Thorsten Kansy, www.dotnetconsulting.eu

USE [Master];
GO

-- Tabellen erzeugen...
DROP TABLE IF EXISTS #status;
GO

CREATE TABLE #status
(
	[Id] INT NOT NULL UNIQUE,
	[Text] VARCHAR(50) NOT NULL
);
GO

DROP TABLE IF EXISTS #data;
GO

CREATE TABLE #data
(
	[Id] INT NOT NULL UNIQUE,
	[StatusId] INT NOT NULL,
	[StatusText] VARCHAR(50) NULL,
	[Data1] VARCHAR(50) NOT NULL
);

-- ... und bef�llen
INSERT #status VALUES (1, 'Status #1'), (2, 'Status #2'), (3, 'Status #3');

INSERT #data ([Id], [StatusId], [Data1]) VALUES
(1, 1, 'Data #1'),
(2, 2, 'Data #2'),
(3, 3, 'Data #3'),
(4, 1, 'Data #4'),
(5, 2, 'Data #5'),
(6, 3, 'Data #6');

-- Testausgabe vorher
SELECT * FROM #data;
SELECT * FROM #status;

UPDATE t
SET t.[StatusText] = s.[Text]
FROM #data t
LEFT JOIN #status s ON t.[StatusId] = s.[Id];

-- Testausgabe nachher
SELECT * FROM #data;