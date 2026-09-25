# Database

## Obiettivo
CREATE/ALTER/DROP DATABASE, file, filegroup, recovery model.

## Metodo
Eseguire gli esempi su ScuolaDb: capire il risultato, eseguire, verificare e solo dopo modificare l'esempio.

```sql
USE ScuolaDb;
GO
SELECT TOP (10) StudenteId, Nome, Cognome FROM dbo.Studenti ORDER BY Cognome, Nome;
```

## Best practice
Usare colonne esplicite; verificare UPDATE/DELETE con SELECT; gestire NULL con IS NULL/IS NOT NULL; usare parametri; controllare cardinalità nei JOIN; misurare le performance.

## Esercizio
Applicare Database a Studenti, Corsi o Iscrizioni e documentare query, risultato atteso e verifica.
