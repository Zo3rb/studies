# PostgreSQL Session 2 — Data Relationships

This session follows PG4E Week 2: **Data Relationships**. The goal is to
model facts once, connect related tables with keys, and query those
relationships with joins.

## Why split data into tables?

A single wide table repeats facts. If every track row stores the artist name,
album title, and genre name, correcting one spelling requires updating many
rows. Repetition creates update, insert, and delete anomalies.

Normalization separates entities and connects them with keys:

```text
artist (one) -------- (many) album
album  (one) -------- (many) track
genre  (one) -------- (many) track
```

Each table represents one kind of thing. A row's primary key identifies that
thing, while a foreign key stores a reference to a related row.

## Keys and constraints

- **Primary key:** unique, non-null identity for a row.
- **Foreign key:** value that must reference a key in another table.
- **Natural key:** a meaningful real-world value, such as an email address.
- **Surrogate key:** generated identity with no business meaning.
- **Composite key:** multiple columns used together as the identity.
- **UNIQUE:** prevents duplicate values or combinations.
- **NOT NULL:** requires a value.
- **CHECK:** enforces a row-level rule.

Use a surrogate key when relationships should remain stable even if a
business value changes. Keep a `UNIQUE` constraint on business values that
must not repeat.

## One-to-many relationships

The foreign key belongs on the many side:

```sql
CREATE TABLE album (
    album_id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    artist_id integer NOT NULL REFERENCES artist(artist_id),
    title text NOT NULL,
    UNIQUE (artist_id, title)
);
```

The combination constraint permits two artists to have albums with the same
title while preventing duplicate titles for one artist.

## Joining tables

An inner join returns only rows with matches on both sides:

```sql
SELECT track.title, artist.name, album.title AS album_title, genre.name
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id;
```

A left join preserves every row from its left table, including rows with no
match:

```sql
SELECT artist.name, COUNT(album.album_id) AS album_count
FROM artist
LEFT JOIN album ON album.artist_id = artist.artist_id
GROUP BY artist.artist_id, artist.name;
```

Do not put a right-table filter in `WHERE` when you intend to preserve
unmatched left rows. Put that filter in the `ON` clause or account for
`NULL` deliberately.

## Many-to-many relationships

When each student can take many courses and each course can contain many
students, add a junction table:

```text
student (one) -- (many) member (many) -- (one) course
```

```sql
CREATE TABLE member (
    student_id integer REFERENCES student(student_id) ON DELETE CASCADE,
    course_id integer REFERENCES course(course_id) ON DELETE CASCADE,
    role text NOT NULL DEFAULT 'student',
    PRIMARY KEY (student_id, course_id)
);
```

The composite primary key prevents the same student from being enrolled in
the same course twice. Attributes of the relationship, such as `role`,
belong in the junction table.

## Referential actions

`ON DELETE CASCADE` removes dependent rows when the referenced parent is
deleted. Use it only when the dependent row has no useful life by itself.
For historical records, `RESTRICT`, `NO ACTION`, or a nullable foreign key
may better preserve evidence.

## Maths & DSA Insights

- A normalized schema stores each fact once, reducing redundant space from
  repeated text and reducing the number of writes needed for an update.
- A join is conceptually a matching operation over key values. Without
  useful indexes, a large join can approach $O(NM)$ work; indexes and query
  planning can make common equality joins much cheaper.
- A composite key behaves like a tuple: `(student_id, course_id)` identifies
  one membership while either component alone identifies many rows.
- A junction table is an adjacency-list representation of a bipartite graph:
  students and courses are vertices, and membership rows are edges.
- `COUNT(*)` counts joined rows, while `COUNT(child_id)` ignores the `NULL`
  placeholder produced by a left join. That distinction matters for zero
  counts.

## Study questions

1. Why does the foreign key belong in `album`, rather than in `artist`?
2. What duplicate relationship does a composite primary key prevent?
3. When would `LEFT JOIN` be more useful than `JOIN`?
4. Why can filtering a left-joined table in `WHERE` accidentally turn it into
   an inner join?
5. Which columns should be indexed if the application often finds tracks by
   album and memberships by course?
