-- ========================================================
-- Topic: Updating JSON
-- DATABASE: trainings
-- ========================================================

-- 1. Setup table
CREATE TABLE settings (
    user_id INT PRIMARY KEY,
    config JSONB
);

INSERT INTO settings VALUES (1, '{"theme": "light", "version": 1, "features": {"beta": false}}');

-- 2. Use jsonb_set in an UPDATE statement
-- Let's change the theme from light to dark.
-- Notice we cast '"dark"' to ::jsonb. If we just used 'dark', Postgres would think it's invalid JSON.
UPDATE settings
SET config = jsonb_set(config, '{theme}', '"dark"'::jsonb)
WHERE user_id = 1;

-- 3. Updating a deeply nested key
UPDATE settings
SET config = jsonb_set(config, '{features, beta}', 'true'::jsonb)
WHERE user_id = 1;

-- 4. Verify updates
SELECT * FROM settings;

