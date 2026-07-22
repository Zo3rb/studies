-- ==========================================
-- PostgreSQL Binary Data (BYTEA) Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to inspect binary data usage across sample tables.
-- ==========================================

-- 1. SEARCH FOR BYTEA COLUMNS IN DVDRENTAL
SELECT 
    table_name, 
    column_name, 
    data_type
FROM 
    information_schema.columns
WHERE 
    table_schema = 'public' 
    AND data_type = 'bytea';
-- Result: Note if any columns store binary content (in standard dvdrental, most data is relational text/numbers).


-- 2. PRACTICE ENCODING TEXT COLUMNS TO BYTEA ON THE FLY
-- Suppose we want to generate hex checksum representations of film titles:
SELECT 
    title,
    title::bytea AS title_bytes,
    encode(title::bytea, 'hex') AS title_hex,
    encode(title::bytea, 'base64') AS title_base64
FROM 
    film
LIMIT 10;
