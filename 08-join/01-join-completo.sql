/*
    SQL SERVER - JOIN
    Esempi con un piccolo modello relazionale.
*/

USE CorsoSqlServer;
GO

IF OBJECT_ID('Corsi', 'U') IS NULL
BEGIN
    CREATE TABLE Corsi
    (
        CorsoId INT IDENTITY(1,1) CONSTRAINT PK_Corsi PRIMARY KEY,
        NomeCorso NVARCHAR(100) NOT NULL,
        Costo DECIMAL(10,2) NOT NULL
    );
END;
GO

IF OBJECT_ID('Iscrizioni', 'U') IS NULL
BEGIN
    CREATE TABLE Iscrizioni
    (
        IscrizioneId INT IDENTITY(1,1) CONSTRAINT PK_Iscrizioni PRIMARY KEY,
        StudenteId INT NOT NULL,
        CorsoId INT NOT NULL,
        DataIscrizione DATE NOT NULL,
        CONSTRAINT FK_Iscrizioni_Studenti
            FOREIGN KEY (StudenteId) REFERENCES Studenti(StudenteId),
        CONSTRAINT FK_Iscrizioni_Corsi
            FOREIGN KEY (CorsoId) REFERENCES Corsi(CorsoId)
    );
END;
GO

-- INNER JOIN: restituisce solo le righe con corrispondenza.
SELECT
    s.Nome,
    s.Cognome,
    c.NomeCorso,
    i.DataIscrizione
FROM Studenti AS s
INNER JOIN Iscrizioni AS i
    ON i.StudenteId = s.StudenteId
INNER JOIN Corsi AS c
    ON c.CorsoId = i.CorsoId;
GO

-- LEFT JOIN: mantiene tutte le righe della tabella a sinistra.
SELECT
    s.Nome,
    s.Cognome,
    c.NomeCorso
FROM Studenti AS s
LEFT JOIN Iscrizioni AS i
    ON i.StudenteId = s.StudenteId
LEFT JOIN Corsi AS c
    ON c.CorsoId = i.CorsoId;
GO

-- RIGHT JOIN: mantiene tutte le righe della tabella a destra.
SELECT
    s.Nome,
    s.Cognome,
    c.NomeCorso
FROM Studenti AS s
RIGHT JOIN Iscrizioni AS i
    ON i.StudenteId = s.StudenteId
RIGHT JOIN Corsi AS c
    ON c.CorsoId = i.CorsoId;
GO

-- FULL OUTER JOIN: conserva le righe presenti in almeno una delle due tabelle.
SELECT
    s.Nome,
    s.Cognome,
    c.NomeCorso
FROM Studenti AS s
FULL OUTER JOIN Iscrizioni AS i
    ON i.StudenteId = s.StudenteId
FULL OUTER JOIN Corsi AS c
    ON c.CorsoId = i.CorsoId;
GO

-- CROSS JOIN: prodotto cartesiano.
SELECT
    s.Nome,
    c.NomeCorso
FROM Studenti AS s
CROSS JOIN Corsi AS c;
GO

-- SELF JOIN: una tabella viene collegata a se stessa.
-- Esempio didattico: relazione tra dipendenti e responsabili.
IF OBJECT_ID('Dipendenti', 'U') IS NULL
BEGIN
    CREATE TABLE Dipendenti
    (
        DipendenteId INT IDENTITY(1,1) PRIMARY KEY,
        Nome NVARCHAR(100) NOT NULL,
        ResponsabileId INT NULL
    );
END;
GO

SELECT
    d.Nome AS Dipendente,
    r.Nome AS Responsabile
FROM Dipendenti AS d
LEFT JOIN Dipendenti AS r
    ON r.DipendenteId = d.ResponsabileId;
GO
