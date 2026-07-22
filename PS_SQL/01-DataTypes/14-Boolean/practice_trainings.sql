-- ==========================================
-- PostgreSQL BOOLEAN Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test boolean parsing, 3-valued logic, and predicates.
-- ==========================================

-- 1. Create a table with boolean columns
DROP TABLE IF EXISTS user_settings;

CREATE TABLE user_settings (
    user_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    email_verified BOOLEAN DEFAULT FALSE,
    opted_in_marketing BOOLEAN
);

-- 2. Insert rows using different valid literal representations
INSERT INTO user_settings (username, is_active, email_verified, opted_in_marketing) VALUES 
('alice', 'yes', '1', 't'),
('bob', 'no', '0', 'f'),
('charlie', 'true', 'false', NULL); -- NULL means unknown

SELECT * FROM user_settings;


-- 3. TEST 3-VALUED LOGIC (AND / OR with NULL)
SELECT 
    TRUE AND NULL AS true_and_null,    -- Returns NULL
    FALSE AND NULL AS false_and_null,  -- Returns FALSE (Short-circuit!)
    TRUE OR NULL AS true_or_null,      -- Returns TRUE (Short-circuit!)
    FALSE OR NULL AS false_or_null;    -- Returns NULL


-- 4. USING BOOLEAN PREDICATES (IS TRUE / IS FALSE / IS UNKNOWN)
SELECT 
    username, 
    opted_in_marketing,
    opted_in_marketing IS TRUE AS is_true_check,
    opted_in_marketing IS UNKNOWN AS is_unknown_check
FROM 
    user_settings;
