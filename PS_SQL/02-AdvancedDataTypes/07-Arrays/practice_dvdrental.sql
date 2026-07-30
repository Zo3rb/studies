-- ==========================================
-- PostgreSQL Arrays Practice Script
-- Target Database: 'dvdrental' (Sample Database)
-- Use this script to query array columns in film data.
-- ==========================================

-- 1. INSPECT THE SPECIAL_FEATURES ARRAY COLUMN IN FILM
-- Table 'film' contains a column 'special_features' defined as text[].
SELECT 
    title, 
    special_features 
FROM 
    film 
LIMIT 10;


-- 2. SEARCH FOR FILMS CONTAINING 'Deleted Scenes' USING ANY()
SELECT 
    title, 
    rental_rate, 
    special_features
FROM 
    film
WHERE 
    'Deleted Scenes' = ANY(special_features)
LIMIT 15;


-- 3. UNNEST SPECIAL FEATURES AND COUNT OCCURRENCES
SELECT 
    unnest(special_features) AS feature_name,
    COUNT(film_id) AS total_films
FROM 
    film
GROUP BY 
    feature_name
ORDER BY 
    total_films DESC;
