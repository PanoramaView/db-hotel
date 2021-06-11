--1. Conta gli ospiti raggruppandoli per anno di nascita
SELECT COUNT(`id`) as `Conteggio Ospiti`, YEAR(`date_of_birth`) as Year
FROM `ospiti`
GROUP BY `Year`

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
SELECT HOURE(`created_at`) as `Hour`, COUNT(`id`) as `prenotazioni`
FROM `prenotazioni`
GROUP BY `Hour`
ORDER BY `prenotazioni` DESC

--5.Quante prenotazioni ha fatto l’ospite che ha fatto più prenotazioni? (quante, non chi!

SELECT ospite_id, COUNT(*) as `prenotazioni`
FROM `prenotazioni_has_ospiti`
GROUP BY `ospite_id`
ORDER BY prenotazioni DESC
LIMIT 1