-- ========================================================
-- Topic: Inner Joins
-- DATABASE: dvdrental
-- ========================================================

-- 1. INNER JOIN: Find the customer details for a specific rental
SELECT r.rental_date, c.first_name, c.last_name, c.email
FROM rental r
INNER JOIN customer c ON r.customer_id = c.customer_id
LIMIT 5;

-- 2. Multi-table INNER JOIN: Find which staff member processed which payment for which customer
SELECT p.payment_date, p.amount, s.first_name AS staff_name, c.first_name AS customer_name
FROM payment p
INNER JOIN staff s ON p.staff_id = s.staff_id
INNER JOIN customer c ON p.customer_id = c.customer_id
LIMIT 10;

