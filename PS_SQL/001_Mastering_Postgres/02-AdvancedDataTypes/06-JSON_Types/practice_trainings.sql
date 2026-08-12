-- ==========================================
-- PostgreSQL JSON Types Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test JSONB operators, containment, and updating fields.
-- ==========================================

-- 1. Create a table with a JSONB document column
DROP TABLE IF EXISTS event_payloads;

CREATE TABLE event_payloads (
    event_id SERIAL PRIMARY KEY,
    event_name TEXT NOT NULL,
    metadata JSONB NOT NULL
);

-- 2. Insert nested JSON documents
INSERT INTO event_payloads (event_name, metadata) VALUES 
('User Registration', '{"user": {"name": "Alice", "age": 28, "email": "alice@example.com"}, "tags": ["mobile", "beta"]}'),
('Order Checkout', '{"order": {"id": 1001, "total": 149.99}, "status": "completed", "tags": ["web", "promo"]}');

SELECT * FROM event_payloads;


-- 3. QUERY NESTED FIELDS USING -> AND ->> OPERATORS
SELECT 
    event_name,
    metadata -> 'user' AS user_json_object,          -- Returns JSONB
    metadata -> 'user' ->> 'name' AS user_name_text,  -- Returns TEXT
    metadata #>> '{order, total}' AS order_total_text -- Path extraction
FROM 
    event_payloads;


-- 4. FILTER USING CONTAINMENT OPERATOR (@>)
-- Find all events that contain the tag "mobile":
SELECT 
    event_name, 
    metadata 
FROM 
    event_payloads 
WHERE 
    metadata @> '{"tags": ["mobile"]}';


-- 5. UPDATE A NESTED JSON FIELD USING jsonb_set()
UPDATE event_payloads
SET metadata = jsonb_set(metadata, '{status}', '"shipped"')
WHERE event_name = 'Order Checkout';

SELECT event_name, metadata FROM event_payloads WHERE event_name = 'Order Checkout';
