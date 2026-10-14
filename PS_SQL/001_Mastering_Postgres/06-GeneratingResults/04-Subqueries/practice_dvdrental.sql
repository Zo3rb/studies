-- Lesson 4: Subqueries
-- Target database: dvdrental (sample database).
-- Read-only queries; no schema changes.

SELECT f.film_id, f.title, f.length
FROM film AS f
WHERE f.length > (SELECT AVG(length) FROM film)
ORDER BY f.length DESC, f.film_id;

SELECT film_id, title, category_id
FROM (SELECT f.film_id, f.title, fc.category_id FROM film AS f JOIN film_category AS fc USING (film_id)) AS categorized
ORDER BY title
LIMIT 20;
