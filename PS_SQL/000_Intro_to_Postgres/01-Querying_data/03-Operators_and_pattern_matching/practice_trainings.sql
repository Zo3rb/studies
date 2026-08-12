-- ========================================================
-- Topic: Operators and pattern matching
-- DATABASE: trainings
-- ========================================================

-- 1. Setup a simple table for testing
CREATE TABLE demo_03_operators_and_pattern_matching (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(20),
    price NUMERIC(10, 2)
);

-- 2. Insert dummy data
INSERT INTO demo_03_operators_and_pattern_matching (name, category, price) VALUES
('Item A', 'Tech', 100.00),
('Item B', 'Tech', 150.00),
('Item C', 'Home', 50.00),
('Item D', NULL, 20.00);

-- 3. Run queries to test Operators and pattern matching concepts
SELECT * FROM demo_03_operators_and_pattern_matching;

-- 4. Cleanup
DROP TABLE demo_03_operators_and_pattern_matching;
