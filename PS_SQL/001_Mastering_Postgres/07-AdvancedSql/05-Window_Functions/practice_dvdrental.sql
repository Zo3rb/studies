-- Lesson 05: Window Functions
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

SELECT customer_id, payment_date, amount, row_number() OVER (PARTITION BY customer_id ORDER BY payment_date, payment_id) AS payment_no, sum(amount) OVER (PARTITION BY customer_id ORDER BY payment_date, payment_id ROWS UNBOUNDED PRECEDING) AS running_paid FROM payment ORDER BY customer_id, payment_date, payment_id LIMIT 30;
