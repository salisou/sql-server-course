# SQL Server e T-SQL — percorso completo

Questo repository è progettato come corso professionale in italiano, da zero ad avanzato.

## Riferimenti didattici utilizzati

La struttura degli argomenti è stata confrontata con i percorsi introduttivi di W3Schools e con la documentazione ufficiale Microsoft SQL Server. Non vengono copiati testi o esercizi proprietari: gli esempi del repository sono originali e adattati a SQL Server/T-SQL.

W3Schools copre, tra gli altri: SELECT, DISTINCT, WHERE, ORDER BY, operatori logici, INSERT, NULL, UPDATE, DELETE, TOP, funzioni aggregate, LIKE e wildcard, IN, BETWEEN, alias, JOIN, UNION, GROUP BY, HAVING, EXISTS, ANY/ALL, SELECT INTO, INSERT INTO SELECT, CASE, funzioni NULL, stored procedure, commenti, database, tabelle, ALTER TABLE, vincoli, indici, date e viste.

Microsoft Learn amplia il percorso con la sintassi e il comportamento specifici di Transact-SQL, CTE, JOIN/APPLY/PIVOT, GROUP BY, HAVING, UNION/EXCEPT/INTERSECT, sicurezza, DDL, DML, transazioni e strumenti SQL Server.

## Percorso didattico

| Modulo | Argomenti |
|---|---|
| 00 | Fondamenti, SSMS, database, schema, batch e GO |
| 01 | CREATE/DROP/ALTER DATABASE, file e configurazione di base |
| 02 | CREATE/ALTER/DROP TABLE, colonne e relazioni |
| 03 | INT, DECIMAL, VARCHAR, NVARCHAR, DATE, DATETIME2, BIT, UNIQUEIDENTIFIER e altri tipi |
| 04 | SELECT, DISTINCT, alias, WHERE, AND/OR/NOT, NULL, IN, BETWEEN, LIKE, ORDER BY, TOP, CASE |
| 05 | INSERT, UPDATE, DELETE, TRUNCATE e controllo delle modifiche |
| 06 | Funzioni stringa, numeriche, data/ora, conversioni e NULL |
| 07 | COUNT, SUM, AVG, MIN, MAX, GROUP BY e HAVING |
| 08 | INNER, LEFT, RIGHT, FULL, CROSS e SELF JOIN |
| 09 | Sottoquery scalari, correlate, IN, EXISTS, NOT EXISTS, ANY e ALL |
| 10 | CTE non ricorsive e ricorsive |
| 11 | CREATE/ALTER/DROP VIEW e viste per reporting |
| 12 | Indici, indici composti, copertura, statistiche e piano di esecuzione |
| 13 | Stored procedure, parametri, OUTPUT, gestione errori |
| 14 | Funzioni scalari e table-valued functions |
| 15 | Trigger DML e casi d'uso |
| 16 | TRANSACTION, COMMIT, ROLLBACK, SAVEPOINT, TRY/CATCH |
| 17 | Variabili, IF, WHILE, CTE, temp table, table variable, window functions, UNION/INTERSECT/EXCEPT |
| 18 | Login, user, ruoli, GRANT, DENY, REVOKE e principio del privilegio minimo |
| 19 | Performance, execution plan, SARGability, statistiche e strategie di indicizzazione |
| 20 | Backup completo/differenziale/log, restore e verifica del piano di recupero |
| 21 | SSMS, sqlcmd, LocalDB, import/export e strumenti |
| 22 | SQL Server con applicazioni .NET, ADO.NET, API e repository |
| 23 | Progetto completo ScuolaDb |
| 24 | Esercizi graduati con soluzioni |
| 25 | Laboratori guidati |
| 26 | Progetto finale |
| 27 | Cheatsheet |
| 28 | Glossario |
| 29 | Quiz |
| 30 | Guida docente |
| 31 | ERP industriale: database reale di esempio |

## Argomenti SQL Server da padroneggiare

### DDL
CREATE, ALTER, DROP, TRUNCATE, schema, tabelle, viste, procedure, funzioni, trigger, indici.

### DML
SELECT, INSERT, UPDATE, DELETE, MERGE e operazioni set-based.

### Query
Filtri, aggregazioni, JOIN, sottoquery, CTE, funzioni finestra, operatori insiemistici.

### Integrità
PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK, DEFAULT, IDENTITY.

### T-SQL
Variabili, batch, GO, IF/ELSE, WHILE, TRY/CATCH, transazioni, parametri e gestione degli errori.

### SQL Server professionale
Execution plan, statistiche, indici, locking, isolamento delle transazioni, deadlock, backup/restore, sicurezza e permessi.

### Applicazioni
Accesso da .NET/ADO.NET, API, parametri, gestione delle connessioni, transazioni applicative e repository pattern.

## Metodo di ogni lezione

Ogni argomento deve seguire lo stesso modello:

1. Obiettivo della lezione
2. Spiegazione teorica in italiano
3. Perché esiste il comando
4. Quando utilizzarlo
5. Sintassi SQL Server
6. Esempio semplice
7. Esempio realistico con ScuolaDb
8. Spiegazione riga per riga
9. Errori comuni
10. Esercizio guidato
11. Soluzione commentata
12. Esercizio autonomo
13. Best practice professionali
14. Riepilogo

## Regola importante

Il corso non deve insegnare semplicemente la sintassi. Deve insegnare a progettare, interrogare, modificare, proteggere, ottimizzare e amministrare un database SQL Server.

© 2025 – Tutti i diritti riservati – Docente Moussa Salisou
