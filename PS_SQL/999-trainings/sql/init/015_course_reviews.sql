CREATE TABLE course_reviews (
    id serial PRIMARY KEY,
    enrollment_id integer NOT NULL UNIQUE REFERENCES enrollments(id) ON DELETE CASCADE,
    rating integer NOT NULL CHECK (
        rating BETWEEN 1 AND 5
    ),
    review_text text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    deleted_at timestamptz
);
CREATE INDEX idx_course_reviews_enrollment_id ON course_reviews(enrollment_id);
CREATE INDEX idx_course_reviews_rating ON course_reviews(rating);