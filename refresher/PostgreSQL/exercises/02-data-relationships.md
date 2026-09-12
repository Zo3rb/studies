# Exercise 2 — Data Relationships

These exercises follow PG4E Week 2. Attempt each task before consulting the
example SQL. Use a scratch database or transaction while experimenting.

## Exercise 2.1 — Design a one-to-many schema

Create `artist`, `album`, `genre`, and `track` tables with:

- generated integer primary keys;
- required names and titles;
- unique artist, album, and genre names where appropriate;
- foreign keys from `album` to `artist`, and from `track` to `album` and
  `genre`;
- a non-negative track length check;
- a uniqueness rule preventing duplicate track titles within one album.

Explain why each constraint belongs on its chosen table.

## Exercise 2.2 — Insert related data

Insert at least three artists, four albums, three genres, and six tracks.
Insert parent rows before child rows. Include one artist with no albums so a
later `LEFT JOIN` has an unmatched row to preserve.

## Exercise 2.3 — Query across relationships

Write queries that:

1. list each album with its artist;
2. list each track with artist, album, and genre;
3. return all artists and their album counts, including zero;
4. return tracks longer than five minutes ordered from longest to shortest;
5. return each genre's average track length, excluding empty genres.

## Exercise 2.4 — Build a many-to-many relationship

Create `student`, `course`, and `member` tables. Make `(student_id,
course_id)` the composite primary key and add a `role` column to `member`.
Insert at least three students, three courses, and seven memberships.

## Exercise 2.5 — Many-to-many reports

Write queries that:

1. list each student and every course they take;
2. list each course and its enrolled students;
3. count students per course, including courses with zero students;
4. find students enrolled in both `SQL` and `Python`;
5. order a course roster by instructor role first, then student name.

## Exercise 2.6 — Constraint experiments

In a transaction, deliberately attempt to:

- insert an album with a missing artist;
- insert a duplicate membership;
- insert a duplicate track title in one album;
- delete an artist referenced by an album.

Record the PostgreSQL error for each attempt. Decide whether `ON DELETE
CASCADE`, `RESTRICT`, or `SET NULL` best fits each relationship and explain
why.

## Discussion checklist

- What anomaly would occur if artist names were copied into every track row?
- Why is `(student_id, course_id)` a better key than a duplicated membership
  row with its own unconstrained identity?
- What is the difference between `COUNT(*)` and `COUNT(album_id)` after a
  `LEFT JOIN`?
- Which join predicates should be indexed for the reports above?
