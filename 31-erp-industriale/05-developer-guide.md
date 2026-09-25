# Sviluppatori: ERP + .NET

Il database è pensato per essere usato con ASP.NET Core Web API, Dapper ed EF Core.

Percorso consigliato:
1. connection string in configurazione, mai nel codice;
2. DTO per API;
3. repository/service;
4. query parametrizzate;
5. stored procedure per processi transazionali complessi;
6. logging e gestione errori;
7. test di integrazione;
8. paginazione, filtri e ordinamento;
9. indici sulle colonne realmente usate nei filtri/JOIN;
10. API read-only per dashboard e viste analitiche.

Esempi di API: clienti, articoli, ordini, fatture, giacenze, produzione, CRM e KPI.