--1. Conta gli ospiti raggruppandoli per anno di nascita
SELECT COUNT(`id`), YEAR(`date_of_birth`)
FROM `ospiti`
GROUP BY YEAR(`date_of_birth`)

--2.Somma i prezzi dei pagamenti raggruppandoli per status
SELECT SUM(price), status
FROM `pagamenti`
GROUP BY status

--3.Conta quante volte è stata prenotata ogni stanza
SELECT COUNT(`prenotazioni`.`stanza_id`), id
FROM `prenotazioni`
GROUP BY `id`

SELECT COUNT(p.id), room_number
FROM prenotazioni p JOIN stanze s ON p.stanza_id=s.id 
GROUP BY stanza_id

--4.Fai una analisi per vedere se ci sono ore in cui le prenotazioni sono più frequenti
--boh non vanno
SELECT COUNT(DATEPART(hour, created_at))
FROM `prenotazioni` 
GROUP BY DATEPART(hour, created_at) as hours
ORDER BY created_at DESC
LIMIT 3

SELECT *
FROM `prenotazioni`
WHERE DATEPART(hh, `created_at`) LIKE 18
--5.Quante prenotazioni ha fatto l’ospite che ha fatto più prenotazioni? (quante, non chi!

SELECT MAX()
FROM `prenotazioni`
WHERE DATEPART(hh, `created_at`) LIKE 18