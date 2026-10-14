-- Lesson 8: Subquery Elimination
-- Target database: trainings (execute only in the trainings database).
-- This script creates no persistent objects; it is safe to rerun.

-- Membership expressed with IN
SELECT c.customer_id, c.first_name FROM customer AS c
WHERE c.customer_id IN (SELECT r.customer_id FROM rental AS r)
ORDER BY c.customer_id;

-- Equivalent existence form; duplicates in rental do not duplicate customers
SELECT c.customer_id, c.first_name FROM customer AS c
WHERE EXISTS (SELECT 1 FROM rental AS r WHERE r.customer_id = c.customer_id)
ORDER BY c.customer_id;

EXPLAIN (ANALYZE, BUFFERS) SELECT c.customer_id FROM customer c WHERE EXISTS (SELECT 1 FROM rental r WHERE r.customer_id=c.customer_id);
