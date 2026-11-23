# 📖 Lesson: Built-In Functions + Methods

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0028. Built-In Functions + Methods.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

The lesson surveys useful built-in functions and string methods.
You call `len()` to measure text and use dot notation for methods such as `upper()`, `find()`, and `replace()`.
It reinforces that strings are immutable, so methods return new values rather than editing in place.
Knowing the difference between a standalone function and a method is a major theme.

---

## 📝 Key Concepts

### 1. Built-In Functions Work Across Types

Built-ins are called by name and often accept many different types.
`len()`, `type()`, `print()`, `str()`, and `sorted()` are common examples.

```python
text = "Hello"
items = [3, 1, 2]
print(len(text), len(items))
print(type(text).__name__)
print(sorted(items))
```

---

### 2. String Methods via Dot Notation

A method is a function attached to an object, called as `object.method(...)`.

| Method | Purpose | Example |
| :--- | :--- | :--- |
| `upper()` / `lower()` | Change case | `'hi'.upper()` -> `'HI'` |
| `find(sub)` | First index or `-1` | `'cat'.find('a')` -> `1` |
| `replace(a, b)` | New string with replacements | `'a-a'.replace('-', '')` |
| `strip()` | Remove surrounding whitespace | `' x '.strip()` -> `'x'` |
| `split()` | Break into a list | `'a b'.split()` -> `['a', 'b']` |

```python
text = "  Hello, World  "
print(text.strip().upper())
print(text.find("World"))
print(text.replace("World", "Python"))
print(text.split())
```

---

### 3. Chaining and Return Values

Because methods return values, you can chain calls: `text.strip().lower()`.
`find()` returns `-1` when the substring is missing, not `None`; always check for `-1` before using the index.

```python
email = "  User@Example.COM "
normalized = email.strip().lower()
print(normalized)
print("at index:", normalized.find("@"))
print("missing:", normalized.find("!"))
print("prefix?", normalized.startswith("user@"))
```

---

## ⚠️ Gotchas & Pro Tips

1. **`len()` is not a method** — Write `len(text)`, not `text.len()`; methods are listed by `dir(text)`.
2. **`find()` returns `-1`** — Checking `if text.find('x')` is wrong because `-1` is truthy; compare to `-1` explicitly.
3. **Methods do not mutate strings** — `text.upper()` leaves `text` alone; assign the result if you need it.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
