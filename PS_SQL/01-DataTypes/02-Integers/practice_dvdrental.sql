-- ==========================================
-- PostgreSQL Integers Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to explore integer columns and practice integer math.
-- ==========================================
-- 1. INSPECT INTEGER COLUMNS IN DVDRENTAL
-- Query information_schema to find all columns using integer, smallint, or bigint in dvdrental.
SELECT table_name,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
    AND data_type IN ('integer', 'smallint', 'bigint')
ORDER BY data_type,
    table_name;
-- 2. PRACTICE ARITHMETIC WITH SMALLINT
-- The 'length' column in the 'film' table stores movie length in minutes using SMALLINT.
-- Let's practice calculating movie durations in hours.
SELECT title,
    length AS minutes,
    -- Integer division (gives the number of full hours)
    length / 60 AS full_hours,
    -- Modulo operator % (gives the remaining minutes)
    length % 60 AS remaining_minutes,
    -- Exact decimal conversion (returns a numeric result)
    ROUND((length / 60.0)::numeric, 2) AS decimal_hours
FROM film
LIMIT 15;
-- 3. TYPE CASTING AND COMBINATIONS
-- Look at how different integer types behave when mixed in calculations.
-- Multiplying smallint by integer results in an integer.
SELECT f.title,
    f.length AS film_length_smallint,
    i.inventory_id AS inventory_id_integer,
    -- Operation mixes SMALLINT and INTEGER
    f.length * i.inventory_id AS mixed_type_product
FROM film f
    JOIN inventory i ON f.film_id = i.film_id
LIMIT 10;