-- Practice queries for the Explain Structure lesson
-- Show hierarchical plan output using dvdrental database

-- Simple join to illustrate parent‑child nodes
EXPLAIN SELECT f.title, l.name FROM film f
JOIN language l ON f.language_id = l.language_id;

-- Query with a sub‑select to show nested plan nodes
EXPLAIN SELECT * FROM film WHERE film_id IN (
    SELECT film_id FROM film_actor WHERE actor_id = 5
);
