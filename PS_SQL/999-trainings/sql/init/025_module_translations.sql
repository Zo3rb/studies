CREATE TABLE module_translations (
    id serial PRIMARY KEY,
    module_id integer NOT NULL REFERENCES modules(id) ON DELETE CASCADE,
    language varchar(5) NOT NULL CHECK (language IN ('en', 'ar')),
    title varchar(200) NOT NULL,
    description text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    UNIQUE (module_id, language)
);
CREATE INDEX idx_module_translations_module_id ON module_translations(module_id);
CREATE INDEX idx_module_translations_language ON module_translations(language);