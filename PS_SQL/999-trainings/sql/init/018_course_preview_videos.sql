CREATE TABLE course_preview_videos (
    id serial PRIMARY KEY,
    course_id integer NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    video_url text NOT NULL,
    order_index integer NOT NULL DEFAULT 1,
    duration_seconds integer,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX idx_course_preview_videos_course_id ON course_preview_videos(course_id);