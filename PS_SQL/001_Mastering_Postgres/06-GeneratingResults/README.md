# Module 6: Generating Results

This module follows the course's **06-Generating Results** section and develops the tools used to compose relational query results: ordinary SELECT statements, joins, subqueries, set-returning functions, set operations, and join performance.

## Learning objectives

By the end of this module, you should be able to:

- Build ordered, filtered result sets and explain basic query processing.
- Combine related rows with inner and outer joins while accounting for duplicates and unmatched rows.
- Choose among scalar, membership, correlated, and lateral subqueries.
- Use `ROWS FROM`, `generate_series`, and other set-returning functions to produce rows and fill gaps.
- Combine compatible query results with `UNION`, `UNION ALL`, `INTERSECT`, and `EXCEPT`.
- Compare equivalent query forms and use `EXPLAIN (ANALYZE, BUFFERS)` to inspect join access paths.

## Lesson map

| Lesson | Topic | Key concepts | Status |
| :---: | :--- | :--- | :---: |
| **01** | [Introduction to Queries](./01-Introduction_to_Queries/README.md) | SELECT as a relational expression; FROM, WHERE, SELECT, ORDER BY and LIMIT; logical processing order; aliases; deterministic ordering | ✅ |
| **02** | [Inner Joins](./02-Inner_Joins/README.md) | A join combines rows by a predicate; INNER JOIN retains only matches; qualify ambiguous columns; one-to-many joins multiply rows; use PK/FK relationships | ✅ |
| **03** | [Outer Joins](./03-Outer_Joins/README.md) | LEFT/RIGHT/FULL joins preserve unmatched rows using NULL-extended columns; prefer LEFT JOIN for readability; filter placement in ON versus WHERE changes preservation; detect missing matches with IS NULL | ✅ |
| **04** | [Subqueries](./04-Subqueries/README.md) | Scalar subqueries return one value; IN/EXISTS express membership; correlated subqueries refer to outer rows; derived tables act as temporary relations; ensure scalar cardinality | ✅ |
| **05** | [LATERAL Joins](./05-Lateral_Joins/README.md) | LATERAL allows a FROM subquery/function to reference preceding FROM items; evaluated per left row; CROSS JOIN LATERAL drops left rows when right returns none; LEFT JOIN LATERAL preserves them; useful top-N-per-group | ✅ |
| **06** | [ROWS FROM](./06-ROWS_FROM/README.md) | ROWS FROM combines set-returning functions in parallel columns; shorter results are padded with NULL; ordinality exposes output position; distinguish from CROSS JOIN which forms combinations | ✅ |
| **07** | [Filling Gaps in Sequences](./07-Filling_Gaps_in_Sequences/README.md) | Generate a complete date/number series, then LEFT JOIN observed facts; aggregate before/after as appropriate; COALESCE missing counts; choose correct inclusive bounds and date/time grain | ✅ |
| **08** | [Subquery Elimination](./08-Subquery_Elimination/README.md) | Some subqueries can be rewritten as joins, EXISTS, or aggregates; compare equivalent results and plans; retain semantics around duplicates, NULLs, aggregation and LIMIT; rewrite for clarity only when equivalence is clear | ✅ |
| **09** | [Combining Queries](./09-Combining_Queries/README.md) | UNION combines compatible result sets and removes duplicates; UNION ALL preserves duplicates; INTERSECT and EXCEPT compare sets; column counts/types must align; ORDER BY applies to final set result | ✅ |
| **10** | [Set Generating Functions](./10-Set_Generating_Functions/README.md) | Set-returning functions produce rows; generate_series for numeric/time sequences; unnest expands arrays; WITH ORDINALITY adds sequence numbers; functions in FROM are composable and have explicit output aliases | ✅ |
| **11** | [Indexing Joins](./11-Indexing_Joins/README.md) | Join performance depends on the chosen join algorithm, table sizes, selectivity and available indexes; indexes on join keys can support index scans and nested loops; primary/foreign key declarations do not automatically index the referencing FK; inspect plans and benchmark representative data | ✅ |

## Practice environments

Each lesson contains the complete concept guide plus two SQL scripts:

- `practice_trainings.sql` contains self-contained examples or demonstrations intended for the `trainings` database.
- `practice_dvdrental.sql` applies the topic to the sample `dvdrental` schema and is read-only.

Run each script in the database named in its header. A few examples reference existing data and report naturally if no rows satisfy their conditions.
