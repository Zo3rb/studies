-- ==========================================
-- PostgreSQL Arrays Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test array operations, indexing, and unnest().
-- ==========================================

-- 1. Create a table with array columns
DROP TABLE IF EXISTS developer_profiles;

CREATE TABLE developer_profiles (
    dev_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    skills TEXT[] NOT NULL,
    test_scores INT[]
);

-- 2. Insert array data
INSERT INTO developer_profiles (name, skills, test_scores) VALUES 
('Alice', ARRAY['Python', 'PostgreSQL', 'Docker'], ARRAY[95, 88, 92]),
('Bob', ARRAY['JavaScript', 'React', 'Node'], ARRAY[80, 85]),
('Charlie', ARRAY['Python', 'PyTorch', 'SQL'], ARRAY[99, 94, 98]);

SELECT * FROM developer_profiles;


-- 3. TEST 1-BASED INDEXING
-- Remember: skills[1] gets the first element!
SELECT 
    name, 
    skills[1] AS primary_skill,
    test_scores[2] AS second_score
FROM 
    developer_profiles;


-- 4. SEARCH USING ANY() AND CONTAINS (@>)
-- Find all developers who know 'Python':
SELECT name, skills FROM developer_profiles WHERE 'Python' = ANY(skills);

-- Find developers whose skills contain both 'Python' and 'SQL':
SELECT name, skills FROM developer_profiles WHERE skills @> ARRAY['Python', 'SQL'];


-- 5. UNNEST ARRAYS INTO ROWS
-- Transform the skills array of each developer into individual table rows:
SELECT 
    dev_id,
    name,
    unnest(skills) AS skill_name
FROM 
    developer_profiles;
