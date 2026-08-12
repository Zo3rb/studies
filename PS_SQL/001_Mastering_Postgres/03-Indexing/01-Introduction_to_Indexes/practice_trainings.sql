-- ========================================================
-- LESSON 01: Introduction to Indexes
-- DATABASE: trainings
-- ========================================================

-- 1. Create a sample table to demonstrate the need for indexing
CREATE TABLE employee_directory (
    employee_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    department VARCHAR(50),
    hire_date DATE
);

-- Note: The PRIMARY KEY and UNIQUE constraint automatically create indexes!
-- Let's check existing indexes on this table using the system catalog:
SELECT 
    indexname, 
    indexdef 
FROM pg_indexes 
WHERE tablename = 'employee_directory';

-- 2. Insert dummy data (In a real scenario, you'd insert millions of rows to see performance)
INSERT INTO employee_directory (first_name, last_name, email, department, hire_date)
VALUES 
('Alice', 'Smith', 'alice.smith@example.com', 'Engineering', '2020-01-15'),
('Bob', 'Johnson', 'bob.johnson@example.com', 'HR', '2019-03-10'),
('Charlie', 'Brown', 'charlie.brown@example.com', 'Sales', '2021-07-22'),
('Diana', 'Prince', 'diana.prince@example.com', 'Engineering', '2018-11-01');

-- 3. Querying without a specific index (Sequential Scan)
-- Using EXPLAIN to see how Postgres plans to execute this query
EXPLAIN SELECT * FROM employee_directory WHERE department = 'Engineering';

-- 4. Create an index on the 'department' column
CREATE INDEX idx_employee_department ON employee_directory(department);

-- 5. Querying with the new index
-- Notice if Postgres uses an Index Scan (if table is too small, it might still choose Seq Scan!)
EXPLAIN SELECT * FROM employee_directory WHERE department = 'Engineering';

-- 6. Cleanup
DROP INDEX idx_employee_department;
DROP TABLE employee_directory;
