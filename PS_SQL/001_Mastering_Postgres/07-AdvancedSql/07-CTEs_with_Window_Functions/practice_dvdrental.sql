-- Lesson 07: CTEs with Window Functions
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

WITH ranked AS (SELECT customer_id, payment_id, payment_date, amount, row_number() OVER (PARTITION BY customer_id ORDER BY amount DESC, payment_id) AS rn FROM payment) SELECT customer_id, payment_id, payment_date, amount FROM ranked WHERE rn <= 2 ORDER BY customer_id, rn LIMIT 30;
