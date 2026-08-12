-- ==========================================
-- PostgreSQL Network Address Types Practice Script
-- Target Database: 'trainings' (Empty database)
-- Use this script to test inet, cidr, macaddr, and subnet containment.
-- ==========================================

-- 1. Create a table to log server accesses
DROP TABLE IF EXISTS access_logs;

CREATE TABLE access_logs (
    log_id SERIAL PRIMARY KEY,
    user_name TEXT NOT NULL,
    ip_address INET NOT NULL,
    device_mac MACADDR
);

-- 2. Insert IPv4 and IPv6 entries
INSERT INTO access_logs (user_name, ip_address, device_mac) VALUES 
('Alice', '192.168.1.100/24', '08:00:2b:01:02:03'),
('Bob', '10.0.0.5', '00:11:22:33:44:55'),
('Charlie', '2001:4860:4860::8888', NULL); -- IPv6 address

SELECT * FROM access_logs;


-- 3. TEST SUBNET CONTAINMENT OPERATOR (<<)
-- Find all access logs coming from the 192.168.1.0/24 subnet:
SELECT 
    user_name, 
    ip_address 
FROM 
    access_logs 
WHERE 
    ip_address << '192.168.1.0/24'::cidr;


-- 4. NETWORK HELPER FUNCTIONS
SELECT 
    ip_address,
    host(ip_address) AS host_ip_only,
    masklen(ip_address) AS prefix_length,
    network(ip_address) AS subnet_network
FROM 
    access_logs;
