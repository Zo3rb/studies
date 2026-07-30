-- Lesson 12: Composite Types (dvdrental)

SELECT
    c.customer_id,
    ROW(c.first_name, c.last_name)::record AS customer_name_record
FROM customer AS c
ORDER BY c.customer_id
LIMIT 20;

SELECT
    a.address_id,
    ROW(a.address, a.district, a.postal_code)::record AS address_record
FROM address AS a
ORDER BY a.address_id
LIMIT 20;

