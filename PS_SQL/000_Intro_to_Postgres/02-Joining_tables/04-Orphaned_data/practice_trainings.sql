-- ========================================================
-- Topic: Orphaned Data
-- DATABASE: trainings
-- ========================================================

-- 1. Find departments that have NO employees (Anti-Join)
SELECT d.dept_name 
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

-- 2. Find employees that have NO department (Orphaned/Unassigned)
SELECT e.name 
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

