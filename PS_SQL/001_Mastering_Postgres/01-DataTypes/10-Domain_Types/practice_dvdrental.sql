-- ==========================================
-- PostgreSQL Domain Types Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to query domains in the dvdrental database.
-- ==========================================

-- 1. QUERY ALL DOMAIN TYPES IN THE DATABASE CATALOG
-- In PostgreSQL catalog, pg_type stores types. Typtype = 'd' indicates a Domain.
SELECT 
    t.typname AS domain_name,
    b.typname AS base_type_name,
    n.nspname AS schema_name
FROM 
    pg_type t
JOIN 
    pg_type b ON t.typbasetype = b.oid
JOIN 
    pg_namespace n ON t.typnamespace = n.oid
WHERE 
    t.typtype = 'd' 
    AND n.nspname = 'public';


-- 2. INSPECT DOMAIN DEFINITION: 'year'
-- 'dvdrental' includes a domain named 'year' used in the film table (release_year column).
-- Let's inspect columns using the 'year' domain:
SELECT 
    table_name, 
    column_name, 
    domain_name
FROM 
    information_schema.columns
WHERE 
    domain_name = 'year';
