-- Lesson 10: Handling NULLs
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

SELECT NULL = NULL AS unknown_comparison, NULL IS NULL AS null_test, NULL IS NOT DISTINCT FROM NULL AS null_safe_equal, coalesce(NULL::text, 'fallback') AS default_value;
