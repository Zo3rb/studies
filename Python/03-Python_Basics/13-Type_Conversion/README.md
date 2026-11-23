# 📖 Lesson: Type Conversion

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0023. Type Conversion.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson demonstrates explicit type conversion with `str()`, `int()`, and related constructors.
You convert numbers to text so they can be concatenated, then parse numeric text back into numbers for math.
`type()` is used after each conversion to verify the result.
The lesson sets up the common beginner bug where `input()` returns a string and must be converted.

---

## 📝 Key Concepts

### 1. The Conversion Constructors

Calling a type name as a function converts compatible values into that type.

| Call | Example | Result | Notes |
| :--- | :--- | :--- | :--- |
| `str(x)` | `str(36)` | `'36'` | Works for almost anything |
| `int(x)` | `int("36")` | `36` | Parses whole-number text |
| `float(x)` | `float("3.5")` | `3.5` | Parses decimal text |
| `bool(x)` | `bool(0)` | `False` | Applies truthiness rules |

```python
print(str(36), type(str(36)).__name__)
print(int("36"), type(int("36")).__name__)
print(float("3.5"), type(float("3.5")).__name__)
print(bool(0), bool("x"))
```

---

### 2. Parsing vs Truncating with `int()`

`int("42")` parses a string containing an integer. `int(42.9)` truncates a float toward zero, it does not round.
`int("42.9")` raises `ValueError`; convert to `float` first if decimal text is expected.

```python
print(int("42"))
print(int(42.9), int(-42.9))
try:
    int("42.9")
except ValueError as error:
    print("ValueError:", error)
print(int(float("42.9")))
```

---

### 3. Round-Tripping and Checking Types

Convert only at the boundary: keep numbers as numbers for calculations and convert to text only for display.
`type()` confirms the conversion succeeded, while `isinstance()` is better for conditional logic.

```python
age = 36
text_age = str(age)
rebuilt_age = int(text_age)
print(text_age, type(text_age).__name__)
print(rebuilt_age, isinstance(rebuilt_age, int))
print("Next year: " + str(rebuilt_age + 1))
```

---

## ⚠️ Gotchas & Pro Tips

1. **`bool('False')` is True** — Any non-empty string is truthy; only an empty string converts to `False`.
2. **Conversions can fail** — `int()` on non-numeric text raises `ValueError`; validate or use `try`/`except`.
3. **Conversion is not mutation** — `str(36)` returns a new string; the original integer is unchanged.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
