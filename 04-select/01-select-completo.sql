/*
    SQL SERVER - SELECT COMPLETO
    Sintassi fondamentale e filtri più utilizzati.
*/

USE CorsoSqlServer;
GO

-- SELECT base
SELECT Nome, Cognome
FROM Studenti;
GO

-- DISTINCT: elimina i duplicati nel risultato.
SELECT DISTINCT Attivo
FROM Studenti;
GO

-- Alias: assegna un nome leggibile a una colonna.
SELECT
    Nome + N' ' + Cognome AS NomeCompleto
FROM Studenti;
GO

-- WHERE: filtra le righe.
SELECT *
FROM Studenti
WHERE Attivo = 1;
GO

-- AND / OR / NOT
SELECT *
FROM Studenti
WHERE Attivo = 1
  AND (Cognome = N'Rossi' OR Cognome = N'Bianchi');
GO

-- IS NULL / IS NOT NULL
SELECT *
FROM Studenti
WHERE Email IS NOT NULL;
GO

-- IN
SELECT *
FROM Studenti
WHERE Cognome IN (N'Rossi', N'Bianchi');
GO

-- BETWEEN: intervallo inclusivo.
SELECT *
FROM Studenti
WHERE DataNascita BETWEEN '2000-01-01' AND '2005-12-31';
GO

-- LIKE e caratteri jolly:
-- % = zero o più caratteri
-- _ = un carattere
SELECT *
FROM Studenti
WHERE Cognome LIKE N'R%';
GO

-- ORDER BY
SELECT *
FROM Studenti
ORDER BY Cognome ASC, Nome ASC;
GO

-- TOP è la forma tipica di SQL Server per limitare il risultato.
SELECT TOP (5)
    StudenteId, Nome, Cognome
FROM Studenti
ORDER BY StudenteId DESC;
GO

-- CASE: crea un valore calcolato.
SELECT
    Nome,
    Cognome,
    CASE
        WHEN Attivo = 1 THEN N'Attivo'
        ELSE N'Non attivo'
    END AS Stato
FROM Studenti;
GO

-- COALESCE: restituisce il primo valore non NULL.
SELECT
    Nome,
    COALESCE(Email, N'Email non disponibile') AS Email
FROM Studenti;
GO

-- Ordine logico semplificato di elaborazione di SELECT:
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> TOP
