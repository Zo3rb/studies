-- Lesson 4: Subqueries
-- Target database: trainings (execute only in the trainings database).
-- This script creates no persistent objects; it is safe to rerun.

SELECT film_id, title, replacement_cost
FROM film
WHERE replacement_cost > (SELECT AVG(replacement_cost) FROM film)
ORDER BY replacement_cost DESC, film_id;

SELECT c.customer_id, c.first_name, c.last_name
FROM customer AS c
WHERE EXISTS (SELECT 1 FROM rental AS r WHERE r.customer_id = c.customer_id)
ORDER BY c.customer_id;
