-- Lesson 11: Indexing Joins
-- Target database: dvdrental (sample database).
-- Read-only queries; no schema changes.

EXPLAIN (ANALYZE, BUFFERS)
SELECT f.film_id, f.title, i.inventory_id
FROM film AS f JOIN inventory AS i ON i.film_id=f.film_id
WHERE f.film_id = 1;

SELECT tablename, indexname, indexdef FROM pg_indexes
WHERE tablename IN ('film','inventory') ORDER BY tablename, indexname;
