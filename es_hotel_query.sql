--1.Seleziona tutti gli ospiti che sono stati identificati con la carta di identità
SELECT *
FROM `ospiti`
WHERE `document_type` LIKE 'CI'

--2.Seleziona tutti gli ospiti che sono nati dopo il 1988
SELECT *
FROM `ospiti`
WHERE YEAR(`date_of_birth`) > 1988

--3.Seleziona tutti gli ospiti che hanno più di 20anni (al momento dell’esecuzione della query)
SELECT *
FROM `ospiti`
WHERE (YEAR(`date_of_birth`)- YEAR(CURRENT_TIMESTAMP) < -20 AND MONTH(`date_of_birth`)- YEAR(CURRENT_TIMESTAMP) < 0) 
OR ( YEAR(`date_of_birth`)- YEAR(CURRENT_TIMESTAMP) < -21 AND MONTH(`date_of_birth`)- YEAR(CURRENT_TIMESTAMP) > 0)

--4.Seleziona tutti gli ospiti il cui nome inizia con la D
SELECT *
FROM `ospiti`
WHERE `name` LIKE "d%";

--5.Calcola il totale incassato degli ordini accepted
SELECT SUM(`price`)
FROM `pagamenti`
WHERE `status` = 'accepted' 

--6.Qual è il prezzo massimo pagato?
SELECT MAX(`price`)
FROM `pagamenti`
WHERE `status` = 'accepted' 

--7.Seleziona gli ospiti riconosciuti con patente e nati nel 1975
SELECT *
FROM `ospiti`
WHERE `document_type` LIKE 'Driver License' AND YEAR(`date_of_birth`) = 1975

--8.Quanti paganti sono anche ospiti?
SELECT *
FROM `paganti`
WHERE `ospite_id` IS NOT NULL

--9.Quanti posti letto ha l’hotel in totale?

SELECT SUM(`beds`)
FROM `stanze`
