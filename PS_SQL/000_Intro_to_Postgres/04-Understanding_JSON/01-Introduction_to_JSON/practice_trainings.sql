-- ========================================================
-- Topic: Introduction to JSON
-- DATABASE: trainings
-- ========================================================

-- 1. Setup tables to compare JSON and JSONB
CREATE TABLE api_payloads_text (id INT, payload JSON);
CREATE TABLE api_payloads_binary (id INT, payload JSONB);

-- 2. Insert the same data (Notice the whitespace and duplicate key)
INSERT INTO api_payloads_text VALUES (1, '{"status": "ok", "retries": 3, "retries": 5,   "data": [1, 2, 3]}');
INSERT INTO api_payloads_binary VALUES (1, '{"status": "ok", "retries": 3, "retries": 5,   "data": [1, 2, 3]}');

-- 3. Query the data to see how it was stored
SELECT * FROM api_payloads_text;
-- Output maintains the spaces and the duplicate "retries" key

SELECT * FROM api_payloads_binary;
-- Output strips spaces and keeps only "retries": 5.

-- Cleanup
DROP TABLE api_payloads_text;
DROP TABLE api_payloads_binary;

