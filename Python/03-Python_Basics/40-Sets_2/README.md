# 📖 Lesson: Sets 2

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0050. Sets 2.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson compares two sets using mathematical operations.
You compute union, intersection, difference, and symmetric difference with both operators and named methods.
Relationship checks include `issubset()`, `issuperset()`, and `isdisjoint()`.
Mutating variants such as `update()` and `intersection_update()` are contrasted with the operators that return new sets.

---

## 📝 Key Concepts

### 1. Combining Sets

Operator forms return new sets; the named methods are alternative spellings.

| Operation | Operator | Method | Meaning |
| :--- | :--- | :--- | :--- |
| Union | `a | b` | `a.union(b)` | Items in either set |
| Intersection | `a & b` | `a.intersection(b)` | Items in both |
| Difference | `a - b` | `a.difference(b)` | In `a` but not `b` |
| Symmetric difference | `a ^ b` | `a.symmetric_difference(b)` | In exactly one |

```python
a = {1, 2, 3}
b = {3, 4, 5}
print("union:", sorted(a | b))
print("intersection:", sorted(a & b))
print("difference:", sorted(a - b))
print("sym diff:", sorted(a ^ b))
```

---

### 2. Relationships

`issubset()` / `<=` and `issuperset()` / `>=` compare containment. `isdisjoint()` checks for no shared items.

```python
small = {1, 2}
large = {1, 2, 3}
print("small <= large:", small <= large)
print("large >= small:", large >= small)
print("disjoint:", small.isdisjoint({8, 9}))
print("proper subset:", small < large)
```

---

### 3. Mutating Variants

`update()`, `intersection_update()`, `difference_update()`, and `symmetric_difference_update()` modify the set in place and return `None`.
`discard()` and `add()` are also in-place; keep them separate from the operator versions.

```python
a = {1, 2, 3}
b = {3, 4}
result = a.union(b)
print("union (new):", sorted(result), "a unchanged:", sorted(a))
a.intersection_update(b)
print("after intersection_update:", sorted(a))
a.discard(3)
a.add(9)
print("after discard/add:", sorted(a))
```

---

## ⚠️ Gotchas & Pro Tips

1. **Operators return, `_update` mutates** — `a | b` gives a new set; `a.update(b)` changes `a` and returns `None`.
2. **Sort before printing** — Set order is arbitrary; `sorted(...)` keeps practice output deterministic.
3. **`discard()` is safer here** — Use `discard()` when an item may be absent; `remove()` would raise `KeyError`.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
