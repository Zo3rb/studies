-- Lesson 2: Inner Joins
-- Target database: dvdrental (sample database).
-- Read-only queries; no schema changes.

SELECT f.film_id, f.title, a.actor_id, a.first_name, a.last_name
FROM film AS f
JOIN film_actor AS fa ON fa.film_id = f.film_id
JOIN actor AS a ON a.actor_id = fa.actor_id
ORDER BY f.title, a.last_name, a.first_name
LIMIT 30;
