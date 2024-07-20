-- Jaká je průměrná cena za vypůjčení DVD?

SELECT 	COUNT (amount), 
ROUND (AVG(amount),2) 
FROM payment;

-- Kolik filmů má dobu půjčení 7 dní?

SELECT rental_duration, COUNT (title) 
FROM film
WHERE rental_duration IN (7)
GROUP BY rental_duration;

-- NACHÁZÍ SE NA SKLADĚ FILM "Indiana Jones a dobyvatelé ztracené archy ?"

SELECT * 
FROM film
WHERE title ILIKE '%indiana jones%';

-- Seřazení payment tabulky podle "payment_id"

SELECT * 
FROM payment
ORDER BY payment_id
LIMIT 5;

-- KOLIK FILMŮ MÁ MEZI 60 AŽ 100 MINUTAMI A JSOU HODNOCENY 'R' NEBO 'PG'?

SELECT COUNT(*) AS total_films
FROM film
WHERE length BETWEEN 60 AND 100
	AND rating IN ('R', 'PG');

--  KTERÝCH 5 ZÁKAZNÍKŮ UTRATILO VÍCE NEBO STEJNĚ JAK 100$ ?

SELECT customer_id, ROUND (SUM(amount))
FROM payment
GROUP BY customer_id
HAVING  SUM(amount) >= 100
ORDER BY SUM(amount) DESC
LIMIT 5;

-- NALEZENÍ JMÉNA A PŘÍJMENÍ ZÁKAZNÍKŮ PODLE "customer_id"

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (148, 526, 178, 137, 144);

-- SPOJENÍ TABULEK "city" a "country" POMOCÍ INNER JOIN.

SELECT DISTINCT country, city,city_id
FROM country
INNER JOIN city
ON country.country_id = city.country_id
LIMIT 5;

-- HLEDÁNÍ NULL HODNOTY V TABULKÁCH "customer" a "payment".

SELECT first_name, last_name, amount 
FROM customer
FULL JOIN payment
ON customer.customer_id = payment.customer_id
WHERE customer.first_name IS null
OR payment.amount IS null;

-- SPOJENÍ DVOU SLOUPEČKŮ "last_name" a "title" z ROZDÍLNÝCH TABULEK "actor" a "film". 

SELECT last_name AS movie
FROM actor
UNION ALL
SELECT title AS movie
FROM film
ORDER BY movie;

