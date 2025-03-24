-- 1 uzd
SELECT c.first_name AS kliento_vardas, c.last_name AS kliento_pavardė,
       s.first_name AS pardavėjo_vardas, s.last_name AS pardavėjo_pavardė,
       SUM(p.amount) AS išleista_suma_nuomai
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN staff s ON p.staff_id = s.staff_id
WHERE p.amount BETWEEN 150 AND 200
GROUP BY c.customer_id, s.staff_id
ORDER BY išleista_suma_nuomai ASC;

-- 2 uzd
SELECT amount,
       CASE 
           WHEN amount <= 2 THEN 'Minimalus'
           WHEN amount <= 6.99 THEN 'Vidutinis'
           ELSE 'Didesnis nei vidutinis'
       END AS mokestis_grupe
FROM payment;

-- 3 uzd
SELECT title, length,
       CASE 
           WHEN length <= 60 THEN 'Iki valandos'
           WHEN length <= 120 THEN 'Iki dviejų valandų'
           WHEN length <= 180 THEN 'Iki trijų valandų'
           ELSE 'Virš trijų valandų'
       END AS trukmes_kategorija
FROM film;

-- 4 uzd
SELECT 
    CASE 
        WHEN LEFT(last_name, 1) BETWEEN 'A' AND 'B' THEN 'A-B'
        WHEN LEFT(last_name, 1) BETWEEN 'C' AND 'D' THEN 'C-D'
        WHEN LEFT(last_name, 1) BETWEEN 'E' AND 'F' THEN 'E-F'
        ELSE 'Visi kiti'
    END AS kategorija,
    COUNT(*) AS klientu_skaicius
FROM customer
GROUP BY kategorija
ORDER BY kategorija;

-- 5 uzd
SELECT 
    segmentas,
    COUNT(*) AS klientu_skaicius,
    SUM(isleista_suma) AS bendros_pajamos
FROM (
    SELECT c.customer_id, 
           c.first_name, 
           c.last_name,
           SUM(p.amount) AS isleista_suma,
           CASE 
               WHEN SUM(p.amount) <= 50 THEN 'taupūs klientai'
               WHEN SUM(p.amount) <= 100 THEN 'išleidžiantys vidutiniškai'
               ELSE 'išleidžiantys daug'
           END AS segmentas
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
) AS klientai
GROUP BY segmentas;



    
    

