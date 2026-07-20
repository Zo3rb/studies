-- ==========================================
-- PostgreSQL NUMERIC Type Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test exact decimal storage behavior.
-- ==========================================
-- 1. Create a table with different NUMERIC specifications
DROP TABLE IF EXISTS numeric_practice;
CREATE TABLE numeric_practice (
    record_id SERIAL PRIMARY KEY,
    fixed_price NUMERIC(6, 2),
    -- Max: 9999.99, Min: -9999.99
    integer_only NUMERIC(4),
    -- Scale is 0. Max: 9999, Min: -9999
    unconstrained_num NUMERIC -- No limits (PostgreSQL special)
);
-- 2. Insert valid data
INSERT INTO numeric_practice (fixed_price, integer_only, unconstrained_num)
VALUES (1234.56, 9999, 12345678901234567890.123456789);
SELECT *
FROM numeric_practice;
-- 3. TEST AUTO-ROUNDING (Scale behavior)
-- Let's insert a value with 4 decimal places into fixed_price (scale is 2)
INSERT INTO numeric_practice (fixed_price)
VALUES (12.3456);
-- Let's query and see what got saved
SELECT fixed_price
FROM numeric_practice
WHERE fixed_price = 12.35;
-- Result: Stored as 12.35 (auto-rounded to scale of 2, no error raised)
-- 4. TEST PRECISION OVERFLOW (Whole-number limit)
-- Let's try to insert 10000.00 into fixed_price (6, 2)
-- 10000.00 requires 5 digits before the decimal point, but (6, 2) only allows 4 (6 - 2 = 4)
-- Run this and check the error:
INSERT INTO numeric_practice (fixed_price)
VALUES (10000.00);
-- ERROR: numeric field overflow
-- Try to insert 10000 into integer_only (4, 0)
INSERT INTO numeric_practice (integer_only)
VALUES (10000);
-- ERROR: numeric field overflow
-- 5. COMPARE CONSTRAINED VS UNCONSTRAINED BEHAVIOR
-- The unconstrained_num column can store anything
INSERT INTO numeric_practice (unconstrained_num)
VALUES (0.0000000000000000000000000000001),
    (9999999999999999999999999999999);
SELECT unconstrained_num
FROM numeric_practice;