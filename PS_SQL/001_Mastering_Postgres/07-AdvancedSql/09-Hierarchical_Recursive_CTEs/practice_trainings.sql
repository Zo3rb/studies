-- Lesson 09: Hierarchical Recursive CTEs
-- Target database: trainings. Execute only in the trainings database.
-- Temporary objects are session-local and disappear when the session ends.

WITH RECURSIVE tree(id, parent_id, label, depth, path) AS (SELECT id, parent_id, label, 0, ARRAY[id] FROM (VALUES (1,NULL::int,'root'), (2,1,'child A'), (3,1,'child B'), (4,2,'grandchild')) AS n(id,parent_id,label) WHERE parent_id IS NULL UNION ALL SELECT n.id,n.parent_id,n.label,t.depth+1,t.path||n.id FROM (VALUES (1,NULL::int,'root'), (2,1,'child A'), (3,1,'child B'), (4,2,'grandchild')) AS n(id,parent_id,label) JOIN tree AS t ON n.parent_id=t.id WHERE NOT n.id = ANY(t.path)) SELECT id, parent_id, label, depth, path FROM tree ORDER BY path;
