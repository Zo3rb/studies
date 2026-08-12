-- ==========================================
-- PostgreSQL Casting Types Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test explicit conversions and syntax.
-- ==========================================

-- 1. COMPARE CASTING SYNTAX
SELECT 
    CAST('100' AS INTEGER) AS sql_standard_cast,
    '100'::INTEGER AS postgres_colon_cast;


-- 2. NUMERIC TO INTEGER ROUNDING
-- Notice how PostgreSQL rounds fractional values during a cast:
SELECT 
    12.4::INTEGER AS round_down,  -- Returns 12
    12.6::INTEGER AS round_up,    -- Returns 13
    12.5::INTEGER AS bankers_round, -- Returns 12 (PostgreSQL uses Round-to-Even)
    13.5::INTEGER AS round_even;    -- Returns 14 (Rounds 13.5 to the nearest even number, which is 14)


-- 3. BOOLEAN TO INTEGER CAST (Highly useful for AI/ML target/feature mapping)
-- Note: You cannot cast a boolean directly to an integer implicitly. You must cast it explicitly:
SELECT 
    true::boolean::integer AS true_as_int,   -- Returns 1
    false::boolean::integer AS false_as_int; -- Returns 0


-- 4. INVALID INPUT SYNTAX ERRORS
-- Run these one at a time to see the conversion failure output in DBeaver:

-- String has a decimal, so it cannot be directly cast to an integer:
SELECT '12.34'::INTEGER;
-- ERROR: invalid input syntax for type integer: "12.34"
-- To resolve, cast it to numeric first, then to integer:
SELECT '12.34'::NUMERIC::INTEGER; -- Returns 12

-- Non-numeric string to integer:
SELECT 'abc'::INTEGER;
-- ERROR: invalid input syntax for type integer: "abc"
