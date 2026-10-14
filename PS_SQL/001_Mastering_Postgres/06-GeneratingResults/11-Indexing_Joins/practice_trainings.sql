-- Lesson 11: Indexing Joins
-- Target database: trainings (execute only in the trainings database).
-- This script creates no persistent objects; it is safe to rerun.

EXPLAIN (ANALYZE, BUFFERS)
SELECT c.customer_id, r.rental_id FROM customer AS c
JOIN rental AS r ON r.customer_id = c.customer_id
WHERE c.customer_id = 1;

-- Inspect indexes on both sides of the join
SELECT tablename, indexname, indexdef FROM pg_indexes
WHERE tablename IN ('customer','rental') ORDER BY tablename, indexname;
