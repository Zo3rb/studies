-- Lesson 02: Cross Joins
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

SELECT c.customer_id, s.store_id FROM customer AS c CROSS JOIN store AS s ORDER BY c.customer_id, s.store_id LIMIT 20;
