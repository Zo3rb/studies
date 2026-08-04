CREATE TABLE chat_rooms (
    id serial PRIMARY KEY,
    type varchar(20) NOT NULL DEFAULT 'support',
    course_id integer REFERENCES courses(id) ON DELETE
    SET NULL,
        created_at timestamptz NOT NULL DEFAULT now(),
        updated_at timestamptz NOT NULL DEFAULT now()
);