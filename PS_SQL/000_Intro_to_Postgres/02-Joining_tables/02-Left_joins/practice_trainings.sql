-- ========================================================
-- Topic: Left Joins
-- DATABASE: trainings
-- ========================================================

-- 1. Reusing tables from previous lesson... 
-- Let's add an employee with NO department.
INSERT INTO employees (emp_id, name, dept_id) VALUES (104, 'Diana', NULL);

-- 2. LEFT JOIN Example
-- Returns all employees. Diana will have a NULL dept_name.
SELECT e.name, d.dept_name 
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

