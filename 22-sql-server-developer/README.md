# SQL Server e .NET

## Obiettivo
ADO.NET, SqlCommand, parametri, Dapper, EF Core e API.

## Metodo
Eseguire su ScuolaDb, verificare il risultato e documentare le decisioni.

```sql
USE ScuolaDb;
GO
SELECT COUNT(*) AS TotaleStudenti FROM dbo.Studenti;
```

## Best practice
Principio del minimo privilegio, parametri, transazioni quando necessarie, gestione degli errori e misurazione delle performance.

## Esercizio
Applicare l'argomento al progetto ScuolaDb e produrre una soluzione riproducibile.
