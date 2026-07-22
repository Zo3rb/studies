-- ==========================================
-- PostgreSQL BOOLEAN Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to query boolean columns in sample data.
-- ==========================================

-- 1. INSPECT BOOLEAN COLUMNS IN DVDRENTAL
SELECT 
    table_name, 
    column_name, 
    data_type
FROM 
    information_schema.columns
WHERE 
    table_schema = 'public' 
    AND data_type = 'boolean';


-- 2. QUERY ACTIVE VS INACTIVE CUSTOMERS USING BOOLEAN PREDICATES
-- Table 'customer' has a column named 'activebool'
SELECT 
    activebool,
    COUNT(customer_id) AS customer_count
FROM 
    customer
GROUP BY 
    activebool;


-- 3. FILTER USING CLEAN BOOLEAN SYNTAX
SELECT 
    first_name, 
    last_name, 
    email 
FROM 
    customer 
WHERE 
    activebool -- Clean syntax instead of activebool = true
LIMIT 10;
