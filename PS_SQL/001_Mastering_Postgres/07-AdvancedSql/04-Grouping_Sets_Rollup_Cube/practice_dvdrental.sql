-- Lesson 04: Grouping Sets, ROLLUP, and CUBE
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

SELECT date_trunc('month', payment_date)::date AS month, staff_id, sum(amount) AS revenue, grouping(date_trunc('month', payment_date)::date, staff_id) AS subtotal_mask FROM payment GROUP BY ROLLUP(date_trunc('month', payment_date)::date, staff_id) ORDER BY month NULLS LAST, staff_id NULLS LAST LIMIT 30;
