-- ========================================================
-- Topic: Accessing JSONB Data
-- DATABASE: dvdrental
-- ========================================================

-- Simulating JSONB data extraction on dvdrental

WITH temp_json AS (
    SELECT CAST(row_to_json(film) AS JSONB) AS payload
    FROM film
)
SELECT 
    payload->>'title' AS movie_title,
    payload->>'rating' AS movie_rating
FROM temp_json
WHERE payload->>'rating' = 'R'
LIMIT 5;

