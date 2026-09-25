IF DB_ID(N'ScuolaDb') IS NULL CREATE DATABASE ScuolaDb;
GO
USE ScuolaDb;
GO
DROP TABLE IF EXISTS dbo.Voti;
DROP TABLE IF EXISTS dbo.Lezioni;
DROP TABLE IF EXISTS dbo.DocentiCorso;
DROP TABLE IF EXISTS dbo.Iscrizioni;
DROP TABLE IF EXISTS dbo.Aule;
DROP TABLE IF EXISTS dbo.Docenti;
DROP TABLE IF EXISTS dbo.Corsi;
DROP TABLE IF EXISTS dbo.Studenti;
GO
CREATE TABLE dbo.Studenti(
 StudenteId INT IDENTITY PRIMARY KEY, Nome NVARCHAR(50) NOT NULL,
 Cognome NVARCHAR(50) NOT NULL, CodiceFiscale CHAR(16), DataNascita DATE,
 Email NVARCHAR(150) UNIQUE, Telefono VARCHAR(20)
);
CREATE TABLE dbo.Corsi(
 CorsoId INT IDENTITY PRIMARY KEY, NomeCorso NVARCHAR(100) NOT NULL,
 Descrizione NVARCHAR(500), DataInizio DATE, DataFine DATE,
 DurataOre INT CHECK(DurataOre IS NULL OR DurataOre>0)
);
CREATE TABLE dbo.Docenti(
 DocenteId INT IDENTITY PRIMARY KEY, Nome NVARCHAR(50) NOT NULL,
 Cognome NVARCHAR(50) NOT NULL, Email NVARCHAR(150), Specializzazione NVARCHAR(150)
);
CREATE TABLE dbo.Aule(
 AulaId INT IDENTITY PRIMARY KEY, NomeAula NVARCHAR(50) NOT NULL,
 Capienza INT CHECK(Capienza IS NULL OR Capienza>0)
);
CREATE TABLE dbo.Iscrizioni(
 IscrizioneId INT IDENTITY PRIMARY KEY, StudenteId INT NOT NULL, CorsoId INT NOT NULL,
 DataIscrizione DATE NOT NULL DEFAULT CAST(GETDATE() AS DATE),
 FOREIGN KEY(StudenteId) REFERENCES dbo.Studenti(StudenteId),
 FOREIGN KEY(CorsoId) REFERENCES dbo.Corsi(CorsoId),
 CONSTRAINT UQ_Iscrizioni UNIQUE(StudenteId,CorsoId)
);
CREATE TABLE dbo.DocentiCorso(
 DocenteCorsoId INT IDENTITY PRIMARY KEY, DocenteId INT NOT NULL, CorsoId INT NOT NULL,
 FOREIGN KEY(DocenteId) REFERENCES dbo.Docenti(DocenteId),
 FOREIGN KEY(CorsoId) REFERENCES dbo.Corsi(CorsoId),
 CONSTRAINT UQ_DocentiCorso UNIQUE(DocenteId,CorsoId)
);
CREATE TABLE dbo.Lezioni(
 LezioneId INT IDENTITY PRIMARY KEY, CorsoId INT NOT NULL, AulaId INT NULL,
 DataLezione DATE NULL, OraInizio TIME NULL,
 DurataMinuti INT CHECK(DurataMinuti IS NULL OR DurataMinuti>0),
 FOREIGN KEY(CorsoId) REFERENCES dbo.Corsi(CorsoId),
 FOREIGN KEY(AulaId) REFERENCES dbo.Aule(AulaId)
);
CREATE TABLE dbo.Voti(
 VotoId INT IDENTITY PRIMARY KEY, StudenteId INT NOT NULL, CorsoId INT NOT NULL,
 Voto DECIMAL(4,2) NOT NULL CHECK(Voto BETWEEN 0 AND 10),
 DataVoto DATE DEFAULT CAST(GETDATE() AS DATE),
 FOREIGN KEY(StudenteId) REFERENCES dbo.Studenti(StudenteId),
 FOREIGN KEY(CorsoId) REFERENCES dbo.Corsi(CorsoId)
);
GO
INSERT dbo.Studenti(Nome,Cognome,Email) VALUES
(N'Mario',N'Rossi',N'mario@example.com'),(N'Anna',N'Bianchi',N'anna@example.com'),
(N'Luigi',N'Verdi',N'luigi@example.com'),(N'Sara',N'Neri',N'sara@example.com'),
(N'Paolo',N'Ferrari',N'paolo@example.com');
INSERT dbo.Corsi(NomeCorso,Descrizione,DurataOre) VALUES
(N'C# e .NET',N'Programmazione C# e .NET',80),
(N'SQL Server',N'Database e T-SQL',60),
(N'Python Data Analysis',N'Analisi dati',80);
INSERT dbo.Docenti(Nome,Cognome,Email,Specializzazione) VALUES
(N'Moussa',N'Salisou',N'moussa@example.com',N'C# .NET SQL Python'),
(N'Laura',N'Rossi',N'laura@example.com',N'Data Analysis');
INSERT dbo.Aule(NomeAula,Capienza) VALUES(N'Aula A',20),(N'Aula B',15),(N'Laboratorio 1',24);
INSERT dbo.Iscrizioni(StudenteId,CorsoId) VALUES(1,1),(1,2),(2,2),(2,3),(3,1),(3,2),(4,2),(5,3);
INSERT dbo.DocentiCorso(DocenteId,CorsoId) VALUES(1,1),(1,2),(2,3);
INSERT dbo.Lezioni(CorsoId,AulaId,DataLezione,OraInizio,DurataMinuti) VALUES
(1,1,'2026-09-02','09:00',120),(2,2,'2026-09-06','14:00',120),(3,3,'2026-10-02','09:00',180);
INSERT dbo.Voti(StudenteId,CorsoId,Voto) VALUES(1,2,8.5),(2,2,9),(3,2,7.5),(4,2,6.5),(1,1,8);
GO
SELECT TABLE_SCHEMA,TABLE_NAME FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE='BASE TABLE' ORDER BY TABLE_NAME;
