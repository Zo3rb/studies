-- ==========================================
-- PostgreSQL Domain Types Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test domain creation, constraints, and table usage.
-- ==========================================

-- 1. DROP EXISTING TEST OBJECTS
DROP TABLE IF EXISTS customer_profiles;
DROP DOMAIN IF EXISTS email_style CASCADE;
DROP DOMAIN IF EXISTS positive_price CASCADE;


-- 2. CREATE CUSTOM DOMAINS
-- Domain 1: Positive monetary price
CREATE DOMAIN positive_price AS NUMERIC(10, 2)
    CONSTRAINT check_must_be_positive CHECK (VALUE > 0.0);

-- Domain 2: Valid email string pattern using POSIX regex (~)
CREATE DOMAIN email_style AS TEXT
    CONSTRAINT check_email_format CHECK (VALUE ~* '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');


-- 3. CREATE TABLE USING THE CUSTOM DOMAIN TYPES
CREATE TABLE customer_profiles (
    customer_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    email email_style NOT NULL,
    account_balance positive_price NOT NULL
);


-- 4. INSERT VALID DATA
INSERT INTO customer_profiles (username, email, account_balance) VALUES 
('alice_w', 'alice@example.com', 150.00),
('bob_d', 'bob.dev@company.org', 29.99);

SELECT * FROM customer_profiles;


-- 5. TEST DOMAIN CONSTRAINT VIOLATIONS (Run each to see error)

-- Invalid Email Format Violation
INSERT INTO customer_profiles (username, email, account_balance) VALUES 
('invalid_user', 'not_an_email_address', 100.00);
-- ERROR: value for domain email_style violates check constraint "check_email_format"

-- Non-positive Balance Violation
INSERT INTO customer_profiles (username, email, account_balance) VALUES 
('negative_user', 'user@domain.com', -50.00);
-- ERROR: value for domain positive_price violates check constraint "check_must_be_positive"
