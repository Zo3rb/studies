# 📖 Lesson: Dictionary Keys

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0044. Dictionary Keys.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson examines what can serve as a dictionary key.
Strings, numbers, booleans, and tuples of hashable items work; lists and other mutable containers do not.
Keys must be unique, so repeated keys overwrite earlier values.
The lesson also reveals that `True` and `1` collide because booleans are integers in Python.

---

## 📝 Key Concepts

### 1. Keys Must Be Hashable

A key must have a hash value that never changes, which is why immutable types work.
`str`, `int`, `float`, `bool`, `None`, and tuples of hashable values are valid; `list`, `dict`, and `set` are not.

```python
valid = {
    "name": "Andrei",
    1: "one",
    (10, 20): "point",
}
print(valid)
try:
    {["list"]: "bad"}
except TypeError as error:
    print("TypeError:", error)
```

---

### 2. Keys Must Be Unique

Writing the same key twice in a literal keeps only the final value.
Assignment to an existing key updates rather than adding a second entry.

```python
data = {"a": 1, "a": 2}
print(data)
data["a"] = 3
print(data)
print("pairs:", len(data))
```

---

### 3. Key Equality Surprises

Dictionary keys are compared by equality and hash. Because `True == 1` and `False == 0`, those keys collide.
Keys are also case-sensitive, so `"Name"` and `"name"` are different.

```python
collision = {True: "yes", 1: "one", False: "no", 0: "zero"}
print(collision)
mixed = {"Name": "A", "name": "B"}
print(mixed)
print(mixed.get("NAME", "missing"))
```

---

## ⚠️ Gotchas & Pro Tips

1. **`True` and `1` are one key** — Avoid mixing boolean and numeric keys in the same dictionary.
2. **Tuples are only hashable if contents are** — `(1, 2)` is valid, but `(1, [2])` raises `TypeError`.
3. **Keys are case-sensitive** — Normalize user-provided keys (for example with `.lower()`) if case should not matter.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
