USE CorsoSqlServer;
GO

-- UNION elimina i duplicati tra i due risultati.
SELECT Nome
FROM Studenti
UNION
SELECT Cognome
FROM Studenti;
GO

-- UNION ALL conserva i duplicati.
SELECT Nome
FROM Studenti
UNION ALL
SELECT Cognome
FROM Studenti;
GO

-- INTERSECT restituisce i valori presenti in entrambi i risultati.
SELECT Nome
FROM Studenti
INTERSECT
SELECT Cognome
FROM Studenti;
GO

-- EXCEPT restituisce i valori del primo risultato che
-- non compaiono nel secondo.
SELECT Nome
FROM Studenti
EXCEPT
SELECT Cognome
FROM Studenti;
GO
