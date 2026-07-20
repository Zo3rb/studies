-- ==========================================
-- PostgreSQL Check Constraints Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test database integrity rules.
-- ==========================================

-- 1. Create a table with column-level and table-level checks
DROP TABLE IF EXISTS employee_contracts;

CREATE TABLE employee_contracts (
    contract_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    age INT CONSTRAINT check_legal_age CHECK (age >= 18),
    salary NUMERIC(10, 2) CONSTRAINT check_positive_salary CHECK (salary > 0),
    start_date DATE NOT NULL,
    end_date DATE,
    
    -- Table-level constraint (references multiple columns)
    CONSTRAINT check_contract_dates CHECK (end_date > start_date)
);

-- 2. Insert valid data
INSERT INTO employee_contracts (employee_name, age, salary, start_date, end_date) VALUES 
('Alice Smith', 28, 75000.00, '2026-01-01', '2027-01-01'),
('Bob Jones', 45, 90000.00, '2026-06-01', NULL); -- Null end_date is valid

SELECT * FROM employee_contracts;


-- 3. TEST COLUMN-LEVEL CHECK VIOLATION
-- Attempt to insert an employee under 18
-- Run this and check the exact constraint name in the error message:
INSERT INTO employee_contracts (employee_name, age, salary, start_date, end_date) VALUES 
('Charlie Young', 17, 45000.00, '2026-07-01', '2027-07-01');
-- ERROR: new row for relation "employee_contracts" violates check constraint "check_legal_age"


-- 4. TEST TABLE-LEVEL CHECK VIOLATION
-- Attempt to insert a contract where end_date is before start_date
INSERT INTO employee_contracts (employee_name, age, salary, start_date, end_date) VALUES 
('David Retro', 30, 60000.00, '2026-12-01', '2026-11-01');
-- ERROR: new row for relation "employee_contracts" violates check constraint "check_contract_dates"


-- 5. TEST THE NULL BYPASS
-- Insert a row where age is NULL
-- Age is CHECK (age >= 18). Since age is NULL, the check constraint evaluates to UNKNOWN (passes).
INSERT INTO employee_contracts (employee_name, age, salary, start_date, end_date) VALUES 
('Eva Mystery', NULL, 50000.00, '2026-08-01', '2027-08-01');

SELECT * FROM employee_contracts WHERE employee_name = 'Eva Mystery';
-- Note: It successfully inserted the record even though we don't know if Eva is over 18!
-- To fix this, a "NOT NULL" constraint is required on the column.
