CREATE TABLE lesson_translations (
    id serial PRIMARY KEY,
    lesson_id integer NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
    language varchar(5) NOT NULL CHECK (language IN ('en', 'ar')),
    title varchar(200) NOT NULL,
    content text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    UNIQUE (lesson_id, language)
);
CREATE INDEX idx_lesson_translations_lesson_id ON lesson_translations(lesson_id);
CREATE INDEX idx_lesson_translations_language ON lesson_translations(language);