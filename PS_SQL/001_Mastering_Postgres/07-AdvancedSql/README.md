# Module 7: Advanced SQL

This module follows the course section **07-Advanced SQL** (videos 0073–0089). It builds on joins and aggregation to cover analytical queries, recursive query composition, reusable views, and data modification patterns.

## Learning objectives

By the end of this module, you should be able to:

- Produce combinations with CROSS JOIN and summarize using grouping sets, ROLLUP, and CUBE.
- Use window functions for ranking and running calculations while preserving row detail.
- Compose staged and recursive queries with CTEs, including hierarchical traversal.
- Reason about SQL NULLs and compare row values safely.
- Create and use views and materialized views with clear refresh expectations.
- Identify duplicate records and use ON CONFLICT, RETURNING, COALESCE, and generated columns appropriately.

## Lesson map

| Lesson | Topic | Key concepts | Video |
| :---: | :--- | :--- | :---: |
| **01** | [Introduction to Advanced SQL](./01-Introduction_to_Advanced_SQL/README.md) | Analytical queries, reusable query interfaces, and safe data changes | 0073 |
| **02** | [Cross Joins](./02-Cross_Joins/README.md) | CROSS JOIN returns the Cartesian product: each left row pairs with every right row | 0074 |
| **03** | [Grouping](./03-Grouping/README.md) | GROUP BY partitions input rows by grouping keys; aggregate functions calculate one result per group | 0075 |
| **04** | [Grouping Sets, ROLLUP, and CUBE](./04-Grouping_Sets_Rollup_Cube/README.md) | Multiple grouping levels, hierarchical subtotals, combinations, and `GROUPING()` | 0076 |
| **05** | [Window Functions](./05-Window_Functions/README.md) | Window functions calculate across related rows without collapsing them | 0077 |
| **06** | [Common Table Expressions (CTEs)](./06-CTEs/README.md) | Named query stages and CTE evaluation/planner behavior | 0078 |
| **07** | [CTEs with Window Functions](./07-CTEs_with_Window_Functions/README.md) | Combine a window calculation in a CTE with an outer filter | 0079 |
| **08** | [Recursive CTEs](./08-Recursive_CTEs/README.md) | A recursive CTE has an anchor term and a recursive term joined with UNION or UNION ALL | 0080 |
| **09** | [Hierarchical Recursive CTEs](./09-Hierarchical_Recursive_CTEs/README.md) | Represent a hierarchy with an adjacency list (each row points to its parent) | 0081 |
| **10** | [Handling NULLs](./10-Handling_NULLs/README.md) | NULL represents missing/unknown information and uses three-valued logic | 0082 |
| **11** | [Row Value Syntax](./11-Row_Value_Syntax/README.md) | Row constructors compare multiple fields as a unit | 0083 |
| **12** | [Views](./12-Views/README.md) | A view stores a query definition, not its result | 0084 |
| **13** | [Materialized Views](./13-Materialized_Views/README.md) | A materialized view stores query results physically | 0085 |
| **14** | [Removing Duplicate Rows](./14-Removing_Duplicate_Rows/README.md) | Detect duplicates by business key; rank rows and safely select deletion targets | 0086 |
| **15** | [Upsert](./15-Upsert/README.md) | `INSERT ... ON CONFLICT`, `EXCLUDED`, and atomic conflict handling | 0087 |
| **16** | [RETURNING Keyword](./16-Returning_Keyword/README.md) | RETURNING outputs values affected by INSERT, UPDATE, or DELETE without a follow-up SELECT | 0088 |
| **17** | [COALESCE and Generated Columns](./17-COALESCE_and_Generated_Columns/README.md) | COALESCE returns the first non-NULL argument and all arguments must resolve to a compatible type | 0089 |

## Practice environments

Each lesson includes `practice_trainings.sql` and `practice_dvdrental.sql`. Run each in the database named in its header. Practice objects are temporary and session-local where object creation is needed; the sample database scripts do not change persistent data.
