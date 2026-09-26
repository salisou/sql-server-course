/*
    AGGREGAZIONI
*/
USE CorsoSqlServer;
GO

SELECT COUNT(*) AS NumeroStudenti
FROM Studenti;
GO

SELECT
    MIN(Costo) AS CostoMinimo,
    MAX(Costo) AS CostoMassimo,
    AVG(Costo) AS CostoMedio,
    SUM(Costo) AS SommaCosti
FROM Corsi;
GO

-- GROUP BY crea un risultato per ogni gruppo.
SELECT
    CorsoId,
    COUNT(*) AS NumeroIscrizioni
FROM Iscrizioni
GROUP BY CorsoId;
GO

-- HAVING filtra i gruppi dopo GROUP BY.
SELECT
    CorsoId,
    COUNT(*) AS NumeroIscrizioni
FROM Iscrizioni
GROUP BY CorsoId
HAVING COUNT(*) >= 2;
GO
