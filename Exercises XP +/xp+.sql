-- INSERT INTO students (first_name, last_name, birth_date) VALUES
--  ('Marc', 'Benichou', '1998-11-02'),
--  ('Yoan', 'Cohen', '2010-12-03'),
--  ('Lea', 'Benichou','1978-07-27'),
--  ('Amelia', 'Dux','1996-04-07'),
--  ('David', 'Grez','2003-06-14'),
--  ('Omer', 'Simpson','1980-10-03');
SELECT * FROM students;
SELECT first_name, last_name FROM students;

SELECT first_name, last_name FROM students 
WHERE last_name = 'Benichou' AND first_name = 'Marc';

SELECT first_name, last_name FROM students 
WHERE first_name ILIKE '%a%';

SELECT first_name, last_name FROM students
WHERE first_name LIKE 'a%';

SELECT first_name, last_name FROM students
WHERE  first_name LIKE '%a';


SELECT first_name, last_name FROM students 
WHERE SUBSTRING(first_name FROM LENGTH(first_name)-1 FOR 1) = 'a';
 -- TRUNCATE TABLE students RESTART IDENTITY;


SELECT first_name, last_name 
FROM students
WHERE id IN (1, 3);

SELECT * 
FROM students
WHERE birth_date >= '2000-01-01';

-----------------------------------------------------------------
-----------------------------------------------------------------

                 -- EXERCICES XP GOLD --
				 
--First four students ordered alphabetically by last_name:

SELECT first_name, last_name, birth_date
FROM students
ORDER BY last_name ASC
LIMIT 4;

-- Details of the youngest student"

SELECT first_name, last_name, birth_date
FROM students
ORDER BY birth_date DESC
LIMIT 1;

-- Three students skipping the first two students:

SELECT first_name, last_name, birth_date
FROM students
ORDER BY id ASC
OFFSET 2
LIMIT 3;




