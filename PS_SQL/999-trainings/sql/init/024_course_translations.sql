CREATE TABLE course_translations (
    id serial PRIMARY KEY,
    course_id integer NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    language varchar(5) NOT NULL CHECK (language IN ('en', 'ar')),
    title varchar(200) NOT NULL,
    description text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    UNIQUE (course_id, language)
);
CREATE INDEX idx_course_translations_course_id ON course_translations(course_id);
CREATE INDEX idx_course_translations_language ON course_translations(language);