-- Lesson 5: LATERAL Joins
-- Target database: trainings (execute only in the trainings database).
-- This script creates no persistent objects; it is safe to rerun.

SELECT c.customer_id, c.first_name, recent.rental_id, recent.rental_date
FROM customer AS c
LEFT JOIN LATERAL (
  SELECT r.rental_id, r.rental_date FROM rental AS r
  WHERE r.customer_id = c.customer_id
  ORDER BY r.rental_date DESC, r.rental_id DESC LIMIT 2
) AS recent ON true
ORDER BY c.customer_id, recent.rental_date DESC;
