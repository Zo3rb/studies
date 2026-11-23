# 📖 Lesson: Variables

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0018. Variables.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

Variables are names that refer to values so you can reuse and update them.
The lesson shows how assignment works without a declaration step and how names can be rebound later.
It spends time on naming rules, case sensitivity, Python keywords, and the `snake_case` convention.
Good variable names are presented as a form of documentation for future readers.

---

## 📝 Key Concepts

### 1. Assignment Binds a Name to an Object

`name = value` evaluates the right-hand side first, then binds the resulting object to the name on the left.
There is no separate declaration: assigning creates the name. Reassigning points the name at a new object.

```python
score = 10
print(score)
score = score + 5
print(score)
```

---

### 2. Naming Rules and Conventions

Identifiers must start with a letter or underscore, then may contain letters, digits, and underscores.
Names are case-sensitive and cannot be Python keywords. Use `snake_case` for variables and functions.

| Valid | Invalid | Reason |
| :--- | :--- | :--- |
| `user_name` | `user-name` | Hyphen is subtraction, not allowed |
| `_temp` | `2nd_place` | Cannot start with a digit |
| `MAX_SIZE` | `class` | `class` is a keyword |

```python
import keyword
print(keyword.iskeyword("class"))   # True
print("score" != "Score")           # True: case-sensitive
user_name = "Andrei"
```

---

### 3. Chained and Multiple Assignment

Python can bind several names in one statement. Tuple unpacking assigns values positionally.
Chained assignment binds every name to the same object, which matters for mutable objects later.

```python
x = y = 0            # both refer to the same int object
first, second = 1, 2
print(x, y, first, second)
```

---

## ⚠️ Gotchas & Pro Tips

1. **Read before you increment** — `count = count + 1` fails with `NameError` if `count` was never assigned. Initialize it first.
2. **Avoid ambiguous names** — Single-letter `l` and capital `O` are hard to read; prefer `value` and `count`.
3. **Names are not typed boxes** — A variable is a label pointing to an object; assigning a new value rebinds the label.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
