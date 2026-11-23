# 📖 Lesson: range()

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0063. range().mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

Python's `range()` builds an arithmetic sequence of integers without storing them all in memory. This lesson covers its one-, two-, and three-argument forms, the exclusive `stop` rule, negative steps for counting backwards, and how `range` works with `len()`, indexing, and membership tests.

---

## 📝 Key Concepts

### 1. The Three Forms

`range(stop)` counts from `0` to `stop - 1`. `range(start, stop)` begins at `start`. `range(start, stop, step)` advances by `step`. The `stop` value is **never included**, which is why `range(5)` has exactly five values: 0, 1, 2, 3, 4.

```python
print(list(range(5)))            # [0, 1, 2, 3, 4]
print(list(range(2, 8)))         # [2, 3, 4, 5, 6, 7]
print(list(range(0, 10, 2)))     # [0, 2, 4, 6, 8]
```

---

### 2. Lazy, Immutable and Reusable

A `range` object stores only start, stop, and step; values are computed on demand. It supports `len()`, indexing, slicing (which returns another range), and `in` membership checks efficiently. Because it is immutable, you cannot change it — convert to a list with `list(...)` if you need to modify the values.

```python
r = range(10, 20, 3)
print(len(r), r[0], r[-1])
print(13 in r, 14 in r)
print(list(r[1:]))
```

---

### 3. Counting Backwards and Looping by Index

A negative step counts down: `range(5, 0, -1)` yields 5, 4, 3, 2, 1. Use `range(len(items))` only when you truly need the index; otherwise iterate the items directly or use `enumerate()`. Combine with `reversed()` when you want to walk an existing sequence backwards.

```python
for n in range(5, 0, -1):
    print(n, end=" ")
print()

items = ["a", "b", "c"]
for item in reversed(items):
    print(item, end=" ")
print()
```

---

## ⚠️ Gotchas & Pro Tips

1. **Stop is exclusive — add one for inclusive ranges** — To loop over the numbers 1 through 10 inclusive, write `range(1, 11)`. This off-by-one rule is the most common source of range bugs.
2. **A zero step raises ValueError** — `range(0, 10, 0)` is invalid because the sequence could never advance. A negative step requires `start > stop` to produce anything.
3. **Use `_` for an unused loop variable** — In `for _ in range(3):` the underscore signals 'I only care that this runs three times'. It is a convention, not a special Python feature.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
