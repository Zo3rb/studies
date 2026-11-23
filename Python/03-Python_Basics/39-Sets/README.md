# 📖 Lesson: Sets

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0049. Sets.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

Sets are unordered collections that store each unique value once.
The lesson converts a list with duplicates into a set to remove repeats, then tests membership with `in`.
You also add and remove items, copy a set, and clear it.
Because iteration order is not guaranteed, these notes sort sets when displaying them.

---

## 📝 Key Concepts

### 1. Creating Sets and Removing Duplicates

Use `set()` for an empty set or `{a, b}` for a literal. `{}` is an empty dictionary, not a set.
Converting a list with `set(items)` removes duplicates, but the original order is lost.

```python
numbers = [1, 2, 2, 3, 3, 3]
unique = set(numbers)
print(unique, len(unique))
print("sorted for display:", sorted(unique))
print("empty:", set())
```

---

### 2. Membership and Mutation

`x in s` is fast on average because sets use hashing. `add(x)` inserts one item; `remove(x)` raises `KeyError` if absent, while `discard(x)` does not.
Set elements must be hashable.

```python
tags = {"python", "basics"}
tags.add("learning")
tags.discard("missing")
print("sorted tags:", sorted(tags))
print("'python' in tags:", "python" in tags)
try:
    tags.remove("missing")
except KeyError as error:
    print("KeyError:", error)
```

---

### 3. Copy and Clear

`s.copy()` returns a shallow copy; `s.clear()` removes every element. Both are straightforward but easy to forget in favor of reassignment.

```python
original = {1, 2}
copy = original.copy()
copy.add(3)
print("original:", sorted(original))
print("copy:", sorted(copy))
copy.clear()
print("cleared:", copy)
```

---

## ⚠️ Gotchas & Pro Tips

1. **No guaranteed order** — Do not rely on the printed order of a set; use `sorted(s)` for stable display.
2. **Elements must be hashable** — A set cannot contain a list, dict, or set; use a tuple for compound items.
3. **`remove` vs `discard`** — `remove` raises `KeyError` for missing items; `discard` silently does nothing.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
