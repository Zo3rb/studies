-- ==========================================
-- PostgreSQL Storing Money Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to compare money, numeric, and cent-based designs.
-- ==========================================

-- 1. Create a table comparing financial storage approaches
DROP TABLE IF EXISTS billing_comparison;

CREATE TABLE billing_comparison (
    billing_id SERIAL PRIMARY KEY,
    native_money MONEY,
    numeric_money NUMERIC(12, 2),
    cents_integer INT
);

-- 2. Insert matching financial amounts ($154.50)
INSERT INTO billing_comparison (native_money, numeric_money, cents_integer) VALUES 
('$154.50', 154.50, 15450),
(154.50, 154.50, 15450); -- Inserting float/numeric into MONEY works too

SELECT * FROM billing_comparison;
-- Note the formatting of 'native_money' in your DBeaver output grid.


-- 3. FINANCIAL CALCULATIONS & CASTING ERRORS
-- Native MONEY can be picky. Let's try some calculations:

-- multiplying MONEY by integer works:
SELECT native_money * 2 AS double_money FROM billing_comparison;

-- Attempting to divide MONEY by MONEY (gives ratio, which is double precision)
SELECT native_money / '$10.00'::money AS ratio FROM billing_comparison;

-- Try to query values or cast
-- Cast native_money to numeric to allow flexible decimal operations:
SELECT 
    native_money,
    native_money::numeric AS money_cast_to_numeric,
    cents_integer / 100.0 AS cents_converted_to_dollars
FROM 
    billing_comparison;
