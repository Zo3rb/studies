-- Lesson 1: Introduction to Queries
-- Target database: trainings (execute only in the trainings database).
-- This script creates no persistent objects; it is safe to rerun.

SELECT customer_id, first_name, last_name
FROM customer
WHERE active = true
ORDER BY last_name, first_name
LIMIT 10;
