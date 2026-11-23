# 📖 Lesson: String Concatenation

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0022. String Concatenation.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This short lesson shows how the `+` operator joins two strings into a new string.
The example produces messages like `'Hello, Andrei'` and demonstrates that spaces must be included explicitly.
Mixing a string with a number raises a `TypeError`, which motivates the next lesson on type conversion.
Repetition with `*` is closely related and is useful for simple separators and masks.

---

## 📝 Key Concepts

### 1. Joining with `+`

`str + str` returns a new string with the right side appended to the left.
Order matters, and Python does not insert spaces automatically.

```python
first = "Hello,"
name = "Andrei"
message = first + " " + name
print(message)  # Hello, Andrei
```

---

### 2. Repetition with `*`

`str * int` repeats the string; `int * str` works too. A multiplier of 0 produces the empty string.
This is handy for separators such as `'=' * 40`.

```python
print("ha" * 3)
print("=" * 20)
print("x" * 0 == "")
```

---

### 3. Mixing Types Raises `TypeError`

Concatenation only accepts strings on both sides. A number must be converted first (`str(36)`) or inserted with an f-string.
Numeric-looking strings concatenate as text: `"1" + "2"` is `"12"`.

```python
print("1" + "2")     # "12", text concatenation
try:
    print("Age: " + 36)
except TypeError as error:
    print("TypeError:", error)
print("Age: " + str(36))
```

---

## ⚠️ Gotchas & Pro Tips

1. **Spaces are literal** — `"Hello," + "Andrei"` produces `Hello,Andrei`; add `" "` yourself.
2. **`+` creates a new string** — Strings are immutable, so concatenation returns a new object rather than changing either operand.
3. **Only `str` with `str`** — `+` does not coerce numbers for you; use `str()`, `format()`, or an f-string.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
