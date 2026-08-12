-- ==========================================
-- PostgreSQL ENUMs Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to query ENUM types in the sample database.
-- ==========================================

-- 1. SEARCH FOR ENUM TYPES IN THE SYSTEM CATALOG
-- pg_type typtype = 'e' identifies Enumerated types.
SELECT 
    t.typname AS enum_name,
    e.enumlabel AS enum_value,
    e.enumsortorder AS sort_order
FROM 
    pg_type t
JOIN 
    pg_enum e ON t.oid = e.enumtypid
JOIN 
    pg_namespace n ON t.typnamespace = n.oid
WHERE 
    t.typtype = 'e' 
    AND n.nspname = 'public'
ORDER BY 
    enum_name, sort_order;


-- 2. QUERY FILMS BASED ON ENUM RATING
-- Table 'film' uses the 'mpaa_rating' ENUM column (G, PG, PG-13, R, NC-17).
SELECT 
    rating,
    COUNT(film_id) AS total_films
FROM 
    film
GROUP BY 
    rating
ORDER BY 
    rating;
