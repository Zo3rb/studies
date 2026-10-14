-- Lesson 1: Introduction to Queries
-- Target database: dvdrental (sample database).
-- Read-only queries; no schema changes.

SELECT film_id, title, rental_rate, length
FROM film
WHERE rental_rate >= 2.99
ORDER BY length DESC, film_id
LIMIT 10;
