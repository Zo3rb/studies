-- Lesson 10: Bit Strings (dvdrental)
-- Demonstrate bit logic with derived values.

WITH store_masks AS (
    SELECT
        s.store_id,
        (s.store_id::bit(4)) AS store_bit
    FROM store AS s
)
SELECT
    store_id,
    store_bit,
    store_bit | B'0010' AS or_mask,
    store_bit & B'0001' AS and_mask
FROM store_masks
ORDER BY store_id;

SELECT
    f.film_id,
    bit_length(f.title) AS title_bit_length
FROM film AS f
ORDER BY f.film_id
LIMIT 20;
