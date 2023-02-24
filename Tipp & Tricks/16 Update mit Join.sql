-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.

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

-- ... und befüllen
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