-- Lesson 12: Views
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

CREATE OR REPLACE TEMP VIEW customer_rental_counts AS SELECT c.customer_id, c.first_name, count(r.rental_id) AS rental_count FROM customer AS c LEFT JOIN rental AS r USING (customer_id) GROUP BY c.customer_id, c.first_name; SELECT * FROM customer_rental_counts ORDER BY rental_count DESC, customer_id LIMIT 10; DROP VIEW customer_rental_counts;
