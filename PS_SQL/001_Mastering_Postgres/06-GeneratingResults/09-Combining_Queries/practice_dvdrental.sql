-- Lesson 9: Combining Queries
-- Target database: dvdrental (sample database).
-- Read-only queries; no schema changes.

SELECT film_id FROM film WHERE rating = 'G'
UNION SELECT film_id FROM film WHERE length < 60
ORDER BY film_id;

SELECT film_id FROM film WHERE rating = 'G'
EXCEPT SELECT film_id FROM film WHERE length < 60
ORDER BY film_id;
