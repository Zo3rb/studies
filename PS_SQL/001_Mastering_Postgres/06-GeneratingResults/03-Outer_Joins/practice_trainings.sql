-- Lesson 3: Outer Joins
-- Target database: trainings (execute only in the trainings database).
-- This script creates no persistent objects; it is safe to rerun.

SELECT c.customer_id, c.first_name, r.rental_id
FROM customer AS c
LEFT JOIN rental AS r ON r.customer_id = c.customer_id
ORDER BY c.customer_id, r.rental_id
LIMIT 30;

-- Customers with no rental (if any)
SELECT c.customer_id, c.first_name, c.last_name
FROM customer AS c
LEFT JOIN rental AS r ON r.customer_id = c.customer_id
WHERE r.rental_id IS NULL;
