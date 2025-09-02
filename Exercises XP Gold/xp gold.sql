
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