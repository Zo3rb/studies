-- Lesson 15: Exclusion Constraints (dvdrental)
-- Detect overlapping rental windows per inventory item (analysis query).

WITH rental_windows AS (
    SELECT
        r.rental_id,
        r.inventory_id,
        tstzrange(r.rental_date, coalesce(r.return_date, now()), '[)') AS slot
    FROM rental r
)
SELECT
    a.inventory_id,
    a.rental_id AS rental_a,
    b.rental_id AS rental_b
FROM rental_windows a
JOIN rental_windows b
  ON a.inventory_id = b.inventory_id
 AND a.rental_id < b.rental_id
 AND a.slot && b.slot
LIMIT 30;

