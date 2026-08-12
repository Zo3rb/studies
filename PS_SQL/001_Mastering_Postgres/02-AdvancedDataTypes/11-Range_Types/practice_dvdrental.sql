-- Lesson 11: Range Types (dvdrental)

WITH rental_windows AS (
    SELECT
        r.rental_id,
        r.customer_id,
        tsrange(r.rental_date, coalesce(r.return_date, now()), '[)') AS rental_period
    FROM rental AS r
)
SELECT
    rw.customer_id,
    COUNT(*) AS open_or_closed_rentals
FROM rental_windows rw
WHERE rw.rental_period @> timestamp '2005-06-15 10:00:00'
GROUP BY rw.customer_id
ORDER BY open_or_closed_rentals DESC, rw.customer_id
LIMIT 20;

WITH rental_windows AS (
    SELECT
        r.rental_id,
        r.customer_id,
        tsrange(r.rental_date, coalesce(r.return_date, now()), '[)') AS rental_period
    FROM rental AS r
)
SELECT a.rental_id, b.rental_id, a.customer_id
FROM rental_windows a
JOIN rental_windows b
  ON a.customer_id = b.customer_id
 AND a.rental_id < b.rental_id
 AND a.rental_period && b.rental_period
LIMIT 20;

