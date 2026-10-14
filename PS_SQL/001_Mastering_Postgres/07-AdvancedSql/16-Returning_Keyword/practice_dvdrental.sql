-- Lesson 16: RETURNING Keyword
-- Target database: dvdrental (course sample database).
-- Read-only practice unless a statement is explicitly marked otherwise.

UPDATE customer SET activebool=activebool WHERE customer_id = -1 RETURNING customer_id, activebool; -- Safe no-op demonstration; no row is expected.
