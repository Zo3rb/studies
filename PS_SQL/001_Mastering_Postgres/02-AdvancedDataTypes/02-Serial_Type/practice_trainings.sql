-- ==========================================
-- PostgreSQL Serial Type Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test serial pseudo-types and observe sequence gaps.
-- ==========================================

-- 1. Create a table using SERIAL
DROP TABLE IF EXISTS serial_demo;

CREATE TABLE serial_demo (
    item_id SERIAL PRIMARY KEY,
    item_name TEXT NOT NULL
);

-- 2. Insert rows and inspect generated IDs
INSERT INTO serial_demo (item_name) VALUES ('Keyboard'), ('Mouse'), ('Monitor');

SELECT * FROM serial_demo;


-- 3. INSPECT AUTOMATICALLY CREATED SEQUENCE
SELECT 
    sequence_name, 
    start_value, 
    last_value 
FROM 
    information_schema.sequences 
WHERE 
    sequence_name = 'serial_demo_item_id_seq';


-- 4. DEMONSTRATE SEQUENCE GAPS ON ROLLED-BACK TRANSACTIONS
BEGIN;
INSERT INTO serial_demo (item_name) VALUES ('Temporary Item'); -- Consumes ID 4
ROLLBACK; -- Transaction aborted!

-- Insert another item
INSERT INTO serial_demo (item_name) VALUES ('Headphones'); -- Consumes ID 5!

SELECT * FROM serial_demo;
-- Notice how item_id jumps from 3 straight to 5 due to the rolled-back ID 4.
