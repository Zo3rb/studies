-- Lesson 11: Range Types (trainings)

DROP TABLE IF EXISTS classroom_sessions;

CREATE TABLE classroom_sessions (
    session_id BIGSERIAL PRIMARY KEY,
    course_name TEXT NOT NULL,
    session_period TSRANGE NOT NULL
);

INSERT INTO classroom_sessions (course_name, session_period) VALUES
('SQL Basics', tsrange('2026-07-01 09:00', '2026-07-01 11:00', '[)')),
('Advanced SQL', tsrange('2026-07-01 10:30', '2026-07-01 12:00', '[)')),
('Python Intro', tsrange('2026-07-01 12:30', '2026-07-01 14:00', '[)'));

SELECT
    a.session_id AS session_a,
    b.session_id AS session_b,
    a.session_period && b.session_period AS overlaps
FROM classroom_sessions a
JOIN classroom_sessions b
  ON a.session_id < b.session_id
ORDER BY a.session_id, b.session_id;

SELECT *
FROM classroom_sessions
WHERE session_period @> timestamp '2026-07-01 10:45';

