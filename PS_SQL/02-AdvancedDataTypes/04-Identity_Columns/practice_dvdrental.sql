-- ==========================================
-- PostgreSQL Identity Columns Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to query identity column attributes in information_schema.
-- ==========================================

-- 1. SEARCH FOR IDENTITY COLUMNS IN DVDRENTAL
SELECT 
    table_name, 
    column_name, 
    is_identity, 
    identity_generation
FROM 
    information_schema.columns
WHERE 
    table_schema = 'public' 
    AND is_identity = 'YES';
-- Note: Traditional dvdrental schema uses legacy SERIAL (which is_identity = 'NO').
