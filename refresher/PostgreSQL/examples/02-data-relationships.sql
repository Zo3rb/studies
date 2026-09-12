-- PostgreSQL Week 2: Data Relationships
-- Run in the trainings database.
-- This example resets only the learning tables in the public schema.

\connect trainings
SET search_path TO public;

DROP TABLE IF EXISTS public.member;
DROP TABLE IF EXISTS public.track;
DROP TABLE IF EXISTS public.course;
DROP TABLE IF EXISTS public.student;
DROP TABLE IF EXISTS public.genre;
DROP TABLE IF EXISTS public.album;
DROP TABLE IF EXISTS public.artist;

CREATE TABLE public.artist (
    artist_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text NOT NULL UNIQUE
);

CREATE TABLE public.album (
    album_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    artist_id integer NOT NULL REFERENCES public.artist(artist_id),
    title text NOT NULL,
    UNIQUE (artist_id, title)
);

CREATE TABLE public.genre (
    genre_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text NOT NULL UNIQUE
);

CREATE TABLE public.track (
    track_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    album_id integer NOT NULL REFERENCES public.album(album_id),
    genre_id integer NOT NULL REFERENCES public.genre(genre_id),
    title text NOT NULL,
    length_seconds integer NOT NULL CHECK (length_seconds > 0),
    UNIQUE (album_id, title)
);

INSERT INTO public.artist (name)
VALUES ('Led Zeppelin'), ('AC/DC'), ('Nina Simone'), ('Unreleased Artist');

INSERT INTO public.album (artist_id, title)
SELECT artist_id, 'IV' FROM public.artist WHERE name = 'Led Zeppelin';
INSERT INTO public.album (artist_id, title)
SELECT artist_id, 'Who Made Who' FROM public.artist WHERE name = 'AC/DC';
INSERT INTO public.album (artist_id, title)
SELECT artist_id, 'I Put a Spell on You' FROM public.artist
WHERE name = 'Nina Simone';

INSERT INTO public.genre (name)
VALUES ('Rock'), ('Jazz'), ('Blues');

INSERT INTO public.track (album_id, genre_id, title, length_seconds)
SELECT a.album_id, g.genre_id, values.title, values.length_seconds
FROM (VALUES
    ('IV', 'Rock', 'Black Dog', 297),
    ('IV', 'Rock', 'Stairway', 482),
    ('Who Made Who', 'Rock', 'Who Made Who', 207),
    ('I Put a Spell on You', 'Jazz', 'Feeling Good', 174),
    ('I Put a Spell on You', 'Blues', 'I Put a Spell on You', 191)
) AS values(title_album, genre_name, title, length_seconds)
JOIN public.album AS a ON a.title = values.title_album
JOIN public.genre AS g ON g.name = values.genre_name;

-- 1. One-to-many: albums and their artists.
SELECT a.title AS album_title, ar.name AS artist_name
FROM public.album AS a
JOIN public.artist AS ar ON ar.artist_id = a.artist_id
ORDER BY ar.name, a.title;

-- 2. Multi-table join: each track's complete context.
SELECT t.title AS track_title,
    ar.name AS artist_name,
    a.title AS album_title,
    g.name AS genre_name
FROM public.track AS t
JOIN public.album AS a ON a.album_id = t.album_id
JOIN public.artist AS ar ON ar.artist_id = a.artist_id
JOIN public.genre AS g ON g.genre_id = t.genre_id
ORDER BY ar.name, a.title, t.title;

-- 3. LEFT JOIN keeps the artist with no albums.
SELECT ar.name, COUNT(a.album_id) AS album_count
FROM public.artist AS ar
LEFT JOIN public.album AS a ON a.artist_id = ar.artist_id
GROUP BY ar.artist_id, ar.name
ORDER BY ar.name;

-- 4. Many-to-many schema.
CREATE TABLE public.student (
    student_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name text NOT NULL,
    email text NOT NULL UNIQUE
);

CREATE TABLE public.course (
    course_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title text NOT NULL UNIQUE
);

CREATE TABLE public.member (
    student_id integer NOT NULL REFERENCES public.student(student_id)
        ON DELETE CASCADE,
    course_id integer NOT NULL REFERENCES public.course(course_id)
        ON DELETE CASCADE,
    role text NOT NULL DEFAULT 'student'
        CHECK (role IN ('student', 'instructor')),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO public.student (name, email)
VALUES ('Jane', 'jane@example.com'),
    ('Ed', 'ed@example.com'),
    ('Sue', 'sue@example.com');
INSERT INTO public.course (title)
VALUES ('Python'), ('SQL'), ('PostgreSQL');

INSERT INTO public.member (student_id, course_id, role)
SELECT s.student_id, c.course_id, memberships.role
FROM (VALUES
    ('Jane', 'Python', 'instructor'),
    ('Ed', 'Python', 'student'),
    ('Sue', 'Python', 'student'),
    ('Jane', 'SQL', 'student'),
    ('Ed', 'SQL', 'instructor'),
    ('Ed', 'PostgreSQL', 'instructor'),
    ('Sue', 'PostgreSQL', 'student')
) AS memberships(student_name, course_title, role)
JOIN public.student AS s ON s.name = memberships.student_name
JOIN public.course AS c ON c.title = memberships.course_title;

-- 5. Many-to-many report.
SELECT s.name AS student_name, m.role, c.title AS course_title
FROM public.student AS s
JOIN public.member AS m ON m.student_id = s.student_id
JOIN public.course AS c ON c.course_id = m.course_id
ORDER BY c.title, m.role DESC, s.name;

-- 6. Courses with enrollment counts, including zero if one is added later.
SELECT c.title, COUNT(m.student_id) AS student_count
FROM public.course AS c
LEFT JOIN public.member AS m ON m.course_id = c.course_id
GROUP BY c.course_id, c.title
ORDER BY c.title;

-- Constraint experiments, run one at a time in a transaction:
-- INSERT INTO public.member (student_id, course_id)
-- VALUES (1, 1); -- duplicate primary key
-- INSERT INTO public.track (album_id, genre_id, title, length_seconds)
-- VALUES (999999, 1, 'Missing Album', 100); -- foreign-key violation