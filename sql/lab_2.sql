-- UZD 1 Parašykite SQL užklausą, kuri išvestų visus filmus, kurių specialiųjų efektų aprašyme nėra žodžio “Trailers”. Naudokite lentelę „film“
SELECT title, special_features
FROM film
WHERE special_features NOT LIKE '%Trailers%'

-- UZD 2 Parašykite užklausą, kuri išvestų visus filmų pavadinimus, kurie prasideda raide „z“. Naudokite lentelę „film“.
SELECT title
FROM film
WHERE title LIKE 'Z%';

-- UZD 3 Parašykite užklausą, kuri išvestų visus filmų pavadinimus, kurių antroji raidė yra “w”, o visos kitos raidės bet kokios. Naudokite lentelę „film“.
SELECT title
FROM film
WHERE title LIKE '_w%';

-- UZD 4 Parašykite SQL užklausą, kuri išvestų visus filmų pavadinimus, kurių antroji raidė yra “w”, ketvirtoji raidė yra “e”, o visos kitos raidės bet kokios. Naudokite lentelę „film“
select title 
from film
where title like '_w_e%'

-- UZD 5 Parašykite SQL užklausą, kuri išvestų filmo pavadinimą, nuomos kainą, depozito, o bendra nuomos kaina, įskaitant depozitą, pateikiama naujame stulpelyje “total”. Naudokite lentelę „film“.
SELECT title, rental_rate, replacement_cost, rental_rate + replacement_cost as total
from film

-- UZD 6  Parašykite SQL užklausą, kuri užklausos rezultate stulpelius title, description pervadina į stulpelius filmo pavadinimas, aprašymas atitinkamai. Naudokite lentelę „film“
SELECT title as 'filmo pavadinimas', description as 'aprasymas'
from film

-- UZD 7 Parašykite SQL užklausą, kuri išvestų filmo pavadinimą, aprašymą, filmo rodymo trukmę, kai filmo rodymo trukmė yra tarp 46 ir 50, pradedant nuo trumpiausių. Naudokite lentelę „film“
SELECT title, description, length
from film
where length between 46 and 50
ORDER BY length asc

-- UZD 8 Parašykite SQL užklausą, kuri išvestų filmų pavadinimus, nuomos kainą, filmo rodymo trukmę, kai nuomos kaina yra 2.99 arba filmo rodymo trukmė yra 130. Naudokite lentelę „film“
SELECT title, rental_rate, length
from film
where rental_rate = '2.99' OR length = '130'

-- UZD 9 Parašykite užklausą, pateikiančią visus klientus, kur dar nėra grąžinę išsinuomotų filmų. Naudokite lentelę “rental”.
SELECT customer_id, return_date
from rental
where return_date IS null

-- UZD 10  Parašykite SQL užklausą, pateikiančią visus klientus, kur jau grąžino išsinuomotus filmus. Naudokite lentelę “rental”
SELECT customer_id, return_date
from rental
where return_date IS not null

-- UZD 11 Parašykite SQL užklausą, kuri pateikia visą informaciją apie miestus, išskyrus miestus Adana, Abu Dhabi ir Aden. Naudokite lentelę “city”
SELECT *
from city
where city NOT IN ('Adana', 'Abu Dhabi', 'Aden')

-- UZD 12 Parašykite SQL užklausą, kuri paskaičiuoja bendrą visų atliktų įmokų sumą. Rezultatą pateikite stulpelyje „Iš viso“. Naudokite lentelę „payment“.
select sum(amount) as 'Is viso'
from payment

-- UZD 13 Kokia yra vidutinė įmoka, kurią atlieka klientai? Naudokite lentelę „payment“.
SELECT avg(amount) as 'Vidutine imoka'
from payment

-- UZD 14 Parašykite SQL užklausą, kuri paskaičiuotų, kiek yra darbuotojų. Rezultatą pateikite stulpelyje “'Darbuotojų skaičius”. Naudokite lentelę „payment“.
SELECT COUNT(DISTINCT(staff_id)) as 'Darbuotoju skaicius'
from payment

-- UZD 15 Parašykite SQL užklausą, kuri paskaičiuoja, kiek yra atlikta mokėjimų. Rezultatą pateikite stulpelyje „Iš viso mokėjmų“. Paskaičiuoti galima keliais būdais. Naudokite lentelę „payment“.
SELECT count(payment_id) as 'Is viso mokejimu'
from payment

-- UZD 16 Parašykite SQL užklausą, kuri pateikia didžiausią atliktą mokėjimą. Rezultatą pateikite stulpelyje „Didžiausias mokėjimas”. Naudokite lentelę „payment“.
select max(amount) as 'Didziausias mokejimas'
from payment

-- UZD 17 Parašykite SQL užklausą, kuri ištraukia mažiausią atliktą mokėjimą. Rezultatą pateikite stulpelyje „Mažiausias mokėjimas”. Naudokite lentelę „payment“. 
select min(amount) as 'Didziausias mokejimas'
from payment

-- UZD 18 Parašykite SQL užklausą, kuri pateikia kiekvieno kliento didžiausią mokėjimą mažėjimo tvarka. Naudokite lentelę „payment“.
SELECT customer_id, MAX(amount) AS 'max amount'
FROM payment
GROUP BY customer_id
order by MAX(amount) desc

-- UZD 19 Parašykite SQL užklausą, kuri pateikia didžiausią kiekvieno kliento atliktą mokėjimą dienos lygmeniu. Naudokite lentelę „payment“.
SELECT customer_id, DATE(payment_date) AS 'date', MAX(amount) AS 'max amount'
FROM payment
GROUP BY customer_id, DATE(payment_date);

-- UZD 20 Parašykite SQL užklausą, kuri pateiktų visus klientus, atlikusius mokėjimą 2005-07-08. Naudokite lentelę „payment“.
SELECT customer_id, DATE(payment_date) AS 'date'
FROM payment
WHERE DATE(payment_date) = '2005-07-08'

-- UZD 21 Parašykite SQL užklausą, kuri pateiktų visus klientus, atlikusius mokėjimą 2005-07-08. Naudokite lentelę „payment“.
SELECT customer_id, DATE(payment_date) AS 'date', MAX(amount) AS 'max amount'
FROM payment
GROUP BY customer_id, DATE(payment_date)
HAVING MAX(amount) > 6.99
ORDER BY MAX(amount) ASC;






























