-- Lesson 17: COALESCE and Generated Columns
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

SELECT payment_id, amount, coalesce(amount, 0) AS amount_or_zero FROM payment ORDER BY payment_id LIMIT 10;
