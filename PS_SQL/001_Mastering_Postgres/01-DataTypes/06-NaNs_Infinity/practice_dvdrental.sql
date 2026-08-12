-- ==========================================
-- PostgreSQL NaNs and Infinity Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to practice sanitizing and filtering numeric queries.
-- ==========================================

-- 1. IDENTIFYING AND FILTERING NON-FINITE NUMBERS
-- When building data pipelines for AI/ML models, you must filter out infinite values.
-- In PostgreSQL, you can use comparison check filters.

SELECT 
    title,
    rental_rate,
    replacement_cost,
    
    -- Let's construct a column containing simulated infinities for demonstration:
    CASE 
        WHEN rental_rate = 0.99 THEN 'Infinity'::double precision
        WHEN rental_rate = 2.99 THEN 'NaN'::double precision
        ELSE (rental_rate / replacement_cost)::double precision
    END AS model_feature
FROM 
    film
LIMIT 20;


-- 2. WRITING ROBUST FILTERS FOR MODEL PIPELINES
-- Use filters to retrieve only valid finite numbers suitable for machine learning training features.
WITH raw_features AS (
    SELECT 
        title,
        CASE 
            WHEN rental_rate = 0.99 THEN 'Infinity'::double precision
            WHEN rental_rate = 2.99 THEN 'NaN'::double precision
            ELSE (rental_rate / replacement_cost)::double precision
        END AS model_feature
    FROM 
        film
)
SELECT 
    *
FROM 
    raw_features
WHERE 
    model_feature != 'Infinity'::double precision
    AND model_feature != '-Infinity'::double precision
    -- To filter out NaNs, we check that it is not equal to itself OR we filter explicitly:
    AND model_feature IS NOT NULL
    AND model_feature = model_feature; -- In standard IEEE, NaN != NaN. Let's test this filter.
