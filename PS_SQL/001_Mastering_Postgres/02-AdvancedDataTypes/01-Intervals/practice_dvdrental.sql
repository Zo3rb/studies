-- ==========================================
-- PostgreSQL Intervals Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to calculate rental duration intervals.
-- ==========================================

-- 1. CALCULATE ACTUAL RENTAL DURATION PER RENTAL
SELECT 
    rental_id,
    customer_id,
    rental_date,
    return_date,
    return_date - rental_date AS actual_rental_duration
FROM 
    rental
WHERE 
    return_date IS NOT NULL
LIMIT 15;


-- 2. COMPARE ACTUAL DURATION VS ALLOWED DURATION (OVERDUE RENTALS)
SELECT 
    r.rental_id,
    f.title,
    f.rental_duration AS allowed_days,
    r.return_date - r.rental_date AS actual_duration,
    (r.return_date - r.rental_date) - (f.rental_duration || ' days')::interval AS overdue_time
FROM 
    rental r
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
WHERE 
    r.return_date IS NOT NULL 
    AND (r.return_date - r.rental_date) > (f.rental_duration || ' days')::interval
LIMIT 15;
