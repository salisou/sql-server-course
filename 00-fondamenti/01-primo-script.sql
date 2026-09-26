/*
    SQL SERVER - LEZIONE 01
    Fondamenti e primo script T-SQL
    Docente Moussa Salisou
*/

-- USE seleziona il database sul quale lavorare.
-- Esempio:
USE master;
GO

-- Creazione del database didattico.
-- IF NOT EXISTS evita l'errore se il database esiste già.
IF DB_ID('CorsoSqlServer') IS NULL
BEGIN
    CREATE DATABASE CorsoSqlServer;
END;
GO

USE CorsoSqlServer;
GO

-- Una tabella rappresenta un insieme strutturato di dati.
CREATE TABLE Studenti
(
    StudenteId INT IDENTITY(1,1) CONSTRAINT PK_Studenti PRIMARY KEY,
    Nome NVARCHAR(50) NOT NULL,
    Cognome NVARCHAR(50) NOT NULL,
    Email NVARCHAR(150) NULL,
    DataNascita DATE NULL,
    Attivo BIT NOT NULL CONSTRAINT DF_Studenti_Attivo DEFAULT 1
);
GO

-- Inserimento di dati.
INSERT INTO Studenti (Nome, Cognome, Email, DataNascita)
VALUES
(N'Mario', N'Rossi', N'mario.rossi@email.it', '2000-05-12'),
(N'Anna', N'Bianchi', N'anna.bianchi@email.it', '2001-09-20');
GO

-- Lettura dei dati.
SELECT
    StudenteId,
    Nome,
    Cognome,
    Email,
    DataNascita,
    Attivo
FROM Studenti;
GO

-- Best practice: evitare SELECT * nelle query applicative quando
-- conosciamo già le colonne che vogliamo restituire.
