-- Lesson 06: Common Table Expressions (CTEs)
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

WITH customer_totals AS (SELECT customer_id, sum(amount) AS total FROM payment GROUP BY customer_id) SELECT c.customer_id, c.first_name, t.total FROM customer_totals AS t JOIN customer AS c USING (customer_id) ORDER BY t.total DESC LIMIT 10;
