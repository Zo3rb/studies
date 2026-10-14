-- Lesson 2: Inner Joins
-- Target database: trainings (execute only in the trainings database).
-- This script creates no persistent objects; it is safe to rerun.

SELECT c.customer_id, c.first_name, c.last_name, r.rental_id, r.rental_date
FROM customer AS c
JOIN rental AS r ON r.customer_id = c.customer_id
ORDER BY c.customer_id, r.rental_date
LIMIT 25;
