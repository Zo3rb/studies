# 📖 Lesson: List Unpacking

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0040. List Unpacking.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

Unpacking assigns items from an iterable to several variables in one statement.
The lesson starts with exact matches, then introduces the star expression to capture "the rest" as a list.
Examples include splitting a list into `a, b, c` and an `other` catch-all.
Swapping variables and ignoring unwanted values are natural follow-ups.

---

## 📝 Key Concepts

### 1. Basic Unpacking

The number of variables must match the number of items, or Python raises `ValueError`.
Unpacking works with any iterable, not just lists.

```python
coordinates = [10, 20, 30]
x, y, z = coordinates
print(x, y, z)
try:
    a, b = coordinates
except ValueError as error:
    print("ValueError:", error)
```

---

### 2. Starred Unpacking

Prefix one variable with `*` to collect the remaining items into a list.
The starred variable may appear at the beginning, middle, or end, and it can receive an empty list.

```python
numbers = [1, 2, 3, 4, 5]
first, *rest = numbers
head, *middle, tail = numbers
print("first/rest:", first, rest)
print("head/middle/tail:", head, middle, tail)
```

---

### 3. Swapping and Ignoring Values

Tuple unpacking makes swaps concise without a temporary variable.
A conventional `_` name marks values you do not intend to use.

```python
a, b = 1, 2
a, b = b, a
print("swapped:", a, b)
name, _, age = ["Andrei", "ignored", 36]
print(name, age)
```

---

## ⚠️ Gotchas & Pro Tips

1. **Only one star** — `a, *b, *c = items` is a syntax error; at most one starred target is allowed.
2. **`*rest` is always a list** — Even a single captured item becomes `[item]`, which surprises people expecting a scalar.
3. **Length must still fit** — Without a star, too few or too many values raise `ValueError`.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
