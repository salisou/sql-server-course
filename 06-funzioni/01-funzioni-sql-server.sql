/*
    FUNZIONI SQL SERVER
*/
USE CorsoSqlServer;
GO

-- Funzioni stringa
SELECT
    UPPER(Nome) AS NomeMaiuscolo,
    LOWER(Cognome) AS CognomeMinuscolo,
    LEN(Cognome) AS LunghezzaCognome,
    CONCAT(Nome, N' ', Cognome) AS NomeCompleto
FROM Studenti;
GO

-- Funzioni numeriche
SELECT
    Costo,
    ROUND(Costo, 0) AS CostoArrotondato,
    CEILING(Costo) AS ArrotondatoPerEccesso,
    FLOOR(Costo) AS ArrotondatoPerDifetto
FROM Corsi;
GO

-- Funzioni data/ora
SELECT
    GETDATE() AS DataOraCorrente,
    CAST(GETDATE() AS DATE) AS DataCorrente,
    YEAR(DataNascita) AS AnnoNascita,
    DATEDIFF(YEAR, DataNascita, GETDATE()) AS DifferenzaAnni
FROM Studenti
WHERE DataNascita IS NOT NULL;
GO

-- Conversioni
SELECT
    CONVERT(VARCHAR(10), DataNascita, 103) AS DataFormattata
FROM Studenti
WHERE DataNascita IS NOT NULL;
GO

-- NULL
SELECT
    Nome,
    ISNULL(Email, N'Email non disponibile') AS EmailConDefault,
    COALESCE(Email, N'Email non disponibile') AS EmailConCoalesce
FROM Studenti;
GO
