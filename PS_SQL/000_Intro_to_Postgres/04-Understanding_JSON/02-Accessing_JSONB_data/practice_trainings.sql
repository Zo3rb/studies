-- ========================================================
-- Topic: Accessing JSONB Data
-- DATABASE: trainings
-- ========================================================
-- 1. Setup table
CREATE TABLE users (id INT PRIMARY KEY, metadata JSONB);
INSERT INTO users
VALUES (
        1,
        '{"name": "Alice", "preferences": {"theme": "dark", "notifications": true}, "tags": ["admin", "staff"]}'
    ),
    (
        2,
        '{"name": "Bob", "preferences": {"theme": "light", "notifications": false}, "tags": ["user"]}'
    );
-- 2. Extract a top-level key as TEXT (->>)
SELECT metadata->>'name' AS user_name
FROM users;
-- 3. Chaining operators to get nested values
-- Note: -> returns JSONB, so we can chain -> again. The final operator is ->> to return text.
SELECT metadata->>'name' AS user_name,
    metadata->'preferences'->>'theme' AS theme
FROM users;
-- 4. Filtering using JSONB values
SELECT metadata->>'name' AS user_name
FROM users
WHERE metadata->'preferences'->>'theme' = 'dark';
-- 5. Extracting from a JSON array using an index (0-indexed)
SELECT metadata->'tags'->>0 AS primary_tag
FROM users;