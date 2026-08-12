-- ==========================================
-- PostgreSQL Character Types Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test space padding, limits, and behaviors.
-- ==========================================

-- 1. Create a table comparing text types
DROP TABLE IF EXISTS char_sandbox;

CREATE TABLE char_sandbox (
    id SERIAL PRIMARY KEY,
    fixed_char CHAR(10),
    variable_varchar VARCHAR(10),
    free_text TEXT
);

-- 2. Insert strings shorter than 10 characters
INSERT INTO char_sandbox (fixed_char, variable_varchar, free_text) VALUES 
('Postgres', 'Postgres', 'Postgres');

SELECT * FROM char_sandbox;


-- 3. INSPECT PADDING AND CHARACTER LENGTH
-- Check how characters are represented and check their raw byte lengths (octet_length)
SELECT 
    fixed_char,
    variable_varchar,
    
    -- length() counts characters, but PostgreSQL trims padding spaces on CHAR during length() checks:
    length(fixed_char) AS char_len_trimmed,               -- Returns 8
    length(variable_varchar) AS varchar_len,              -- Returns 8
    
    -- Concatenating with delimiters shows the true storage padding for CHAR:
    fixed_char || '|' AS char_padded_view,                -- Returns 'Postgres  |' (padded with 2 spaces)
    variable_varchar || '|' AS varchar_view,              -- Returns 'Postgres|'
    
    -- Check raw bytes in storage:
    octet_length(fixed_char) AS char_bytes,               -- Returns 10 (always uses 10 bytes)
    octet_length(variable_varchar) AS varchar_bytes       -- Returns 8 (uses 8 bytes + 1-4 bytes overhead)
FROM 
    char_sandbox;


-- 4. TEST LENGTH CONSTRAINTS (INSERT OVER LIMIT)
-- Try inserting an 11-character string into the 10-character limits:
INSERT INTO char_sandbox (variable_varchar) VALUES ('PostgresRocks');
-- ERROR: value too long for type character varying(10)


-- 5. UNCONSTRAINED VARCHAR
-- Demonstrating that VARCHAR without a limit works like TEXT:
DROP TABLE IF EXISTS varchar_unconstrained;
CREATE TABLE varchar_unconstrained (
    unlimited_varchar VARCHAR
);

INSERT INTO varchar_unconstrained VALUES ('This is a very long string that would fail in a constrained varchar column but works fine here!');
SELECT * FROM varchar_unconstrained;
