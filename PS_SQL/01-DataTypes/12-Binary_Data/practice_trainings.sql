-- ==========================================
-- PostgreSQL Binary Data (BYTEA) Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test BYTEA storage, hex formats, and Base64 conversion.
-- ==========================================

-- 1. Create a table to store binary attachments
DROP TABLE IF EXISTS binary_storage;

CREATE TABLE binary_storage (
    file_id SERIAL PRIMARY KEY,
    filename TEXT NOT NULL,
    raw_content BYTEA NOT NULL
);

-- 2. Insert binary data using hex literal format (\x)
-- \x504753514c is the hex representation for ASCII string 'PGSQL'
INSERT INTO binary_storage (filename, raw_content) VALUES 
('header_signature.bin', '\x504753514c'),
('plain_text_converted.bin', 'Database Binary Test'::bytea);

SELECT * FROM binary_storage;


-- 3. ENCODE AND DECODE EXPERIMENTS

-- Convert raw text to BYTEA, then encode as Base64 (Useful for API payloads)
SELECT 
    'Confidential AI Payload' AS original_text,
    'Confidential AI Payload'::bytea AS raw_bytea,
    encode('Confidential AI Payload'::bytea, 'base64') AS base64_encoded,
    encode('Confidential AI Payload'::bytea, 'hex') AS hex_encoded;


-- Decode Base64 string back into BYTEA, then convert back to text
SELECT 
    decode('Q29uZmlkZW50aWFsIEFJIFBheWxvYWQ=', 'base64') AS decoded_bytea,
    encode(decode('Q29uZmlkZW50aWFsIEFJIFBheWxvYWQ=', 'base64'), 'escape') AS decoded_text;


-- 4. BYTE LENGTH OPERATIONS
SELECT 
    filename,
    octet_length(raw_content) AS byte_size
FROM 
    binary_storage;
