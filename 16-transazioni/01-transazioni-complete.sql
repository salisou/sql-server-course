USE CorsoSqlServer;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    UPDATE Studenti
    SET Attivo = 0
    WHERE StudenteId = -1;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    SELECT ERROR_NUMBER() AS NumeroErrore,
           ERROR_MESSAGE() AS MessaggioErrore,
           ERROR_LINE() AS RigaErrore;
END CATCH;
GO

BEGIN TRANSACTION;
SAVE TRANSACTION PuntoDiControllo;

-- Eseguire qui una modifica di prova.
-- ROLLBACK TRANSACTION PuntoDiControllo;

COMMIT TRANSACTION;
GO

SELECT @@TRANCOUNT AS NumeroTransazioniAperte,
       XACT_STATE() AS StatoTransazione;
GO
