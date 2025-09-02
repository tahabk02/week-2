
       --   --------- EXERCISE 1 : -----------   --
-- 1:
SELECT rating, COUNT(*) AS total_films
FROM film
GROUP BY rating;

-- 2:
SELECT title, rating
FROM film
WHERE rating IN ('G', 'PG-13');

-- 3:
SELECT title, rating, length, rental_rate
FROM film
WHERE rating IN ('G', 'PG-13')
	AND length < 120
	AND rental_rate < 3.00
ORDER BY title;


-- 4:
UPDATE customer
SET first_name = 'Taha', last_name = 'Boulhak', email= 'tahabk02@gmail.com'
WHERE customer_id = 1;

-- 5:
UPDATE address
SET address = '123 Main Street', city_id = 1, postal_code = '10000', phone = '0612345678'
WHERE address_id = (SELECT address_id FROM customer WHERE customer_id = 1);


       --   ----------- EXERCISE 2 : -----------   --
-- 1:


UPDATE students
SET birth_date = '1998-11-02'
WHERE first_name IN ('Lea', 'Marc') AND last_name = 'Benichou';

-- 2:
UPDATE students 
SET last_name = 'Guez'
WHERE first_name = 'David' AND last_name = 'Grez';

-- 3:
DELETE FROM students
WHERE first_name = 'Lea' AND last_name = 'Benichou';

-- 4️ :
SELECT COUNT(*) AS total_students
FROM students;

-- 5:
SELECT COUNT(*) AS born_after_2000
FROM students
WHERE birth_date > '2000-01-01';

-- 6:
ALTER TABLE students
ADD COLUMN math_grade INT;

-- 7:
UPDATE students SET math_grade = 80 WHERE id = 1;
UPDATE students SET math_grade = 90 WHERE id IN (2,4);
UPDATE students SET math_grade = 40 WHERE id = 6;


-- 8:
SELECT COUNT(*) AS high_grades
FROM students
WHERE math_grade > 83;

-- 9:
INSERT INTO students (first_name, last_name, birth_date, math_grade)
VALUES ('Omer', 'SImpson', '1998-02-11', 70);

-- 10:
SELECT first_name, last_name, COUNT(math_grade) AS total_grade
FROM students
GROUP BY first_name, last_name;

-- 11:
SELECT SUM(math_grade) AS total_sum_grades
FROM students;



       --   ----------- EXERCISE 3: -----------   --
-- 1:
CREATE TABLE IF NOT EXISTS purchases (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    item_id INT REFERENCES items(id),
    quantity_purchased INT NOT NULL
);


-- 2:

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
SELECT c.id, i.id, 1
FROM customers c, items i
WHERE c.firstname='Scott' AND c.lastname='Scott'
  AND i.name='Fan';

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
SELECT c.id, i.id, 10
FROM customers c, items i
WHERE c.firstname='Melanie' AND c.lastname='Johnson'
  AND i.name='Large Desk';

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
SELECT c.id, i.id, 2
FROM customers c, items i
WHERE c.firstname='Greg' AND c.lastname='Jones'
  AND i.name='Small Desk';
  
-- 3:
SELECT * FROM purchases;

-- 4:
SELECT p.id AS purchase_id, c.firstname, c.lastname, p.item_id, p.quantity_purchased
FROM purchases p
JOIN customers c ON p.customer_id = c.id;

-- 5:
SELECT *
FROM purchases
WHERE customer_id = 5;

-- 6:
SELECT *
FROM purchases
WHERE item_id IN (
    SELECT id FROM items WHERE name IN ('Large Desk', 'Small Desk')
);

-- 7:
SELECT c.firstname, c.lastname, i.mame AS item_name
FROM purchases p
JOIN customers c ON p.customer_id = c.id
JOIN items i ON p.item_id = i.id;

-- 8:
INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES ((SELECT id FROM customers WHERE firstname='Taha' AND lastname='Boulhak'), NULL, 0);
