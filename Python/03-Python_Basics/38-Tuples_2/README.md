# 📖 Lesson: Tuples 2

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0048. Tuples 2.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson continues with tuple operations that mirror lists.
You can index, slice, measure length, test membership, concatenate, and repeat tuples.
Tuples have only two methods, `count()` and `index()`, unlike the long list method catalog.
Assignment and starred unpacking work on tuples just as they do on lists.

---

## 📝 Key Concepts

### 1. Sequence Operations

Tuples support most read-only sequence operations: `t[i]`, `t[a:b]`, `len(t)`, `x in t`, `t + u`, and `t * n`.
Slicing returns a new tuple; there is no in-place editing.

```python
t = (0, 1, 2, 3)
print(t[1], t[-1])
print(t[1:3])
print(len(t), 2 in t)
print(t + (4,), t * 2)
```

---

### 2. Only `count()` and `index()`

`count(x)` reports how many times a value appears. `index(x[, start[, stop]])` finds the first position and raises `ValueError` when missing.
These are the only tuple-specific methods because tuples cannot be modified.

```python
values = ("a", "b", "a", "c")
print("count('a'):", values.count("a"))
print("index('a'):", values.index("a"))
print("index('a', 1):", values.index("a", 1))
try:
    values.index("z")
except ValueError as error:
    print("ValueError:", error)
```

---

### 3. Unpacking and Immutability in Practice

Tuple assignment is the foundation of multiple assignment and return values.
Starred targets collect the remainder into a list, and length mismatches raise `ValueError`.

```python
point = (10, 20)
x, y = point
print("x, y:", x, y)
first, *rest = (1, 2, 3)
print("first/rest:", first, rest)
named = __import__("collections").namedtuple("Point", "x y")
p = named(1, 2)
print("namedtuple:", p.x, p.y)
```

---

## ⚠️ Gotchas & Pro Tips

1. **No mutating methods** — `append()`, `sort()`, and `reverse()` do not exist on tuples.
2. **`index()` raises** — Check membership or catch `ValueError` before asking for a position.
3. **Trailing comma for one item** — `(5)` is an int; unpacking it as `a, b = (5)` fails.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
