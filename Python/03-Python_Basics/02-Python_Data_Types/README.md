# 📖 Lesson: Python Data Types

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0012. Python Data Types.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson tours Python's core data types: `int`, `float`, `bool`, and `str` for single values, plus `list`, `tuple`, `set`, and `dict` for collections.
It explains how each type is written as a literal and what kind of data it is meant to store.
`type()` is used repeatedly to confirm which type a value has, and `None` is introduced as the absence of a value.
Understanding mutability and ordering here prepares you for the collection lessons later in the module.

---

## 📝 Key Concepts

### 1. Scalar (Single-Value) Types

Scalars hold one piece of data. Python decides the type from the literal you write.

| Type | Literal example | Meaning |
| :--- | :--- | :--- |
| `int` | `42`, `-7` | Whole numbers of arbitrary size |
| `float` | `3.14`, `1e3` | Numbers with a decimal point / exponent |
| `bool` | `True`, `False` | Logical truth values |
| `str` | `"hello"`, `'x'` | Text (Unicode characters) |
| `NoneType` | `None` | Explicit absence of a value |

```python
print(type(42).__name__)        # int
print(type(3.14).__name__)      # float
print(type(True).__name__)      # bool
print(type("hello").__name__)   # str
```

---

### 2. Collection Types

Collections group multiple values. The four workhorses differ in ordering, mutability, and duplicate rules.

| Type | Literal | Ordered? | Mutable? | Duplicates? |
| :--- | :--- | :---: | :---: | :---: |
| `list` | `[1, 2, 2]` | Yes | Yes | Yes |
| `tuple` | `(1, 2)` | Yes | No | Yes |
| `set` | `{1, 2}` | No | Yes | No |
| `dict` | `{"a": 1}` | Yes (3.7+) | Yes | Unique keys |

```python
basket = ["apple", "apple", 3]
point = (10, 20)
unique = {1, 2, 2}
user = {"name": "Andrei", "age": 36}
print(basket, point, unique, user)
```

---

### 3. Dynamic Typing and `type()`

A variable does not have a fixed type; the object it currently references does.
Rebinding a name to a different value can change its apparent type. `isinstance()` is the robust way to check.

```python
value = 10
print(type(value).__name__, isinstance(value, int))
value = "ten"
print(type(value).__name__, isinstance(value, str))
```

---

## ⚠️ Gotchas & Pro Tips

1. **`bool` is a subclass of `int`** — `True == 1` and `False == 0` are true. Usually harmless, but it explains odd dictionary-key collisions later.
2. **Don't shadow built-ins** — Avoid names like `list`, `str`, or `dict`; they overwrite the constructors you need.
3. **Empty literals are ambiguous** — `{}` creates an empty dict, not a set. Use `set()` for an empty set.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
