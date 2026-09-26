/*
    STORED PROCEDURE
*/
USE CorsoSqlServer;
GO

CREATE OR ALTER PROCEDURE dbo.usp_StudentiAttivi
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        StudenteId,
        Nome,
        Cognome,
        Email
    FROM dbo.Studenti
    WHERE Attivo = 1
    ORDER BY Cognome, Nome;
END;
GO

EXEC dbo.usp_StudentiAttivi;
GO

CREATE OR ALTER PROCEDURE dbo.usp_CercaStudente
    @Cognome NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        StudenteId,
        Nome,
        Cognome,
        Email
    FROM dbo.Studenti
    WHERE Cognome = @Cognome;
END;
GO

EXEC dbo.usp_CercaStudente @Cognome = N'Rossi';
GO
