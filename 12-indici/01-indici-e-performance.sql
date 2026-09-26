/*
    INDICI E PERFORMANCE
*/
USE CorsoSqlServer;
GO

-- Indice non clusterizzato.
CREATE INDEX IX_Studenti_Cognome
ON Studenti (Cognome);
GO

-- Indice composto.
CREATE INDEX IX_Studenti_Cognome_Nome
ON Studenti (Cognome, Nome);
GO

-- Verifica degli indici presenti.
SELECT
    i.name AS NomeIndice,
    i.type_desc AS TipoIndice,
    c.name AS Colonna
FROM sys.indexes AS i
INNER JOIN sys.index_columns AS ic
    ON ic.object_id = i.object_id
   AND ic.index_id = i.index_id
INNER JOIN sys.columns AS c
    ON c.object_id = ic.object_id
   AND c.column_id = ic.column_id
WHERE i.object_id = OBJECT_ID(N'dbo.Studenti');
GO

/*
    In SSMS:
    Ctrl+M abilita Include Actual Execution Plan.

    La performance non significa "creare più indici":
    gli indici accelerano alcune letture ma aumentano il costo
    di INSERT, UPDATE e DELETE e occupano spazio.
*/
