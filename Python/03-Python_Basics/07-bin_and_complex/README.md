# 📖 Lesson: Optional: bin() and complex

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0017. Optional - bin() and complex.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This optional lesson looks behind decimal numbers at how integers are represented in binary.
`bin()` returns a string with a `0b` prefix, and `int(binary_string, 2)` converts it back to decimal.
It also introduces the `complex` numeric type using `j` for the imaginary part.
The goal is to demystify memory representation while adding two less common tools to your toolkit.

---

## 📝 Key Concepts

### 1. `bin()` and Binary Strings

`bin(n)` does not return a number; it returns a `str` such as `'0b1010'`.
You can pad the bits with `format(n, '08b')`, and parse binary text back with `int(text, 2)`.

```python
bits = bin(10)
print(bits, type(bits).__name__)   # 0b1010 str
print(format(10, "08b"))           # 00001010
print(int("1010", 2))              # 10
```

---

### 2. The `complex` Type

Python has a built-in `complex` type written as `real + imag j` (engineers use `j`, not `i`).
Use `.real`, `.imag`, and `abs()` for the magnitude; `complex(3, 4)` builds the same value.

```python
z = 3 + 4j
print(z, type(z).__name__)
print(z.real, z.imag, abs(z))
print(complex(3, 4) == z)
print(z + 1j)
```

---

### 3. Why Binary Matters

A single bit is 0 or 1; eight bits make a byte. Powers of two explain ranges such as 0-255 for one unsigned byte.
Python's bitwise operators (`&`, `|`, `^`, `<<`, `>>`) work directly on integer bit patterns.

```python
print(5 & 3)    # 1  (0101 & 0011)
print(5 | 3)    # 7  (0101 | 0011)
print(1 << 4)   # 16 (shift left)
print(16 >> 2)  # 4  (shift right)
```

---

## ⚠️ Gotchas & Pro Tips

1. **`bin()` returns text** — The `0b` prefix is part of the string; you cannot do arithmetic on it until you call `int(..., 2)`.
2. **Use `j`, not `i`** — `3 + 4i` is invalid Python; the imaginary unit is `j` or `J`.
3. **Negative binary looks different** — `bin(-5)` returns `'-0b101'`; it is a sign-and-magnitude string, not two's-complement bytes.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
