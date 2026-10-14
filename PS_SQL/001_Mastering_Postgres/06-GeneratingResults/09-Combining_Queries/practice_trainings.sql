-- Lesson 9: Combining Queries
-- Target database: trainings (execute only in the trainings database).
-- This script creates no persistent objects; it is safe to rerun.

SELECT customer_id AS party_id, 'customer'::text AS party_type FROM customer WHERE active
UNION ALL
SELECT staff_id, 'staff'::text FROM staff
ORDER BY party_type, party_id;

SELECT customer_id FROM customer
INTERSECT SELECT customer_id FROM rental ORDER BY customer_id;
