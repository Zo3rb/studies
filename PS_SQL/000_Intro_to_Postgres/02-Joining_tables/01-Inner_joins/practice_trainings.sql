-- ========================================================
-- Topic: Inner Joins
-- DATABASE: trainings
-- ========================================================

-- 1. Setup tables
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT REFERENCES departments(dept_id)
);

-- 2. Insert Data
INSERT INTO departments (dept_id, dept_name) VALUES (1, 'Sales'), (2, 'HR'), (3, 'Engineering');
INSERT INTO employees (emp_id, name, dept_id) VALUES (101, 'Alice', 1), (102, 'Bob', 1), (103, 'Charlie', 3);

-- 3. INNER JOIN Example
-- Only Alice, Bob, and Charlie are returned. HR has no employees, so it is dropped.
SELECT e.name, d.dept_name 
FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;

