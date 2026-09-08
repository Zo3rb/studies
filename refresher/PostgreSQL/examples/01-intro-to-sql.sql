-- ============================================================================
-- PG4E Week 1: Single Table SQL Examples (01-Intro-to-SQL)
-- Author: Refresher Track (PG4E Coursework)
-- ============================================================================

-- 1. Environment Setup & Table Definition
-- Drop table if it exists to ensure idempotent execution
DROP TABLE IF EXISTS users;

-- Create single table with PK and data type constraints
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(128) NOT NULL,
    email VARCHAR(128) UNIQUE NOT NULL,
    age INT CHECK (age >= 0),
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Expected Output:
-- CREATE TABLE

-- ============================================================================
-- 2. Data Manipulation Language (DML) - INSERT
-- ============================================================================

INSERT INTO users (name, email, age) 
VALUES 
    ('Charles Severance', 'csev@umich.edu', 45),
    ('Colleen van Lent', 'cvan@umich.edu', 40),
    ('Sally Student', 'sally@example.com', 21),
    ('Bob Miller', 'bob@example.com', 30);

-- Expected Output:
-- INSERT 0 4

-- ============================================================================
-- 3. Data Query Language (DQL) - SELECT & Filtering
-- ============================================================================

-- A. Basic Projection and Selection
SELECT id, name, email, age 
FROM users 
WHERE age >= 30 
ORDER BY id ASC;

-- Expected Output Table:
--  id |       name        |     email      | age 
-- ----+-------------------+----------------+-----
--   1 | Charles Severance | csev@umich.edu |  45
--   2 | Colleen van Lent  | cvan@umich.edu |  40
--   4 | Bob Miller        | bob@example.com|  30

-- B. Pattern Matching (LIKE / ILIKE)
SELECT id, name, email 
FROM users 
WHERE email LIKE '%@umich.edu' 
ORDER BY name;

-- Expected Output Table:
--  id |       name        |     email      
-- ----+-------------------+----------------
--   1 | Charles Severance | csev@umich.edu
--   2 | Colleen van Lent  | cvan@umich.edu

-- ============================================================================
-- 4. DML - UPDATE Operations
-- ============================================================================

-- Update name and age for a specific user ID
UPDATE users 
SET name = 'Dr. Chuck', age = 46 
WHERE email = 'csev@umich.edu';

-- Expected Output:
-- UPDATE 1

-- Verify Update
SELECT id, name, email, age FROM users WHERE email = 'csev@umich.edu';

-- Expected Output Table:
--  id |   name    |     email      | age 
-- ----+-----------+----------------+-----
--   1 | Dr. Chuck | csev@umich.edu |  46

-- ============================================================================
-- 5. DML - DELETE Operations
-- ============================================================================

-- Delete a specific user row by email
DELETE FROM users 
WHERE email = 'bob@example.com';

-- Expected Output:
-- DELETE 1

-- Verify Count After Delete
SELECT COUNT(*) AS total_users FROM users;

-- Expected Output Table:
--  total_users 
-- -------------
--            3

-- ============================================================================
-- 6. Three-Valued Logic (3VL) & NULL Checks
-- ============================================================================

-- Insert row with NULL age
INSERT INTO users (name, email, age) VALUES ('Unknown User', 'unknown@example.com', NULL);

-- Demonstrating IS NULL vs = NULL
SELECT id, name FROM users WHERE age IS NULL;

-- Expected Output Table:
--  id |     name     
-- ----+--------------
--   5 | Unknown User
