/*
    BACKUP E RESTORE - LABORATORIO
    I percorsi devono essere validi sul server SQL Server.
*/

USE master;
GO

/*
    Backup completo di esempio:

    BACKUP DATABASE CorsoSqlServer
    TO DISK = 'C:\Backup\CorsoSqlServer.bak'
    WITH INIT, COMPRESSION, STATS = 10;
    GO

    Per un restore reale è necessario conoscere i nomi logici
    dei file contenuti nel backup. Prima si può usare:

    RESTORE FILELISTONLY
    FROM DISK = 'C:\Backup\CorsoSqlServer.bak';

    Il restore deve essere eseguito in un ambiente controllato,
    verificando percorso, spazio disponibile e connessioni attive.
*/
