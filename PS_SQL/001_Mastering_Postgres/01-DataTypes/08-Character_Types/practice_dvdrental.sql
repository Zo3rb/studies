-- ==========================================
-- PostgreSQL Character Types Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to inspect text data types used across dvdrental tables.
-- ==========================================

-- 1. INSPECT CHARACTER COLUMN TYPES IN DVDRENTAL
-- Query information_schema to see how character, varchar, and text are distributed.
SELECT 
    table_name, 
    column_name, 
    data_type, 
    character_maximum_length
FROM 
    information_schema.columns
WHERE 
    table_schema = 'public' 
    AND data_type IN ('character varying', 'character', 'text')
ORDER BY 
    data_type, table_name;


-- 2. STRING OPERATIONS ON TEXT AND VARCHAR COLUMNS
-- Practice using built-in PostgreSQL string functions on the film and customer tables.
SELECT 
    title,
    UPPER(title) AS uppercase_title,
    LOWER(title) AS lowercase_title,
    LENGTH(title) AS char_count,
    OCTET_LENGTH(title) AS byte_count,
    SUBSTRING(description FROM 1 FOR 30) || '...' AS short_summary
FROM 
    film
LIMIT 10;
