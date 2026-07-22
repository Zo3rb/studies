-- ==========================================
-- PostgreSQL UUIDs Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to generate UUID identifiers for analytics queries.
-- ==========================================

-- 1. SEARCH FOR UUID COLUMNS IN DVDRENTAL
SELECT 
    table_name, 
    column_name, 
    data_type
FROM 
    information_schema.columns
WHERE 
    table_schema = 'public' 
    AND data_type = 'uuid';


-- 2. GENERATE SYNTHETIC API TOKENS FOR CUSTOMERS
-- Suppose you are building a modern REST API on top of dvdrental and want to expose secure UUID tokens instead of customer_id integers:
SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    gen_random_uuid() AS public_api_token
FROM 
    customer
LIMIT 10;
