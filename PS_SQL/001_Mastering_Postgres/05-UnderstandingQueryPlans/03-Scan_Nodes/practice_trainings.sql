-- Practice training queries for Scan Nodes lesson
-- Demonstrate sequential scan with actual timing
EXPLAIN ANALYZE SELECT * FROM film WHERE length > 120;

-- Demonstrate index scan with actual timing (assuming index on rating)
EXPLAIN ANALYZE SELECT * FROM film WHERE rating = 'PG';

-- Demonstrate bitmap heap scan with actual timing
EXPLAIN ANALYZE SELECT * FROM film WHERE film_id IN (
    SELECT film_id FROM film_actor WHERE actor_id = 2
);
