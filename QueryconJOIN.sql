--1.Come si chiamano gli ospiti che hanno fatto più di due prenotazioni?
SELECT o.name, o.lastname
FROM ospiti o
JOIN paganti p1 ON p1.ospite_id = o.id
JOIN pagamenti p2 ON p2.pagante_id = p1.id
GROUP BY p2.pagante_id
HAVING COUNT(*) > 2


--2.Stampare tutti gli ospiti per ogni prenotazione
SELECT o.name, o.lastname
FROM ospiti o
JOIN `prenotazioni_has_ospiti` p2 ON p2.ospite_id = o.id
JOIN prenotazioni p3 ON p2.prenotazione_id = p3.id



--3.Stampare Nome, Cognome, Prezzo e Pagante per tutte le prenotazioni fatte a Maggio 2018
SELECT o.name, o.lastname, p2.price, p1.*
FROM ospiti o
JOIN paganti p1 ON p1.ospite_id = o.id
JOIN pagamenti p2 ON p2.pagante_id = p1.id
WHERE YEAR(p2.created_at) = 2018 AND MONTH(p2.created_at) = 05


--4.Fai la somma di tutti i prezzi delle prenotazioni per le stanze del primo piano
SELECT SUM(price), room_number
FROM prenotazioni p 
JOIN stanze s ON p.stanza_id=s.id 
JOIN stanze s ON p.stanza_id=s.id 
GROUP BY stanza_id


--5.Prendi i dati di fatturazione per la prenotazionecon id=7


--6.Le stanze sono state tutte prenotate al meno una volta ? (Visualizzare le stanze non ancora prenotate)

