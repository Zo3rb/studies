-- Lesson 13: Materialized Views
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

CREATE TEMP VIEW rental_totals AS SELECT customer_id, count(*) AS rentals FROM rental GROUP BY customer_id; SELECT * FROM rental_totals ORDER BY rentals DESC LIMIT 10; DROP VIEW rental_totals; -- A persistent materialized view can be created from this query and refreshed as needed.
