-- ==========================================
-- PostgreSQL Sequences Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test explicit sequence creation, setval, and increment steps.
-- ==========================================

-- 1. CREATE A CUSTOM SEQUENCE THAT INCREMENTS BY 5
DROP SEQUENCE IF EXISTS step_by_five_seq CASCADE;

CREATE SEQUENCE step_by_five_seq
    AS INTEGER
    START WITH 100
    INCREMENT BY 5
    MINVALUE 100
    MAXVALUE 1000;

-- 2. CALL SEQUENCE FUNCTIONS
SELECT nextval('step_by_five_seq'); -- Returns 100
SELECT nextval('step_by_five_seq'); -- Returns 105
SELECT currval('step_by_five_seq'); -- Returns 105


-- 3. RESET SEQUENCE VALUE USING SETVAL()
-- Set current value to 500
SELECT setval('step_by_five_seq', 500);
SELECT nextval('step_by_five_seq'); -- Returns 505


-- 4. SHARED SEQUENCE ACROSS MULTIPLE TABLES
DROP TABLE IF EXISTS online_orders;
DROP TABLE IF EXISTS phone_orders;

CREATE TABLE online_orders (
    order_id INT DEFAULT nextval('step_by_five_seq') PRIMARY KEY,
    customer TEXT
);

CREATE TABLE phone_orders (
    order_id INT DEFAULT nextval('step_by_five_seq') PRIMARY KEY,
    customer TEXT
);

INSERT INTO online_orders (customer) VALUES ('Alice');
INSERT INTO phone_orders (customer) VALUES ('Bob');

SELECT * FROM online_orders;
SELECT * FROM phone_orders;
