-- ========================================================
-- Topic: Vacuuming
-- DATABASE: dvdrental
-- ========================================================

-- Standard VACUUM on a busy table to clean up dead tuples
VACUUM rental;

-- VACUUM ANALYZE updates the query planner statistics, 
-- which is highly recommended after bulk loading data into a table.
VACUUM ANALYZE payment;

