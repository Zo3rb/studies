# 📖 Lesson: Numbers

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0013. Numbers.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

The lesson focuses on Python's two main numeric types: `int` and `float`.
You perform arithmetic with `+`, `-`, `*`, `/`, `//`, `%`, and `**`, then print the results.
Special attention goes to division always returning a float, floor division, and the modulo operator.
`type()` checks confirm which numeric type each operation produces.

---

## 📝 Key Concepts

### 1. Integers and Floats

`int` is a whole number with arbitrary precision; `float` is an IEEE-754 double-precision number.
Python accepts underscores in large literals and exponent notation for floats.

| Literal | Meaning | Type |
| :--- | :--- | :--- |
| `1_000_000` | Readable large integer | `int` |
| `1e3` | 1000.0 in scientific notation | `float` |
| `7 / 2` | True division | `float` |

```python
big = 1_000_000
scientific = 1e3
print(big, type(big).__name__)
print(scientific, type(scientific).__name__)
```

---

### 2. Arithmetic Operators

Python uses familiar math symbols plus a few extras. The result type follows the operation.

| Operator | Name | Example | Result |
| :--- | :--- | :--- | :--- |
| `+` | Addition | `7 + 3` | `10` |
| `-` | Subtraction | `7 - 3` | `4` |
| `*` | Multiplication | `7 * 3` | `21` |
| `/` | True division | `7 / 2` | `3.5` |
| `//` | Floor division | `7 // 2` | `3` |
| `%` | Modulo (remainder) | `7 % 2` | `1` |
| `**` | Exponentiation | `2 ** 3` | `8` |

```python
print(7 + 3, 7 - 3, 7 * 3)
print(7 / 2, 7 // 2, 7 % 2, 2 ** 3)
```

---

### 3. Division, Floor Division, and Modulo

`/` always returns a `float`, even when the answer is whole (`4 / 2` is `2.0`).
`//` floors the quotient (rounds toward negative infinity). `%` returns the remainder; `divmod(a, b)` gives both at once.

```python
print(4 / 2, type(4 / 2).__name__)
print(-7 // 2)      # -4, floor not truncation
print(divmod(17, 5))  # (3, 2)
```

---

## ⚠️ Gotchas & Pro Tips

1. **Negative floor division surprises** — `-7 // 2` is `-4`, not `-3`, because floor means toward negative infinity.
2. **Float precision** — `0.1 + 0.2` prints `0.30000000000000004`; use `round()` or `decimal` for money.
3. **Division by zero** — `/`, `//`, and `%` with a zero divisor raise `ZeroDivisionError`.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
