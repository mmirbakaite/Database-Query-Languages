-- 1 UZD Pateikite aktorių vardus ir pavardes, rezultatą surūšiuojant pagal vardą abėcėlės tvarka
SELECT first_name, last_name
from actor
ORDER BY first_name ASC

-- 2 UZD Pateikite visą informaciją apie aktorius, kurių vardas yra Nick
SELECT *
from actor
where first_name = 'Nick'

-- 3 UZD Pateikite filmų, kurių nuomos trukmė yra 6 dienos, pavadinimus ir nuomos kainą. Rezultatą surūšiuokite pagal nuomos kainą mažėjančia tvarka
SELECT title, rental_rate, rental_duration
FROM film
WHERE rental_duration = '6'
ORDER BY rental_rate DESC;

-- 4 UZD Koks pigiausias filmas (i), kurį galima išsinuomuoti 3 dienoms? Kokia to filmo kaina?
Select title, rental_rate, rental_duration
from film
where rental_duration = '3' and rental_rate = (select min(rental_rate) from film)

-- 5 UZD Kiek kainuoja filmo “Lady Stage” nuoma?
SELECT title, rental_rate
FROM film
WHERE title = 'LADY STAGE'

-- 6 UZD  Kiek iš viso nuomai yra išleidęs klientas, kurio ID yra 15?
select customer_id, sum(amount)
from payment
where customer_id = '15'

-- 7 UZD Kiek mokėjimų yra atlikęs klientas, kurio ID yra 10?
select customer_id, count(amount)
from payment
where customer_id = '10'

-- 8 UZD Pateikite rezultatą tokia tvarka: kliento kodas, atliktas mokėjimas, mokėjimo data.
select customer_id, amount, payment_date
from payment


