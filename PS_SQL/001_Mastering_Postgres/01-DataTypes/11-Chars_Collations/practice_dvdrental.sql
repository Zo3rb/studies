-- ==========================================
-- PostgreSQL Chars & Collations Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to practice collation overrides on sample data.
-- ==========================================

-- 1. SORT FILM TITLES USING BINARY COLLATION
-- Comparing performance and sorting order when applying COLLATE "C"
SELECT 
    title 
FROM 
    film 
ORDER BY 
    title COLLATE "C" 
LIMIT 15;


-- 2. SORT ACTOR LAST NAMES USING DEFAULT LOCALE
SELECT 
    first_name, 
    last_name 
FROM 
    actor 
ORDER BY 
    last_name ASC 
LIMIT 15;
