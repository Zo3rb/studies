-- Lesson 5: LATERAL Joins
-- Target database: dvdrental (sample database).
-- Read-only queries; no schema changes.

SELECT c.category_id, c.name, topfilm.title, topfilm.rental_rate
FROM category AS c
LEFT JOIN LATERAL (
  SELECT f.title, f.rental_rate FROM film AS f
  JOIN film_category AS fc ON fc.film_id = f.film_id
  WHERE fc.category_id = c.category_id
  ORDER BY f.rental_rate DESC, f.film_id LIMIT 3
) AS topfilm ON true
ORDER BY c.name, topfilm.rental_rate DESC;
