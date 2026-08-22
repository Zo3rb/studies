-- ========================================================
-- Topic: Dealing with NULLs
-- DATABASE: trainings
-- ========================================================

-- 1. Create a table with optional (nullable) columns
CREATE TABLE IF NOT EXISTS employee_bonus (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary NUMERIC,
    bonus NUMERIC -- Can be NULL
);

INSERT INTO employee_bonus (emp_id, name, salary, bonus) VALUES
(1, 'Alice', 50000, 5000),
(2, 'Bob', 60000, NULL),
(3, 'Charlie', 55000, 0);

-- 2. Wrong way to check for NULL (Returns nothing!)
SELECT * FROM employee_bonus WHERE bonus = NULL;

-- 3. Correct way: IS NULL
SELECT * FROM employee_bonus WHERE bonus IS NULL;

-- 4. Using COALESCE to provide a default value of 0 for math
-- Total Compensation = Salary + Bonus
SELECT 
    name, 
    salary, 
    COALESCE(bonus, 0) AS actual_bonus,
    (salary + COALESCE(bonus, 0)) AS total_compensation
FROM employee_bonus;
