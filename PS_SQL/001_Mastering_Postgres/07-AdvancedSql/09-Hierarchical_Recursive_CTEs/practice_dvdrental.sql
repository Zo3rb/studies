-- Lesson 09: Hierarchical Recursive CTEs
-- Target database: dvdrental (course sample database).
-- Self-contained read-only example; models a small employee hierarchy.

WITH RECURSIVE staff_tree(staff_id, manager_id, full_name, depth, path) AS (
    SELECT staff_id, manager_id, full_name, 0, ARRAY[staff_id]
    FROM (VALUES (1,NULL::int,'Rae'), (2,1,'Sam'), (3,1,'Alex'), (4,2,'Jo'))
         AS staff(staff_id,manager_id,full_name)
    WHERE manager_id IS NULL
    UNION ALL
    SELECT s.staff_id, s.manager_id, s.full_name, t.depth+1, t.path||s.staff_id
    FROM (VALUES (1,NULL::int,'Rae'), (2,1,'Sam'), (3,1,'Alex'), (4,2,'Jo'))
         AS s(staff_id,manager_id,full_name)
    JOIN staff_tree AS t ON s.manager_id=t.staff_id
    WHERE NOT s.staff_id=ANY(t.path)
)
SELECT * FROM staff_tree ORDER BY path;
