CREATE TABLE course_categories (
    course_id integer NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    category_id integer NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    created_at timestamptz NOT NULL DEFAULT now(),
    PRIMARY KEY (course_id, category_id)
);
CREATE INDEX idx_course_categories_course_id ON course_categories(course_id);
CREATE INDEX idx_course_categories_category_id ON course_categories(category_id);