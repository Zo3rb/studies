-- ========================================================
-- Topic: Updating Data
-- DATABASE: trainings
-- ========================================================

-- 1. Setup table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary NUMERIC,
    department VARCHAR(50)
);
INSERT INTO employees VALUES (1, 'Alice', 50000, 'Sales'), (2, 'Bob', 45000, 'Sales'), (3, 'Charlie', 60000, 'Engineering');

-- 2. Update a single record safely using the Primary Key
UPDATE employees
SET salary = 55000
WHERE emp_id = 1;

-- 3. Update multiple records based on a condition
UPDATE employees
SET salary = salary * 1.05 -- 5% raise
WHERE department = 'Sales';

-- 4. Verify updates
SELECT * FROM employees;

