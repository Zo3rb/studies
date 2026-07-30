-- ==========================================
-- PostgreSQL Sequences Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to inspect sequence details.
-- ==========================================

-- 1. QUERY SEQUENCE CATALOG DETAILS
SELECT 
    schemaname, 
    sequencename, 
    start_value, 
    min_value, 
    max_value, 
    increment_by, 
    last_value 
FROM 
    pg_sequences
WHERE 
    schemaname = 'public';
