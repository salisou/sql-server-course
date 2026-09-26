/*
    FUNZIONI DEFINITE DALL'UTENTE
*/
USE CorsoSqlServer;
GO

CREATE OR ALTER FUNCTION dbo.fn_NomeCompleto
(
    @Nome NVARCHAR(50),
    @Cognome NVARCHAR(50)
)
RETURNS NVARCHAR(101)
AS
BEGIN
    RETURN CONCAT(@Nome, N' ', @Cognome);
END;
GO

SELECT
    StudenteId,
    dbo.fn_NomeCompleto(Nome, Cognome) AS NomeCompleto
FROM Studenti;
GO

CREATE OR ALTER FUNCTION dbo.fn_StudentiAttivi()
RETURNS TABLE
AS
RETURN
(
    SELECT
        StudenteId,
        Nome,
        Cognome,
        Email
    FROM Studenti
    WHERE Attivo = 1
);
GO

SELECT *
FROM dbo.fn_StudentiAttivi();
GO
