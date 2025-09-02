         -- === Exercise 1: === --
-- 1:
SELECT *
FROM Items
ORDER BY Price ASC;
-- 2:
SELECT *
FROM items 
WHERE Price >=80
ORDER BY Price DESC;

-- 3:
SELECT firstname, lastname
FROM customers
order by firstname ASC
limit 3;
-- 4:
SELECT lastname 
FROM customers
ORDER BY lastname DESC 

      -- === Exercise 2 === --
  -- 1:
SELECT * 
FROM customer;
 -- 2:
SELECT first_name || ' ' || last_name AS full_name
FROM customer;
 -- 3:
SELECT DISTINCT create_date
FROM customer;
 --4: 
SELECT *
FROM customer
ORDER BY first_name DESC;
 -- 5:
SELECT film_id, title, description, release_year, rental_rate
FROM film
ORDER BY rental_rate ASC;
 -- 6: 
SELECT a.address, a.phone
FROM customer c
JOIN address a ON c.address_id = a.address_id
WHERE a.district = 'Texas';
-- 7: 
SELECT *
FROM film WHERE film_id IN (15, 150);
 -- 8: 
 SELECT film_id, title, description, length, rental_rate
 FROM film 
 WHERE title = 'TonFILMPrefere'

 -- 9:
 SELECT film_id, title, description, length, rental_rate
 FROM film
 WHERE title LIKE 'To%'

-- 10:
SELECT *
FROM film 
ORDER BY rental_rate ASC
LIMIT 10;

-- 11:
SELECT *
FROM film f1
WHERE 10<= (
	SELECT COUNT(*)
	FROM film f2
	WHERE f2.rental_rate < f1.rental_rate
)
ORDER BY rental_rate ASC;

-- 12: 
SELECT c.first_name, c.last_name, p.amount, p.payment_date
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
ORDER BY c.customer_id;

-- 13:
SELECT *
FROM film f
WHERE f.film_id NOT IN (
	SELECT film_id
	FROM inventory
);

-- 14:
SELECT ci.city, co.country 
FROM city ci 
JOIN country co ON ci.country_id = co.country_id;

-- 15:
SELECT c.customer_id, c.first_name, c.last_name, p.amount, p.payment_date, p.staff_id
FROM customer c
JOIN pyment p ON c.customer_id = p.customer_id
ORDER BY p.staff_id;


