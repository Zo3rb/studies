-- Lesson 13: NULL Handling (trainings)

DROP TABLE IF EXISTS students_nulls;

CREATE TABLE students_nulls (
    student_id BIGSERIAL PRIMARY KEY,
    full_name TEXT NOT NULL,
    nickname TEXT,
    grade NUMERIC(5,2)
);

INSERT INTO students_nulls (full_name, nickname, grade) VALUES
('Ali Hasan', NULL, 91.5),
('Mona Adel', 'Mon', NULL),
('Kareem Samy', NULL, NULL);

SELECT
    student_id,
    full_name,
    COALESCE(nickname, full_name) AS display_name,
    COALESCE(grade, 0) AS safe_grade
FROM students_nulls
ORDER BY student_id;

SELECT
    full_name,
    grade,
    NULLIF(grade, 0) AS grade_or_null
FROM students_nulls
ORDER BY student_id;

