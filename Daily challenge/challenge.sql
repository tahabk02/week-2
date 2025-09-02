CREATE TABLE actors(
 actor_id SERIAL PRIMARY KEY,
 first_name VARCHAR (50) NOT NULL,
 last_name VARCHAR (100) NOT NULL,
 age DATE NOT NULL,
 number_oscars SMALLINT NOT NULL
)
INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES('Matt','Damon','08/10/1970', 5);

INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES('George','Clooney','06/05/1961', 2);

INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES ('Meryl', 'Streep', '1949-06-22', 3);

INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES ('Scarlett', 'Johansson', '1984-11-22', 0);
INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES
('Leonardo', 'DiCaprio', '1974-11-11', 1),
('Jennifer', 'Lawrence', '1990-08-15', 1),
('Tom', 'Hanks', '1956-07-09', 2);

SELECT * FROM actors;

      -- ================================================================= --
	  
-- 1 :
SELECT COUNT(*) AS total_actors
FROM actors;

-- 2:

INSERT INTO actors (first_name, last_name, age, number_oscars)
VALUES ('Anne', '', '1985-04-15', 1);

              -- ======================================== --
INSERT INTO actors (first_name, last_name, birth_date)
VALUES ('John', '', NULL);

-- ERROR: null value in column "last_name" violates not-null constraint


