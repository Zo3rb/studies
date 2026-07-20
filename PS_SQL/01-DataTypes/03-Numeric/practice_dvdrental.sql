-- ==========================================
-- PostgreSQL NUMERIC Type Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to explore real-world numeric usage and arithmetic precision.
-- ==========================================
-- 1. IDENTIFY NUMERIC COLUMNS IN DVDRENTAL
-- Query information_schema to find columns using numeric or decimal types.
-- Note the precision and scale configurations chosen.
SELECT table_name,
    column_name,
    data_type,
    numeric_precision,
    numeric_scale
FROM information_schema.columns
WHERE table_schema = 'public'
    AND data_type IN ('numeric', 'decimal')
ORDER BY table_name;
-- 2. FINANCIAL MATH AND MULTIPLICATIONS
-- Let's practice calculating tax on rentals.
-- Suppose sales tax is 8.25% (0.0825).
-- If we multiply a NUMERIC(5,2) by a numeric float, we get a highly precise result.
-- Let's cast the tax output back to a standard money scale of 2.
SELECT payment_id,
    amount AS base_price,
    amount * 0.0825 AS raw_tax,
    -- unconstrained precision
    (amount * 0.0825)::numeric(5, 2) AS cast_tax_nearest,
    -- rounds to nearest standard cents
    ROUND(amount * 0.0825, 2) AS round_tax_function -- using round function
FROM payment
LIMIT 10;
-- 3. ANALYSIS OF RATIO (DIVISION WITH NUMERIC)
-- Dividing rental_rate (NUMERIC 4,2) by replacement_cost (NUMERIC 5,2)
-- PostgreSQL preserves precision dynamically.
SELECT title,
    rental_rate,
    replacement_cost,
    -- Raw ratio division
    rental_rate / replacement_cost AS cost_to_rent_ratio,
    -- Percentage format (ratio multiplied by 100 and rounded to 1 decimal place)
    ROUND((rental_rate / replacement_cost * 100), 1) || '%' AS rent_percentage_of_cost
FROM film
LIMIT 15;