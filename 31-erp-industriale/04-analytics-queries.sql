USE ERPAnalyticsDb;
GO
-- 01. Fatturato per cliente
SELECT c.RagioneSociale,SUM(f.Totale) AS Fatturato
FROM FattureClienti f JOIN Clienti c ON c.ClienteId=f.ClienteId
GROUP BY c.RagioneSociale ORDER BY Fatturato DESC;

-- 02. Fatturato mensile
SELECT YEAR(DataFattura) AS Anno,MONTH(DataFattura) AS Mese,SUM(Imponibile) AS Imponibile
FROM FattureClienti GROUP BY YEAR(DataFattura),MONTH(DataFattura) ORDER BY Anno,Mese;

-- 03. Margine teorico per articolo
SELECT a.Codice,a.Descrizione,a.CostoStandard,a.PrezzoVendita,
a.PrezzoVendita-a.CostoStandard AS MargineUnitario,
100*(a.PrezzoVendita-a.CostoStandard)/NULLIF(a.PrezzoVendita,0) AS MarginePercentuale
FROM Articoli a ORDER BY MarginePercentuale DESC;

-- 04. ABC articoli per valore di vendita
WITH x AS(
 SELECT a.ArticoloId,a.Codice,a.Descrizione,SUM(r.Imponibile) Valore
 FROM RigheFatturaCliente r JOIN Articoli a ON a.ArticoloId=r.ArticoloId
 GROUP BY a.ArticoloId,a.Codice,a.Descrizione),
y AS(
 SELECT *,SUM(Valore) OVER() Totale,SUM(Valore) OVER(ORDER BY Valore DESC ROWS UNBOUNDED PRECEDING) Cumulato FROM x)
SELECT *,100*Cumulato/NULLIF(Totale,0) AS PercCumulata,
CASE WHEN Cumulato<=Totale*.80 THEN 'A' WHEN Cumulato<=Totale*.95 THEN 'B' ELSE 'C' END ClasseABC FROM y;

-- 05. Giacenza per articolo e magazzino
SELECT * FROM vw_Giacenze ORDER BY Giacenza DESC;

-- 06. Articoli sotto scorta minima
SELECT a.Codice,a.Descrizione,a.ScortaMinima,ISNULL(g.Giacenza,0) Giacenza
FROM Articoli a LEFT JOIN(
 SELECT ArticoloId,SUM(CASE WHEN c.Segno=1 THEN Quantita ELSE -Quantita END) Giacenza
 FROM MovimentiMagazzino m JOIN CausaliMagazzino c ON c.CausaleId=m.CausaleId GROUP BY ArticoloId) g
ON g.ArticoloId=a.ArticoloId
WHERE ISNULL(g.Giacenza,0)<a.ScortaMinima;

-- 07. Produzione: rendimento
SELECT SUM(QuantitaBuona) Buona,SUM(QuantitaScarto) Scarto,
100*SUM(QuantitaBuona)/NULLIF(SUM(QuantitaBuona+QuantitaScarto),0) AS YieldPercentuale
FROM AvanzamentiProduzione;

-- 08. Scarti per ordine
SELECT op.NumeroOrdine,SUM(ap.QuantitaBuona) Buona,SUM(ap.QuantitaScarto) Scarto
FROM OrdiniProduzione op JOIN AvanzamentiProduzione ap ON ap.OrdineProduzioneId=op.OrdineProduzioneId
GROUP BY op.NumeroOrdine ORDER BY Scarto DESC;

-- 09. Non conformità per gravità
SELECT Gravita,COUNT(*) Numero,SUM(CostoStimato) CostoStimato
FROM NonConformita GROUP BY Gravita ORDER BY CostoStimato DESC;

-- 10. Funnel CRM
SELECT Fase,COUNT(*) Opportunita,SUM(ValoreStimato) Valore,
SUM(ValoreStimato*Probabilita/100.0) ValorePesato
FROM OpportunitaCRM GROUP BY Fase ORDER BY ValorePesato DESC;

