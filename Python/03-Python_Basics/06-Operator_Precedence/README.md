# 📖 Lesson: Operator Precedence

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0016. Operator Precedence.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson applies the same precedence rules you learned in math class to Python expressions.
Parentheses come first, then exponentiation, then multiplication/division, then addition/subtraction.
Examples such as `20 - 3 + 5` and `20 + 3 * 4` show why the order of operations matters.
The lesson also demonstrates how parentheses make intent explicit and override the default order.

---

## 📝 Key Concepts

### 1. The Precedence Ladder

Python evaluates higher-precedence operators first. Operators on the same row share precedence and are evaluated left to right (except `**`).

| Priority | Operators | Example | Value |
| :---: | :--- | :--- | :--- |
| 1 | `()` | `(2 + 3) * 4` | `20` |
| 2 | `**` | `2 ** 3` | `8` |
| 3 | `*`, `/`, `//`, `%` | `2 + 3 * 4` | `14` |
| 4 | `+`, `-` | `20 - 3 + 5` | `22` |

```python
print(20 - 3 + 5)      # (20 - 3) + 5 = 22
print(20 + 3 * 4)      # 20 + (3 * 4) = 32
print((20 + 3) * 4)    # 92, parentheses override
```

---

### 2. Associativity

Most arithmetic operators are left-associative: `8 / 4 / 2` is `(8 / 4) / 2`.
Exponentiation is right-associative: `2 ** 3 ** 2` means `2 ** (3 ** 2)`, not `(2 ** 3) ** 2`.

```python
print(8 / 4 / 2)       # 1.0
print(2 ** 3 ** 2)     # 512
print((2 ** 3) ** 2)   # 64
```

---

### 3. Precedence Beyond Arithmetic

Comparisons bind less tightly than arithmetic, and logical operators sit below comparisons.
That is why `x + 1 > 5` evaluates `x + 1` first. Use parentheses whenever the expression gets hard to read.

```python
x = 4
print(x + 1 > 5)          # True: (x + 1) > 5
print(not (x > 5))        # True
print(x > 2 and x < 10)   # True
```

---

## ⚠️ Gotchas & Pro Tips

1. **`-2 ** 2` is `-4`** — Exponentiation binds tighter than unary minus: it means `-(2 ** 2)`. Write `(-2) ** 2` for `4`.
2. **Same-row operators are left-to-right** — `12 // 5 * 2` is `(12 // 5) * 2`, not `12 // (5 * 2)`.
3. **Parentheses are free** — Add them for readability even when the default precedence already gives the result you want.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
