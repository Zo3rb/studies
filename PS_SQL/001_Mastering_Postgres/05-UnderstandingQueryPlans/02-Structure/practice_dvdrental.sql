-- Practice queries showing EXPLAIN output structure using the dvdrental database
-- Simple query to illustrate node hierarchy
EXPLAIN SELECT film.title, language.name FROM film
JOIN language ON film.language_id = language.language_id;

-- More complex query with subquery to see nested plan nodes
EXPLAIN SELECT * FROM film WHERE film_id IN (
    SELECT film_id FROM film_actor WHERE actor_id = 1
);
