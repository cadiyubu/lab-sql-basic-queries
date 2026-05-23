USE sakila;

-- 1. Displaying all tables in the Sakila database

SHOW TABLES FROM sakila;

-- Retrieve all the data from the tables actor, film and customer.
SELECT * FROM sakila.actor;
SELECT * FROM sakila.film;


-- 3.Retrieve he following columns from their respective tables:
-- 3.1 Titles of all films from the film table
SELECT title FROM sakila.film; 
-- 3.2 List of languages used in films, with the column aliased as language from the language table
SELECT name as language FROM sakila.language;

-- 3.3 List of first names of all employees from the staff table
SELECT first_name FROM sakila.staff;


-- 4. Retrieve unique release years.
SELECT  DISTINCT release_year FROM sakila.film;
-- only 2006

-- 5. Counting records for database insights:
-- 5.1 Determine the number of stores that the company has.
SELECT COUNT(store_id) AS Num_stores FROM sakila.store;
-- only 2

-- 5.2 Determine the number of employees that the company has.
SELECT COUNT(staff_id) AS Num_employees FROM sakila.staff;
-- only 2

-- 5.3 Determine how many films are available for rent and how many have been rented.
-- Number of files rented thus not available=183
SELECT COUNT(inventory_id)
FROM sakila.rental
WHERE return_date IS NULL;

-- Number of files that have been rented, same film rented more than once counts as one file rented ever =4580
SELECT COUNT(DISTINCT inventory_id)
FROM sakila.rental
WHERE return_date IS NOT NULL;

-- files registered in inventory = 4581 Thus files available are 4581-183= 4398
SELECT COUNT(inventory_id)
FROM sakila.inventory;

-- 5.4 Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;
-- DISTINCT last names are 121

-- Retrieve the 10 longest films (lenght of 185)
SELECT title, length FROM sakila.film 
ORDER BY length desc
LIMIT 10;

-- 7. Use filtering techniques in order to:
-- 7.1 Retrieve all actors with the first name "SCARLETT".

SELECT actor_id, first_name, last_name 
FROM sakila.actor
WHERE first_name = 'SCARLETT';

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT title, length FROM sakila.film 
WHERE title LIKE '%ARMAGEDDON%'
AND length>100;

-- 7.3 Determine the number of films that include Behind the Scenes content=538
SELECT COUNT(special_features) FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';
