-- ========================================================
-- Topic: Deleting Records
-- DATABASE: trainings
-- ========================================================

-- 1. Setup table
CREATE TABLE logs (
    log_id INT PRIMARY KEY,
    message VARCHAR(255),
    created_at DATE
);
INSERT INTO logs VALUES (1, 'System started', '2023-01-01'), (2, 'Error 500', '2023-02-15'), (3, 'System shutdown', '2023-06-10');

-- 2. Delete specific records
DELETE FROM logs
WHERE created_at < '2023-03-01';

-- 3. Delete and see what was deleted
DELETE FROM logs
WHERE log_id = 3
RETURNING *;

