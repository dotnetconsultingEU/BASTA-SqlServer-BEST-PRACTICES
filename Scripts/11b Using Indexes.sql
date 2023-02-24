-- Disclaimer
-- Dieser Quellcode ist als Vorlage oder als Ideengeber gedacht. Er kann frei und ohne 
-- Auflagen oder Einschränkungen verwendet oder verändert werden.
-- Jedoch wird keine Garantie  übernommen, dass eine Funktionsfähigkeit mit aktuellen und 
-- zukünftigen API-Versionen besteht. Der Autor übernimmt daher keine direkte oder indirekte 
-- Verantwortung, wenn dieser Code gar nicht oder nur fehlerhaft ausgeführt wird.
-- Für Anregungen und Fragen stehe ich jedoch gerne zur Verfügung.
-- Thorsten Kansy, www.dotnetconsulting.eu

--USE <Datenbank>;
GO

SELECT  OBJECT_NAME(A.[object_id]) AS [OBJECT NAME] ,
        I.[name] AS [INDEX NAME] ,
        A.leaf_insert_count ,
        A.leaf_update_count ,
        A.leaf_delete_count,
		'|' '|'
FROM    sys.dm_db_index_operational_stats(NULL, NULL, NULL, NULL) A
        INNER JOIN sys.indexes AS I ON I.[object_id] = A.[object_id]
                                       AND I.index_id = A.index_id
WHERE   OBJECTPROPERTY(A.[object_id], 'IsUserTable') = 1;

SELECT OBJECT_NAME(S.[OBJECT_ID]) AS [OBJECT NAME],
       I.[NAME] AS [INDEX NAME],
       USER_SEEKS,
	   LAST_USER_SEEK,
       USER_SCANS,
       LAST_USER_SCAN,
       USER_LOOKUPS,
	   LAST_USER_LOOKUP,
       USER_UPDATES
	   LAST_USER_UPDATE
FROM SYS.DM_DB_INDEX_USAGE_STATS AS S
    INNER JOIN SYS.INDEXES AS I
        ON I.[OBJECT_ID] = S.[OBJECT_ID]
           AND I.INDEX_ID = S.INDEX_ID
WHERE OBJECTPROPERTY(S.[OBJECT_ID], 'IsUserTable') = 1;