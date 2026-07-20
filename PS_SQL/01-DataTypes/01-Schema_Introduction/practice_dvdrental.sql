-- ==========================================
-- PostgreSQL Schema Introduction Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to query catalog metadata and explore existing schemas.
-- ==========================================

-- 1. Check the current active schemas search path in dvdrental
SHOW search_path;


-- 2. Query system catalogs to see all schemas in the database
-- In PostgreSQL, pg_namespace stores the schemas.
-- We filter out system schemas starting with 'pg_' and 'information_schema' to see user/public schemas.
SELECT 
    oid, 
    nspname AS schema_name
FROM 
    pg_namespace
WHERE 
    nspname NOT LIKE 'pg_%' 
    AND nspname != 'information_schema'
ORDER BY 
    nspname;


-- 3. Query all tables and which schemas they belong to
-- pg_catalog.pg_tables lists all tables along with their schema.
SELECT 
    schemaname, 
    tablename, 
    tableowner
FROM 
    pg_catalog.pg_tables
WHERE 
    schemaname NOT LIKE 'pg_%' 
    AND schemaname != 'information_schema'
ORDER BY 
    schemaname, tablename;


-- 4. Practice using fully qualified table names in queries
-- Although we can query 'actor' directly because public is in search_path,
-- try querying it by explicitly declaring the schema.
SELECT 
    actor_id, 
    first_name, 
    last_name 
FROM 
    public.actor 
LIMIT 5;
