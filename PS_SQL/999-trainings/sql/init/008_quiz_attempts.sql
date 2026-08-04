-- Creating the 'quiz_attempts' Table
DROP TABLE IF EXISTS quiz_attempts;
CREATE TABLE quiz_attempts (
    id SERIAL PRIMARY KEY,
    enrollment_id INTEGER NOT NULL REFERENCES enrollments(id) ON DELETE CASCADE,
    module_id INTEGER NOT NULL REFERENCES modules(id) ON DELETE CASCADE,
    attempt_number INTEGER NOT NULL DEFAULT 1,
    score NUMERIC(5, 2) NOT NULL,
    passed BOOLEAN NOT NULL DEFAULT false,
    answers JSONB,
    started_at timestamptz NOT NULL DEFAULT now(),
    completed_at timestamptz,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX idx_quiz_attempts_enrollment_id ON quiz_attempts(enrollment_id);
CREATE INDEX idx_quiz_attempts_module_id ON quiz_attempts(module_id);
CREATE INDEX idx_quiz_attempts_passed ON quiz_attempts(passed);