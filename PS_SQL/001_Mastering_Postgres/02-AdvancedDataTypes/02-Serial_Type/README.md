# 🔢 Lesson 2: Serial Type in PostgreSQL

The **`SERIAL`** data types in PostgreSQL are pseudo-types (shorthands) used to create auto-incrementing integer columns, typically used for primary keys.

---

## 1. The Serial Pseudo-Types

| Pseudo-Type | Underlying Base Type | Storage | Range |
| :--- | :--- | :--- | :--- |
| **`smallserial`** | `SMALLINT` | 2 bytes | 1 to 32,767 |
| **`serial`** | `INTEGER` | 4 bytes | 1 to 2,147,483,647 |
| **`bigserial`** | `BIGINT` | 8 bytes | 1 to 9,223,372,036,854,775,807 |

---

## 2. Behind the Scenes Mechanism

When you define a column as `SERIAL`:
```sql
CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY,
    title TEXT
);
```

PostgreSQL automatically executes three operations:
1.  Creates an implicit sequence object named `tasks_task_id_seq`.
2.  Sets the `DEFAULT` value of the column to `nextval('tasks_task_id_seq')`.
3.  Assigns sequence ownership to the table column so that dropping the table automatically drops the sequence (`OWNED BY`).

---

## 3. Sequence Gaps & Rollbacks

> [!IMPORTANT]
> `SERIAL` sequences are non-transactional to maximize concurrency.
> If an `INSERT` statement fails or is rolled back inside a transaction, the sequence number consumed by `nextval()` is **not** rolled back. This causes gaps in ID sequences (e.g. 1, 2, 5, 6), which is normal database behavior.

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute [practice_trainings.sql](./practice_trainings.sql) to inspect automatically generated sequence names, test rolled-back transaction gaps, and drop tables.
3. In the **`dvdrental`** database, execute [practice_dvdrental.sql](./practice_dvdrental.sql) to inspect how `SERIAL` primary keys are configured across tables.
