-- Practice queries for Scan Nodes lesson
-- Demonstrate sequential scan
EXPLAIN SELECT * FROM film WHERE length > 120;

-- Demonstrate index scan (assuming an index on rating)
EXPLAIN SELECT * FROM film WHERE rating = 'PG';

-- Demonstrate bitmap heap scan
EXPLAIN SELECT * FROM film WHERE film_id IN (SELECT film_id FROM film_actor WHERE actor_id = 2);
