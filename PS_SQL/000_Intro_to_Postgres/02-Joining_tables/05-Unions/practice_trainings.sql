-- ========================================================
-- Topic: Unions
-- DATABASE: trainings
-- ========================================================

-- 1. Setup tables
CREATE TABLE contractors (name VARCHAR(50));
INSERT INTO contractors VALUES ('Alice'), ('Eve'), ('Frank');

-- 2. UNION (Removes duplicates -> Alice is in both employees and contractors)
SELECT name FROM employees
UNION
SELECT name FROM contractors;

-- 3. UNION ALL (Keeps duplicates -> Alice appears twice, faster execution)
SELECT name FROM employees
UNION ALL
SELECT name FROM contractors;

