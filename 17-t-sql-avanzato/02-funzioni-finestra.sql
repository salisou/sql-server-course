USE CorsoSqlServer;
GO

-- ROW_NUMBER assegna un numero progressivo alle righe.
SELECT
    ROW_NUMBER() OVER (ORDER BY Cognome, Nome) AS NumeroRiga,
    StudenteId,
    Nome,
    Cognome
FROM Studenti;
GO

-- RANK assegna la stessa posizione in caso di parità.
SELECT
    RANK() OVER (ORDER BY Costo DESC) AS Posizione,
    NomeCorso,
    Costo
FROM Corsi;
GO

-- PARTITION BY crea una numerazione separata per ogni gruppo.
SELECT
    CorsoId,
    StudenteId,
    ROW_NUMBER() OVER
    (
        PARTITION BY CorsoId
        ORDER BY DataIscrizione
    ) AS NumeroNelCorso
FROM Iscrizioni;
GO

-- LAG permette di confrontare la riga corrente con la precedente.
SELECT
    CorsoId,
    DataIscrizione,
    LAG(DataIscrizione) OVER
    (
        PARTITION BY CorsoId
        ORDER BY DataIscrizione
    ) AS DataPrecedente
FROM Iscrizioni;
GO
