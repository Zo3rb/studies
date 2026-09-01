-- ========================================================
-- Topic: Generated Columns from JSON
-- DATABASE: trainings
-- ========================================================

-- 1. Create a table with a JSONB payload and a Generated Column
CREATE TABLE events (
    event_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    payload JSONB,
    -- We extract the 'event_type' directly from the JSON payload.
    -- We must cast it to a standard type (VARCHAR) for the column.
    event_type VARCHAR(50) GENERATED ALWAYS AS (payload->>'type') STORED
);

-- 2. Insert data (We only provide the payload, Postgres handles the generated column!)
INSERT INTO events (payload) VALUES 
('{"type": "login", "user_id": 45, "ip": "192.168.1.1"}'),
('{"type": "purchase", "amount": 99.99, "currency": "USD"}'),
('{"type": "logout", "user_id": 45}');

-- 3. Verify the generated column was populated
SELECT event_id, event_type, payload
FROM events;

-- 4. Now we can index the generated column for fast lookups!
CREATE INDEX idx_events_type ON events(event_type);

-- 5. Query using the generated column
EXPLAIN ANALYZE 
SELECT * FROM events WHERE event_type = 'purchase';

