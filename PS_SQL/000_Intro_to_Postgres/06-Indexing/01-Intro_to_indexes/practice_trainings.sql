-- ====================================================
-- Practice Trainings: Introduction to Database Indexes
-- ====================================================

-- 1. Create a sandbox telemetry table with 100,000 rows
DROP TABLE IF EXISTS sensor_logs;
CREATE TABLE sensor_logs (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    device_id INT NOT NULL,
    temperature NUMERIC(5,2) NOT NULL,
    recorded_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Populate table with mock data
INSERT INTO sensor_logs (device_id, temperature, recorded_at)
SELECT 
    (random() * 500)::INT + 1,
    (random() * 40 + 10)::NUMERIC(5,2),
    CURRENT_TIMESTAMP - (random() * 365 || ' days')::INTERVAL
FROM generate_series(1, 100000);

-- 2. Test query performance BEFORE index (Sequential Scan)
EXPLAIN ANALYZE
SELECT * FROM sensor_logs WHERE device_id = 250;

-- 3. Create single-column B-Tree index
CREATE INDEX idx_sensor_logs_device_id ON sensor_logs (device_id);

-- 4. Test query performance AFTER index (Index Scan)
EXPLAIN ANALYZE
SELECT * FROM sensor_logs WHERE device_id = 250;
