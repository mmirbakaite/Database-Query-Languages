-- 1 UZD Kiek klientė Amy Lopez sumokėjo už filmo Rocky War nuomą?
SELECT customer.first_name, customer.last_name, film.title, payment.amount
FROM customer
LEFT JOIN rental using(customer_id)
LEFT JOIN payment using(rental_id)
LEFT JOIN inventory using(inventory_id)
LEFT JOIN film using(film_id)
WHERE customer.first_name = 'Amy' AND customer.last_name = 'Lopez' AND film.title = 'Rocky war';

-- 2 UZD Kada paskutinį kartą ir kiek sumokėjo klientė BETTY WHITE
SELECT c.customer_id, c.first_name, c.last_name, p.amount, p.payment_date
FROM customer c
LEFT JOIN payment p using (customer_id)
WHERE c.first_name = 'Betty' AND c.last_name = 'White' 
AND p.payment_date = (SELECT MAX(payment_date) FROM payment WHERE customer_id = c.customer_id);

-- 3 UZD Pateikite klientų vardus, pavardes ir sumokamą mokestį už filmo nuomą. Tuos klientus, kurie sumoka už nuomą vienu kartu 10 ir daugiau, pažymėkite kaip „Virš 10“, o išleidžiančius iki 10, pažymėkite „Iki 10“. Rezultatą surūšiuokite pagal filmo nuomos mokestį mažėjimo tvarka
SELECT DISTINCT c.first_name, c.last_name, p.amount,
CASE WHEN p.amount >= 10 THEN 'Virš 10'ELSE 'Iki 10' END AS 'Sumoka virs/iki 10'
from customer c
left join payment p using (customer_id)
ORDER BY p.amount DESC;

-- 4 UZD Pateikite klientų ir darbuotojų vardus, pavardes ir el. pašto adresus. Pridėkite naują stulpelį, pavadinimu customer/staff, kuriame klientams įrašykite požymį customer, o darbuotojams – staff.
SELECT c.first_name, c.last_name, c.email, "customer" as 'Customer/staff'
from customer c
UNION ALL
SELECT s.first_name, s.last_name, email, "staff" as "Customer/staff"
FROM staff s;

-- 5 UZD Pateikite klientės BARBARA JONES išsinuomotų filmų pavadinimus, išsinuomavimo datą, grąžinimo datą, nuomos mokestį. 
SELECT c.customer_id, c.first_name, c.last_name, r.inventory_id, r.rental_date, r.return_date
from customer c
left join rental r using (customer_id)
where c.first_name = 'BARBARA' AND c.last_name = 'JONES';

-- 6 UZD Kiek mažiausiai ir kiek daugiausiai už filmo nuomą yra sumokėjusi klientė Sarah Lewis? Naudokite lenteles “payment”, “customer”
SELECT MIN(p.amount) as 'Min amount', MAX(p.amount) as 'Max amount'
from customer c
left join payment p using(customer_id)
where c.first_name = 'SARAH' AND c.last_name = 'LEWIS'

-- 7 UZD Parašykite SQL užklausą, pateikiančią kliento vardą ir pavardę, pardavėjo vardą ir pavardę, įmokos dydį bei įmokos datą. Naudokite lenteles „payment“, „customer“, „staff“
SELECT p.payment_id, p.payment_date, p.amount, c.first_name as 'kliento vardas', c.last_name as 'kliento pavarde', s.first_name as 'darbuotojo vardas', s.last_name as 'darbuotojo pavarde'
from payment p
left join customer c using (customer_id)
left join staff s using (staff_id)


-- 8 UZD Kiek klienas PETER MENARD išleido nuomai per 2005 metus?
SELECT c.first_name, c.last_name, (
	SELECT SUM(p.amount)
	FROM payment p
	LEFT JOIN customer c using(customer_id)
	WHERE c.first_name = "Peter" and c.last_name = "Menard") as "total"
FROM customer c
WHERE c.first_name = "Peter" and c.last_name = "Menard";






