-- Lesson 16: RETURNING Keyword
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

CREATE TEMP TABLE notes(id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY, body text); INSERT INTO notes(body) VALUES ('first'), ('second') RETURNING id, body; UPDATE notes SET body=upper(body) WHERE id=1 RETURNING id, body; DELETE FROM notes WHERE id=2 RETURNING id, body; DROP TABLE notes;
