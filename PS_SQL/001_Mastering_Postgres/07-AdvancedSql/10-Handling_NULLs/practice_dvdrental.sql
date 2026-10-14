-- Lesson 10: Handling NULLs
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

SELECT c.customer_id, count(*) AS rentals, count(r.return_date) AS returned, count(*) - count(r.return_date) AS unreturned FROM customer AS c LEFT JOIN rental AS r USING (customer_id) GROUP BY c.customer_id ORDER BY c.customer_id LIMIT 20;
