-- Lesson 13: NULL Handling (dvdrental)

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COALESCE(a.address2, '[no address2]') AS address2_safe
FROM customer c
JOIN address a ON a.address_id = c.address_id
ORDER BY c.customer_id
LIMIT 30;

SELECT
    COUNT(*) FILTER (WHERE a.address2 IS NULL) AS null_address2_count,
    COUNT(*) FILTER (WHERE a.address2 IS NOT NULL) AS non_null_address2_count
FROM address a;

