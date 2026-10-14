-- Lesson 03: Grouping
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

SELECT customer_id, count(*) AS payment_count, sum(amount) AS total_paid FROM payment GROUP BY customer_id HAVING sum(amount) > 100 ORDER BY total_paid DESC, customer_id LIMIT 10;
