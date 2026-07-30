-- ==========================================
-- PostgreSQL Serial Type Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to inspect serial sequences in sample data.
-- ==========================================

-- 1. LIST ALL SEQUENCES IN THE DVDRENTAL DATABASE
SELECT 
    sequence_schema,
    sequence_name,
    data_type
FROM 
    information_schema.sequences
WHERE 
    sequence_schema = 'public'
ORDER BY 
    sequence_name;


-- 2. QUERY LAST VALUE OF ACTOR SEQUENCE
SELECT last_value FROM actor_actor_id_seq;
SELECT MAX(actor_id) FROM actor;
