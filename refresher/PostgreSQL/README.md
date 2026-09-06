# SQL and PostgreSQL Course Workspace

This folder contains the SQL and PostgreSQL refresher based on
[PostgreSQL for Everybody (PG4E)](https://www.pg4e.com/).

The aim is to learn SQL as a language, PostgreSQL as a production-grade
relational database, and the connection between databases and Python programs.

## Current status

- Course folder: initialized
- Database: `trainings`
- Schema: `public`
- First example: prepared
- Next topic: relational foundations

PG4E uses the `psql` command-line client in its examples and provides setup
guidance for using a small course PostgreSQL server through PythonAnywhere.
Follow the current instructions on the
[PG4E home page](https://www.pg4e.com/) when connecting.

## Learning roadmap

1. Relational databases, tables, rows, and columns
2. PostgreSQL data types and table creation
3. `SELECT`, `WHERE`, `ORDER BY`, and `LIMIT`
4. `INSERT`, `UPDATE`, and `DELETE`
5. Primary keys, foreign keys, and constraints
6. Aggregation, `GROUP BY`, and `HAVING`
7. Inner, left, and self joins
8. Subqueries and common table expressions
9. Views and reusable query interfaces
10. Transactions and concurrency
11. Indexes and `EXPLAIN`
12. Python database access and parameterized queries
13. Data loading, cleaning, and validation
14. Advanced architecture and NoSQL concepts

The course site notes that its advanced architecture material is transitioning
from Elasticsearch toward Deno as of Fall 2025. We will use the current
course material when we reach that section.

## Study method

For each topic:

1. Explain the data-modeling idea before memorizing syntax.
2. Write a small schema with explicit types and constraints.
3. Predict a query's result.
4. Run the query and inspect the rows.
5. Test empty results, duplicate values, and `NULL`.
6. Review correctness, safety, and performance.
7. Record the result in `notes/`.

## PostgreSQL best practices

- Prefer explicit column lists over `SELECT *` in application queries.
- Use meaningful `snake_case` names.
- Give important tables primary keys.
- Use foreign keys to enforce relationships.
- Use `NOT NULL`, `CHECK`, and `UNIQUE` constraints for invariants.
- Use `timestamptz` for real-world instants.
- Use `numeric` for exact monetary values.
- Test an `UPDATE` or `DELETE` condition with `SELECT` first.
- Use parameterized queries from Python.
- Use transactions for related changes.
- Add indexes based on real query patterns.
- Inspect plans with `EXPLAIN` when performance matters.
- Keep passwords and connection strings out of source control.
- Treat migrations and backups as part of the application.

## Folder structure

```text
PostgreSQL/
  README.md
  notes/       Concept explanations and session records
  examples/    Runnable .sql demonstrations
  exercises/   Exercises to attempt before solutions
```

## Run the example

The example resets only its two learning tables in the `public` schema. Run it
in the `trainings` database:

```bash
psql -d trainings
\i PostgreSQL/examples/01-foundations.sql
```

Useful `psql` commands:

```text
\conninfo       show the current connection
\dn             list schemas
\dt             list tables
\d table_name   describe a table
\q              quit
```

## Next checkpoint

Understand and query this relationship:

```text
customers (one) -------- (many) orders
```

Then practice filtering, ordering, aggregation, and a join.