-- 11. Budget vs consuntivo
SELECT cc.Codice,cc.Descrizione,SUM(br.ImportoBudget) Budget,SUM(br.ImportoConsuntivo) Consuntivo,
SUM(br.ImportoConsuntivo-br.ImportoBudget) Scostamento
FROM BudgetRighe br JOIN CentriCosto cc ON cc.CentroCostoId=br.CentroCostoId
GROUP BY cc.Codice,cc.Descrizione ORDER BY Scostamento DESC;

-- 12. Scadenziario aperto
SELECT Tipo,COUNT(*) NumeroScadenze,SUM(Importo) Importo
FROM Scadenze WHERE Stato='APERTO' GROUP BY Tipo;

-- 13. DSO semplificato
SELECT AVG(DATEDIFF(DAY,f.DataFattura,s.DataScadenza)) AS GiorniMediScadenza
FROM FattureClienti f JOIN Scadenze s ON s.Documento=CONCAT('SCAD-',RIGHT(f.NumeroFattura,4));

-- 14. Top clienti
SELECT TOP (20)c.RagioneSociale,SUM(f.Totale) Totale
FROM FattureClienti f JOIN Clienti c ON c.ClienteId=f.ClienteId
GROUP BY c.RagioneSociale ORDER BY Totale DESC;

-- 15. Top prodotti
SELECT TOP (20)a.Codice,a.Descrizione,SUM(r.Quantita) QuantitaVenduta,SUM(r.Imponibile) Ricavi
FROM RigheFatturaCliente r JOIN Articoli a ON a.ArticoloId=r.ArticoloId
GROUP BY a.Codice,a.Descrizione ORDER BY Ricavi DESC;

-- 16. Produttività dipendenti
SELECT d.DipendenteId,d.Nome,d.Cognome,SUM(ap.QuantitaBuona) PezziBuoni,SUM(ap.TempoMinuti) Minuti
FROM AvanzamentiProduzione ap JOIN Dipendenti d ON d.DipendenteId=ap.DipendenteId
GROUP BY d.DipendenteId,d.Nome,d.Cognome ORDER BY PezziBuoni DESC;

-- 17. Costo non conformità
SELECT YEAR(DataApertura) Anno,MONTH(DataApertura) Mese,COUNT(*) NumeroNC,SUM(CostoStimato) Costo
FROM NonConformita GROUP BY YEAR(DataApertura),MONTH(DataApertura) ORDER BY Anno,Mese;

-- 18. Acquisti per fornitore
SELECT f.RagioneSociale,SUM(o.TotaleDocumento) Acquisti
FROM OrdiniFornitori o JOIN Fornitori f ON f.FornitoreId=o.FornitoreId
GROUP BY f.RagioneSociale ORDER BY Acquisti DESC;

-- 19. Rotazione logica: vendite / giacenza media semplificata
WITH v AS(SELECT ArticoloId,SUM(Quantita) Q FROM RigheFatturaCliente GROUP BY ArticoloId),
g AS(SELECT ArticoloId,SUM(CASE WHEN c.Segno=1 THEN Quantita ELSE -Quantita END) G FROM MovimentiMagazzino m JOIN CausaliMagazzino c ON c.CausaleId=m.CausaleId GROUP BY ArticoloId)
SELECT a.Codice,a.Descrizione,v.Q,g.G, v.Q/NULLIF(g.G,0) AS IndiceRotazione
FROM Articoli a JOIN v ON v.ArticoloId=a.ArticoloId JOIN g ON g.ArticoloId=a.ArticoloId
ORDER BY IndiceRotazione DESC;

-- 20. Anomalie semplici: fatture oltre fido
SELECT c.RagioneSociale,c.Fido,SUM(f.Totale) FatturatoPeriodo
FROM Clienti c JOIN FattureClienti f ON f.ClienteId=c.ClienteId
GROUP BY c.RagioneSociale,c.Fido
HAVING SUM(f.Totale)>c.Fido ORDER BY FatturatoPeriodo DESC;
