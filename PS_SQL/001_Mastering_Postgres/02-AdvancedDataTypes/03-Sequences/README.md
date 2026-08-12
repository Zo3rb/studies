# 🔄 Lesson 3: Sequences in PostgreSQL

A **`SEQUENCE`** is a specialized single-row database object designed to generate a stream of unique integer values. While `SERIAL` creates sequences implicitly, creating standalone sequence objects explicitly offers fine-grained control over ID generation logic.

---

## 1. Creating Sequences

### **Syntax:**
```sql
CREATE SEQUENCE sequence_name
    [ AS data_type ]          -- SMALLINT, INTEGER, or BIGINT (default BIGINT)
    [ START WITH start_val ]   -- Starting number (default 1)
    [ INCREMENT BY step_val ]  -- Step size (default 1, can be negative)
    [ MINVALUE min_val ]
    [ MAXVALUE max_val ]
    [ CACHE cache_val ]        -- Pre-allocate numbers in RAM for speed
    [ CYCLE | NO CYCLE ];     -- Restart when MAXVALUE is reached
```

---

## 2. Sequence Functions

PostgreSQL provides four core functions to interact with sequences:

1.  **`nextval('seq_name')`:** Advances the sequence and returns the new value.
2.  **`currval('seq_name')`:** Returns the value most recently obtained by `nextval` in the current session.
3.  **`setval('seq_name', val)`:** Manually resets the current value of the sequence.
4.  **`lastval()`:** Returns the value returned by the most recent `nextval` call in the current session.

---

## 🛠️ Practice Exercises

To complete this lesson:
1. Open DBeaver.
2. In the empty **`trainings`** database, execute [practice_trainings.sql](./practice_trainings.sql) to create custom sequences, test `INCREMENT BY 5`, use `setval()`, and share a sequence across multiple tables.
3. In the **`dvdrental`** database, execute [practice_dvdrental.sql](./practice_dvdrental.sql) to practice calling `currval()` and `nextval()`.
