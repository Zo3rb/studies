-- ==========================================
-- PostgreSQL Check Constraints Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to query existing check constraints.
-- ==========================================

-- 1. IDENTIFY ALL CHECK CONSTRAINTS IN DVDRENTAL
-- Query pg_constraint and pg_class to locate all CHECK constraints ('c') in public tables.
SELECT 
    con.conname AS constraint_name,
    rel.relname AS table_name,
    pg_get_constraintdef(con.oid) AS constraint_definition
FROM 
    pg_constraint con
JOIN 
    pg_class rel ON rel.oid = con.conrelid
JOIN 
    pg_namespace nsp ON nsp.oid = con.connamespace
WHERE 
    nsp.nspname = 'public'
    AND con.contype = 'c' -- 'c' = CHECK constraint
ORDER BY 
    table_name;


-- 2. STUDY A SPECIFIC CHECK RULE
-- Notice the constraints on the 'film' table:
-- - rental_rate: CHECK (rental_rate >= 0.0)
-- - replacement_cost: CHECK (replacement_cost >= 0.0)
-- - rental_duration: CHECK (rental_duration >= 0) -- usually present in standard dvdrental schemas

-- Let's test what happens if you attempt to add a film with a negative rental_rate
INSERT INTO public.film (
    title, 
    description, 
    release_year, 
    language_id, 
    rental_duration, 
    rental_rate, 
    length, 
    replacement_cost, 
    rating
) VALUES (
    'Negative Price Film', 
    'A film with negative rent cost', 
    2026, 
    1, 
    3, 
    -2.99,      -- This violates the rental_rate CHECK constraint!
    120, 
    19.99, 
    'G'::mpaa_rating
);
-- EXPECTED ERROR: new row for relation "film" violates check constraint "film_rental_rate_check"
