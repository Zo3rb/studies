-- Lesson 11: Row Value Syntax
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

SELECT (customer_id, staff_id), count(*) FROM payment WHERE (customer_id, staff_id) IN ((1,1),(2,1),(3,2)) GROUP BY (customer_id, staff_id) ORDER BY (customer_id, staff_id);
