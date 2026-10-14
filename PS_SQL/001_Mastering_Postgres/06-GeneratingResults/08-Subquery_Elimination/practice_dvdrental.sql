-- Lesson 8: Subquery Elimination
-- Target database: dvdrental (sample database).
-- Read-only queries; no schema changes.

SELECT f.film_id, f.title FROM film AS f
WHERE f.film_id IN (SELECT i.film_id FROM inventory AS i)
ORDER BY f.film_id;

SELECT f.film_id, f.title FROM film AS f
WHERE EXISTS (SELECT 1 FROM inventory AS i WHERE i.film_id=f.film_id)
ORDER BY f.film_id;

EXPLAIN (ANALYZE, BUFFERS) SELECT f.film_id FROM film f WHERE EXISTS (SELECT 1 FROM inventory i WHERE i.film_id=f.film_id);
