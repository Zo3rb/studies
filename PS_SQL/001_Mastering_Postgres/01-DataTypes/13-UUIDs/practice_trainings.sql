-- ==========================================
-- PostgreSQL UUIDs Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test gen_random_uuid(), primary keys, and formatting.
-- ==========================================

-- 1. Create a table using UUID as the primary key
DROP TABLE IF EXISTS secure_accounts;

CREATE TABLE secure_accounts (
    account_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    account_name TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Insert rows without specifying account_id (Default triggers gen_random_uuid)
INSERT INTO secure_accounts (account_name) VALUES 
('Acme Corporation'),
('Stark Industries'),
('Wayne Enterprises');

SELECT * FROM secure_accounts;


-- 3. INSERTING SPECIFIC MANUAL UUID VALUES
INSERT INTO secure_accounts (account_id, account_name) VALUES 
('123e4567-e89b-12d3-a456-426614174000', 'Cyberdyne Systems');

SELECT * FROM secure_accounts WHERE account_id = '123e4567-e89b-12d3-a456-426614174000';


-- 4. INVALID UUID FORMAT ERROR
-- Attempting to insert an invalid hex string into a UUID column raises an error:
INSERT INTO secure_accounts (account_id, account_name) VALUES 
('not-a-valid-uuid-string', 'Faulty Account');
-- ERROR: invalid input syntax for type uuid: "not-a-valid-uuid-string"
