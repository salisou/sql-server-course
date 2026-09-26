/*
    SQL SERVER - SOTTOQUERY
*/

USE CorsoSqlServer;
GO

-- Sottoquery scalare: restituisce un singolo valore.
SELECT
    NomeCorso,
    Costo,
    (SELECT AVG(Costo) FROM Corsi) AS CostoMedio
FROM Corsi;
GO

-- Confronto con una sottoquery.
SELECT *
FROM Corsi
WHERE Costo > (SELECT AVG(Costo) FROM Corsi);
GO

-- IN con sottoquery.
SELECT *
FROM Studenti
WHERE StudenteId IN
(
    SELECT StudenteId
    FROM Iscrizioni
);
GO

-- EXISTS verifica l'esistenza di almeno una riga.
SELECT
    s.StudenteId,
    s.Nome,
    s.Cognome
FROM Studenti AS s
WHERE EXISTS
(
    SELECT 1
    FROM Iscrizioni AS i
    WHERE i.StudenteId = s.StudenteId
);
GO

-- NOT EXISTS: individua gli studenti senza iscrizioni.
SELECT
    s.StudenteId,
    s.Nome,
    s.Cognome
FROM Studenti AS s
WHERE NOT EXISTS
(
    SELECT 1
    FROM Iscrizioni AS i
    WHERE i.StudenteId = s.StudenteId
);
GO

-- ANY: il confronto è vero se soddisfatto da almeno un valore.
SELECT *
FROM Corsi
WHERE Costo > ANY
(
    SELECT Costo
    FROM Corsi
    WHERE Costo > 0
);
GO

-- ALL: il confronto deve essere vero rispetto a tutti i valori.
SELECT *
FROM Corsi
WHERE Costo >= ALL
(
    SELECT Costo
    FROM Corsi
    WHERE Costo > 0
);
GO
