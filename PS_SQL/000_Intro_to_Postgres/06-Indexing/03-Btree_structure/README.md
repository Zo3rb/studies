# Lesson 03: The B-Tree Index Structure

## 📖 Overview
The **B-Tree** (Balanced Tree) is PostgreSQL's default and most versatile index type. Understanding the internal tree structure—Root page, Internal pages, and Leaf pages—helps you appreciate how Postgres evaluates equality (`=`), range (`>`, `<`, `BETWEEN`), and prefix (`LIKE 'abc%'`) queries in $O(\log N)$ steps.

---

## 🧠 Key Concepts & Architecture

```
                    [ Root Page ]
                   /             \
      [ Internal Node ]         [ Internal Node ]
        /           \             /           \
  [ Leaf Page ] [ Leaf Page ] [ Leaf Page ] [ Leaf Page ]
    (Keys +       (Keys +       (Keys +       (Keys +
     ctids)        ctids)        ctids)        ctids)
       <------------ Doubly-Linked List ------------>
```

### 1. B-Tree Component Hierarchy
- **Root Page**: Entry point for index traversal.
- **Internal Nodes**: Contain key ranges pointing to child pages.
- **Leaf Pages**: Contain actual indexed key values alongside pointers (`ctid`) to heap rows.
- **Doubly-Linked Leaf Chain**: Leaf pages are linked left-to-right, making ordered range scans (`WHERE age BETWEEN 20 AND 30`) fast and sequential without re-traversing the tree!

### 2. Self-Balancing Property
A B-Tree always keeps all leaf pages at the exact same depth from the root. As data is added, pages split evenly, maintaining consistent $O(\log N)$ search depth regardless of table size.

---

## 💻 Supported Operators for B-Tree

B-Tree indexes support queries using any of these comparison operators:
- `=` (Equality)
- `<`, `<=`, `>`, `>=` (Range comparisons)
- `BETWEEN`, `IN`
- `IS NULL`, `IS NOT NULL`
- `LIKE 'pattern%'` (Prefix matching only, when collations allow)

---

## 🏆 Best Practices

- **B-Tree as Default**: B-Tree handles scalar data, dates, timestamps, text, and numbers seamlessly. Always default to B-Tree unless handling special data like GIS (`GiST`/`SP-GiST`), Full-Text Search (`GIN`), or massive time series (`BRIN`).

---

## 🧪 Practice Guide

- **`practice_trainings.sql`**: Test query execution using `pageinspect` extension to examine raw B-Tree root and leaf pages.
- **`practice_dvdrental.sql`**: Run range and equality queries on `payment` to analyze index range scans.
