# 📖 Lesson: Booleans

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0029. Booleans.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

Booleans represent truth and falsehood with the two values `True` and `False`.
The lesson shows how comparisons produce booleans and how `bool()` converts numbers and strings into a boolean.
It explains which values are falsy, such as `0`, empty strings, and `None`.
These values drive the conditional logic that appears in later modules.

---

## 📝 Key Concepts

### 1. The `bool` Type

`True` and `False` are capitalized keywords and are the only values of type `bool`.
Comparison operators (`==`, `!=`, `<`, `>`, `<=`, `>=`) produce booleans.

```python
print(True, False, type(True).__name__)
print(5 > 3)
print(5 == 3)
print("a" != "b")
```

---

### 2. Truthiness Rules

When Python needs a boolean, it applies truthiness: most objects are truthy, while a small set is falsy.

| Value | `bool(value)` | Category |
| :--- | :---: | :--- |
| `False`, `None` | `False` | Explicitly false / absent |
| `0`, `0.0` | `False` | Numeric zero |
| `""`, `[]`, `{}`, `()` | `False` | Empty containers |
| `"0"`, `[0]` | `True` | Non-empty values |

```python
for value in (False, None, 0, 0.0, "", [], {}, "0", [0]):
    print(repr(value), bool(value))
```

---

### 3. Converting and Combining

`bool(x)` uses the truthiness table. Logical operators `and`, `or`, and `not` work with booleans and return one of their operands.
In exercises, converting user input to bool requires care because any non-empty string is truthy.

```python
print(bool("False"))     # True (non-empty text)
print(bool(""))          # False
print(True and False)    # False
print(True or False)     # True
print(not True)          # False
```

---

## ⚠️ Gotchas & Pro Tips

1. **`bool('False')` is True** — Text is not parsed as a word here; only the empty string is falsy.
2. **`True == 1`** — Because `bool` subclasses `int`, equality with 1/0 holds; prefer `is True` only when you need the exact singleton.
3. **Empty vs non-empty containers** — `bool([])` is False but `bool([False])` is True; the container's length matters, not its contents.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
