/*
    PERCORSO ESERCIZI SQL SERVER
    Gli esercizi seguono una progressione dal livello base al professionale.
*/

USE CorsoSqlServer;
GO

/*
 LIVELLO 1 - SELECT
 1. Visualizzare Nome e Cognome di tutti gli studenti.
 2. Visualizzare solo i cognomi distinti.
 3. Visualizzare gli studenti attivi.
 4. Ordinare per Cognome e Nome.
 5. Visualizzare i primi 5 studenti.

 LIVELLO 2 - FILTRI
 6. Cercare cognomi che iniziano con "R".
 7. Cercare studenti con email valorizzata.
 8. Usare IN per filtrare più cognomi.
 9. Usare BETWEEN sulle date.
 10. Costruire una colonna Stato con CASE.

 LIVELLO 3 - DML
 11. Inserire uno studente.
 12. Modificare l'email di uno studente.
 13. Disattivare uno studente.
 14. Eliminare un record creato appositamente per l'esercizio.

 LIVELLO 4 - RELAZIONI
 15. Elencare studenti e corsi.
 16. Elencare anche studenti senza iscrizione con LEFT JOIN.
 17. Elencare corsi senza iscritti.
 18. Riscrivere una JOIN usando EXISTS.

 LIVELLO 5 - AGGREGAZIONI
 19. Contare gli studenti.
 20. Calcolare il costo medio dei corsi.
 21. Raggruppare le iscrizioni per corso.
 22. Usare HAVING per filtrare i gruppi.

 LIVELLO 6 - QUERY AVANZATE
 23. Trovare corsi sopra il costo medio.
 24. Usare una CTE per contare le iscrizioni.
 25. Usare ROW_NUMBER per numerare gli studenti.
 26. Confrontare EXISTS e JOIN.
 27. Usare UNION e UNION ALL.

 LIVELLO 7 - PROGRAMMAZIONE T-SQL
 28. Creare una stored procedure parametrizzata.
 29. Creare una funzione scalare.
 30. Creare una funzione con valore tabellare.
 31. Creare un trigger di audit.
 32. Gestire un errore con TRY/CATCH.

 LIVELLO 8 - PERFORMANCE
 33. Creare un indice su una colonna usata nei filtri.
 34. Analizzare il piano di esecuzione.
 35. Confrontare una query indicizzata e non indicizzata.

 LIVELLO 9 - SICUREZZA
 36. Creare un utente con permessi minimi.
 37. Concedere SELECT su uno schema.
 38. Revocare un permesso.
 39. Dimostrare perché concatenare input utente in SQL è pericoloso.
 40. Riscrivere la query usando parametri.

 LIVELLO 10 - PROGETTO
 41. Progettare un piccolo gestionale scolastico.
 42. Creare PK, FK, UNIQUE, CHECK e DEFAULT.
 43. Popolare il database.
 44. Creare viste e procedure.
 45. Creare report con JOIN, CTE e funzioni finestra.
 46. Preparare backup e procedura di ripristino.
*/
