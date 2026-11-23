# 📖 Lesson: Math Functions

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0014. Math Functions.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson builds on arithmetic by introducing ready-made numeric tools.
You use built-ins such as `abs()`, `round()`, `pow()`, `min()`, `max()`, and `sum()`.
The `math` module adds `sqrt()`, `floor()`, `ceil()`, and the `pi` constant after `import math`.
The lesson also revisits modulo, floor division, and powers while printing each result.

---

## 📝 Key Concepts

### 1. Built-in Numeric Helpers

These functions work without an import and accept any suitable iterable or number.

| Function | Purpose | Example | Result |
| :--- | :--- | :--- | :--- |
| `abs(x)` | Absolute value | `abs(-8)` | `8` |
| `round(x, n)` | Round to `n` decimals | `round(3.14159, 2)` | `3.14` |
| `pow(x, y)` | Exponentiation | `pow(2, 5)` | `32` |
| `min(...)` / `max(...)` | Smallest / largest | `min(4, 1, 9)` | `1` |
| `sum(iterable)` | Add items | `sum([1, 2, 3])` | `6` |

```python
print(abs(-8))
print(round(3.14159, 2))
print(pow(2, 5), 2 ** 5)
print(min(4, 1, 9), max(4, 1, 9), sum([1, 2, 3]))
```

---

### 2. The `math` Module

`import math` exposes constants and functions that are not built in.
`sqrt()` returns a float; `floor()` and `ceil()` return integers.

```python
import math

print(math.pi)
print(math.sqrt(16))
print(math.floor(2.9), math.ceil(2.1))
print(math.gcd(12, 18))
```

---

### 3. Rounding and Operator Review

`round(x)` with no `ndigits` returns an integer; `round(x, 2)` returns a float with two decimal places.
Python rounds ties to the nearest even number ("banker's rounding").
`**`, `//`, and `%` remain available for power, floor division, and remainders.

```python
print(round(2.5), round(3.5))   # 2 and 4 (ties to even)
print(round(2.675, 2))          # 2.67: float representation matters
print(2 ** 10, 10 // 3, 10 % 3)
```

---

## ⚠️ Gotchas & Pro Tips

1. **`round(2.5)` is 2** — Python uses round-half-to-even, not the 'always round up' rule taught in school.
2. **`math.sqrt()` needs a number** — Passing a negative value raises `ValueError`; use `complex` math or check first.
3. **`sum()` expects an iterable** — `sum(1, 2, 3)` fails; write `sum([1, 2, 3])`.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
