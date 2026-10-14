-- Lesson 01: Introduction to Advanced SQL
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

SELECT c.customer_id, count(r.rental_id) AS rentals FROM customer AS c LEFT JOIN rental AS r USING (customer_id) GROUP BY c.customer_id ORDER BY rentals DESC, c.customer_id LIMIT 10;
