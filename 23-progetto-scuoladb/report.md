# Report didattico

```sql
SELECT s.Nome,s.Cognome,c.NomeCorso,
 d.Nome + N' ' + d.Cognome AS Docente,a.NomeAula,
 c.Descrizione,l.DataLezione,l.OraInizio,l.DurataMinuti,v.Voto
FROM Studenti s
JOIN Iscrizioni i ON s.StudenteId=i.StudenteId
JOIN Corsi c ON i.CorsoId=c.CorsoId
JOIN Lezioni l ON c.CorsoId=l.CorsoId
JOIN Aule a ON l.AulaId=a.AulaId
JOIN DocentiCorso dc ON c.CorsoId=dc.CorsoId
JOIN Docenti d ON dc.DocenteId=d.DocenteId
LEFT JOIN Voti v ON s.StudenteId=v.StudenteId AND c.CorsoId=v.CorsoId
ORDER BY s.Cognome,s.Nome,c.NomeCorso,l.DataLezione;
```

Per NULL: ISNULL(CONVERT(VARCHAR(20),l.OraInizio),'Ora non definita') e ISNULL(CONVERT(VARCHAR(20),l.DataLezione,103),'Data non disponibile').