-- ========================================================
-- Topic: Right Joins
-- DATABASE: trainings
-- ========================================================

-- 1. RIGHT JOIN Example
-- Returns all departments (including HR, which has no employees).
-- Employees without departments (Diana) are dropped.
SELECT e.name, d.dept_name 
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

-- 2. Equivalent LEFT JOIN (Preferred in industry)
SELECT e.name, d.dept_name 
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id;

