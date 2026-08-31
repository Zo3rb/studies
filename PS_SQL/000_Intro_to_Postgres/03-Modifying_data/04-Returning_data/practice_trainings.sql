-- ========================================================
-- Topic: Returning Data
-- DATABASE: trainings
-- ========================================================

-- 1. Setup table
CREATE TABLE tasks (
    task_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(100),
    status VARCHAR(20) DEFAULT 'Pending'
);

-- 2. Insert and immediately get the generated ID back!
INSERT INTO tasks (title) 
VALUES ('Write Postgres Tutorial')
RETURNING task_id, status;

-- 3. Update and get the new state back
UPDATE tasks 
SET status = 'Complete' 
WHERE task_id = 1
RETURNING *;

