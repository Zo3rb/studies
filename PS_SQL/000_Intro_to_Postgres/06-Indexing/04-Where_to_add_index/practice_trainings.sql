-- ====================================================
-- Practice Trainings: Where to Add an Index
-- ====================================================

-- 1. Create dataset with high vs low cardinality columns
DROP TABLE IF EXISTS account_users;
CREATE TABLE account_users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email TEXT NOT NULL,
    status TEXT NOT NULL,
    country_code CHAR(2) NOT NULL
);

-- Insert 100,000 users (High cardinality email, Low cardinality status)
INSERT INTO account_users (email, status, country_code)
SELECT 
    'user_' || i || '@example.com',
    CASE WHEN i % 100 = 0 THEN 'pending' ELSE 'active' END,
    CASE WHEN i % 2 = 0 THEN 'US' ELSE 'CA' END
FROM generate_series(1, 100000) i;

-- 2. Test High Selectivity filter (email) -> Ideal B-Tree candidate
CREATE INDEX idx_account_users_email ON account_users (email);

EXPLAIN ANALYZE
SELECT * FROM account_users WHERE email = 'user_5000@example.com';

-- 3. Test Partial Index for low-cardinality subset (pending status)
CREATE INDEX idx_account_users_pending ON account_users (id) WHERE status = 'pending';

EXPLAIN ANALYZE
SELECT * FROM account_users WHERE status = 'pending';
