-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.
-- Thorsten Kansy, www.dotnetconsulting.eu

USE [AdventureWorks];
GO

SELECT
	-- Durchschnitt über aktuelle Zeile plus 3 davor und 3 danach
	AVG([LineTotal]) OVER (PARTITION BY SalesOrderId ORDER BY [SalesOrderDetailID] ROWS BETWEEN 3 PRECEDING AND 3 FOLLOWING) AS [AVG],
	-- Summiere die Werte der aktuellen Zeile und alle vorherigen
	SUM([LineTotal]) OVER (PARTITION BY SalesOrderId ORDER BY [SalesOrderDetailID] ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS [SUM],
	[LineTotal],
	'|' [|], *
FROM [Sales].[SalesOrderDetail]
WHERE  [SalesOrderID] = 43661
ORDER BY [SalesOrderDetailID];
