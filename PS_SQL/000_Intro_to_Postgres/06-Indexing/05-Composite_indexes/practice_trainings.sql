-- ====================================================
-- Practice Trainings: Composite Indexes
-- ====================================================

-- 1. Create orders table for multi-column indexing
DROP TABLE IF EXISTS composite_orders;
CREATE TABLE composite_orders (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    store_id INT NOT NULL,
    status TEXT NOT NULL,
    order_date TIMESTAMPTZ NOT NULL,
    total_amount NUMERIC(10,2) NOT NULL
);

INSERT INTO composite_orders (store_id, status, order_date, total_amount)
SELECT 
    (random() * 10)::INT + 1,
    CASE WHEN i % 3 = 0 THEN 'completed' ELSE 'pending' END,
    CURRENT_TIMESTAMP - (random() * 100 || ' days')::INTERVAL,
    (random() * 200 + 10)::NUMERIC(10,2)
FROM generate_series(1, 50000) i;

-- 2. Add Composite Index (Equality: store_id, status | Range: order_date)
CREATE INDEX idx_comp_orders_store_status_date 
ON composite_orders (store_id, status, order_date);

-- 3. Query leveraging left-prefix rule
EXPLAIN ANALYZE
SELECT * FROM composite_orders
WHERE store_id = 5 AND status = 'completed' AND order_date >= NOW() - INTERVAL '30 days';

-- 4. Test Index-Only Scan using INCLUDE clause
CREATE INDEX idx_comp_covering 
ON composite_orders (store_id) INCLUDE (total_amount);

EXPLAIN ANALYZE
SELECT store_id, total_amount FROM composite_orders WHERE store_id = 2;
