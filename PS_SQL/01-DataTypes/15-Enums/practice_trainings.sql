-- ==========================================
-- PostgreSQL ENUMs Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test ENUM creation, invalid input errors, and ordering.
-- ==========================================

-- 1. DROP EXISTING TEST OBJECTS
DROP TABLE IF EXISTS orders;
DROP TYPE IF EXISTS order_status CASCADE;

-- 2. CREATE A CUSTOM ENUM TYPE
CREATE TYPE order_status AS ENUM (
    'pending', 
    'processing', 
    'shipped', 
    'delivered', 
    'cancelled'
);

-- 3. CREATE A TABLE USING THE ENUM
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_name TEXT NOT NULL,
    status order_status DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. INSERT VALID ROWS
INSERT INTO orders (customer_name, status) VALUES 
('Alice', 'pending'),
('Bob', 'shipped'),
('Charlie', 'delivered');

SELECT * FROM orders;


-- 5. TEST ENUM VALUE REJECTION (TYPO / INVALID ENUM)
INSERT INTO orders (customer_name, status) VALUES 
('David', 'on_the_way');
-- ERROR: invalid input value for enum order_status: "on_the_way"


-- 6. TEST ENUM INHERENT ORDERING (WHERE status > 'processing')
-- 'pending' (1) < 'processing' (2) < 'shipped' (3) < 'delivered' (4) < 'cancelled' (5)
SELECT 
    order_id, 
    customer_name, 
    status 
FROM 
    orders 
WHERE 
    status > 'processing';


-- 7. ALTER TYPE TO ADD A NEW LABEL
ALTER TYPE order_status ADD VALUE 'returned' AFTER 'delivered';

INSERT INTO orders (customer_name, status) VALUES ('Eva', 'returned');
SELECT * FROM orders WHERE status = 'returned';
