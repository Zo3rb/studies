-- ========================================================
-- Topic: Dealing with NULLs
-- DATABASE: trainings
-- ========================================================

-- 1. Setup a simple table for testing
CREATE TABLE demo_04_dealing_with_nulls (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(20),
    price NUMERIC(10, 2)
);

-- 2. Insert dummy data
INSERT INTO demo_04_dealing_with_nulls (name, category, price) VALUES
('Item A', 'Tech', 100.00),
('Item B', 'Tech', 150.00),
('Item C', 'Home', 50.00),
('Item D', NULL, 20.00);

-- 3. Run queries to test Dealing with NULLs concepts
SELECT * FROM demo_04_dealing_with_nulls;

-- 4. Cleanup
DROP TABLE demo_04_dealing_with_nulls;
