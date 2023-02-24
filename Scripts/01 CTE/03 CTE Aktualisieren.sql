-- Disclaimer:
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Es wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen steht der Autor gerne zur Verfügung.
-- Thorsten Kansy, www.dotnetconsulting.eu

-- Eine CTE kann (Rechte und Abfrage entsprechend) aktualisert werden
-- Dafür darf keine der Spalten konstant oder berechnet sein

-- In Datenbank wechseln
USE dotnetconsulting_TSQL2;
GO

-- Kommentar-Spalte zurücksetzen und temporäre Tabelle löschen
UPDATE [dbo].[Personenverzeichnis] SET [Kommentar] = NULL;
DROP TABLE IF EXISTS #temp;

-- Eine Spalte ist konstant oder berechnet
-- Daher funktioniert diese Abfrage nicht ;-(
WITH [cte]
AS
(
	-- Anker der Rekursion
	SELECT *, 0 AS [Level] FROM [dbo].[Personenverzeichnis] WHERE [VorgesetzerID] IS NULL

	UNION ALL

	-- Rekursion
	SELECT [pv].*, [cte].[Level] + 1 FROM [dbo].[Personenverzeichnis] [pv] INNER JOIN [cte]
	ON [cte].[ID] = [pv].[VorgesetzerID]
)
UPDATE [cte] SET [Kommentar] = CONCAT('Hierarchiestufe: ', [Level]);

-- Mit Hilfe einer temporären Tabelle geht's jedoch
WITH [cte]
AS
(
	-- Anker der Rekursion
	SELECT *, 0 AS [Level] FROM [dbo].[Personenverzeichnis] WHERE [VorgesetzerID] IS NULL

	UNION ALL

	-- Rekursion
	SELECT [pv].*, [cte].[Level] + 1 FROM [dbo].[Personenverzeichnis] [pv] INNER JOIN [cte]
	ON [cte].[ID] = [pv].[VorgesetzerID]
) 
SELECT [ID], [Level] INTO [#temp] FROM [cte]
OPTION (MAXRECURSION 50); -- 100 ist der Standard


-- Jetzt kann die CTE aktualisiert werden!
WITH [cte]
AS
(
	SELECT pv.Kommentar, t.[Level] FROM [dbo].[Personenverzeichnis] [pv]
	INNER JOIN [#temp] [t] ON [t].[ID] = [pv].[ID]
)
UPDATE [cte] SET Kommentar = CONCAT('Hierarchiestufe: ', [Level]);

-- Test 
SELECT * FROM [dbo].[Personenverzeichnis];