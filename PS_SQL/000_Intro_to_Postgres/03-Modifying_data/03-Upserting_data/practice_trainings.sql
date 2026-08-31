-- ========================================================
-- Topic: Upserting Data
-- DATABASE: trainings
-- ========================================================

-- 1. Setup table with a UNIQUE constraint
CREATE TABLE user_logins (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    login_count INT DEFAULT 1,
    last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO user_logins (user_id, username) VALUES (1, 'alice123');

-- 2. Standard Insert (Will fail because alice123 exists)
-- INSERT INTO user_logins (user_id, username) VALUES (1, 'alice123'); -- ERROR

-- 3. Upsert: Insert, but on conflict, update the login count instead!
INSERT INTO user_logins (user_id, username) 
VALUES (1, 'alice123')
ON CONFLICT (user_id) 
DO UPDATE SET 
    login_count = user_logins.login_count + 1,
    last_login = CURRENT_TIMESTAMP;

-- 4. Verify the upsert worked
SELECT * FROM user_logins;

