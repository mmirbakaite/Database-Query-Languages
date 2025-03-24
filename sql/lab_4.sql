-- 1 uzd.
SELECT title, length
FROM film
WHERE length = (SELECT MAX(length) FROM film)
ORDER BY length DESC;

-- 2 uzd
select first_name, last_name
from customer
inner join payment using(customer_id)
WHERE amount = (SELECT MAX(amount) FROM payment)
order by amount desc;

-- 3 uzd
select title, count(inventory_id) 
from film
inner join inventory using(film_id)
group by title
order by count(inventory_id)  desc;	

-- 4 uzd
SELECT c.customer_id, c.first_name, c.last_name, MAX(p.amount) AS max_payment
FROM customer AS c
JOIN payment AS p ON c.customer_id = p.customer_id
WHERE p.amount IN (2.99, 3.99, 4.99)
GROUP BY c.customer_id
HAVING MAX(p.amount) = 2.99 OR MAX(p.amount) = 3.99 OR MAX(p.amount) = 4.99
ORDER BY c.customer_id;





