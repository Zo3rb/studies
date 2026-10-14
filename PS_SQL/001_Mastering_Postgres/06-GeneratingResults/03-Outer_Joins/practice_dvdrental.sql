-- Lesson 3: Outer Joins
-- Target database: dvdrental (sample database).
-- Read-only queries; no schema changes.

SELECT f.film_id, f.title, i.inventory_id
FROM film AS f
LEFT JOIN inventory AS i ON i.film_id = f.film_id
ORDER BY f.title, i.inventory_id
LIMIT 30;

-- Preserve every film while matching only inventory in store 1
SELECT f.film_id, f.title, i.inventory_id
FROM film AS f
LEFT JOIN inventory AS i ON i.film_id = f.film_id AND i.store_id = 1
ORDER BY f.film_id
LIMIT 30;
