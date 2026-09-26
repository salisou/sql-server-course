/*
    SQL SERVER - T-SQL AVANZATO
    Controllo di flusso, variabili, temporanee, CTE e gestione errori.
*/

USE CorsoSqlServer;
GO

-- Variabile
DECLARE @CostoMinimo DECIMAL(10,2) = 100.00;

SELECT *
FROM Corsi
WHERE Costo >= @CostoMinimo;
GO

-- IF / ELSE
DECLARE @TotaleStudenti INT;

SELECT @TotaleStudenti = COUNT(*)
FROM Studenti;

IF @TotaleStudenti > 0
BEGIN
    PRINT N'Sono presenti studenti nel database.';
END
ELSE
BEGIN
    PRINT N'Non sono presenti studenti.';
END;
GO

-- WHILE: usare con criterio; spesso una query set-based è preferibile.
DECLARE @Contatore INT = 1;

WHILE @Contatore <= 3
BEGIN
    PRINT CONCAT(N'Iterazione: ', @Contatore);
    SET @Contatore += 1;
END;
GO

-- Tabella temporanea.
DROP TABLE IF EXISTS #StudentiAttivi;

SELECT StudenteId, Nome, Cognome
INTO #StudentiAttivi
FROM Studenti
WHERE Attivo = 1;

SELECT *
FROM #StudentiAttivi;
GO

-- CTE: migliora la leggibilità delle query complesse.
WITH IscrizioniPerStudente AS
(
    SELECT
        StudenteId,
        COUNT(*) AS NumeroIscrizioni
    FROM Iscrizioni
    GROUP BY StudenteId
)
SELECT
    s.Nome,
    s.Cognome,
    COALESCE(i.NumeroIscrizioni, 0) AS NumeroIscrizioni
FROM Studenti AS s
LEFT JOIN IscrizioniPerStudente AS i
    ON i.StudenteId = s.StudenteId;
GO

-- TRY/CATCH: gestione degli errori T-SQL.
BEGIN TRY
    BEGIN TRANSACTION;

    -- Operazioni che devono essere atomiche.

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    SELECT
        ERROR_NUMBER() AS NumeroErrore,
        ERROR_MESSAGE() AS MessaggioErrore,
        ERROR_LINE() AS RigaErrore;
END CATCH;
GO
