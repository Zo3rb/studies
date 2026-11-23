# 📖 Lesson: Python 2 vs Python 3

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/02-Python Introduction/0008. Python 2 vs Python 3.mp4`  
> **Module:** 02 — Python Introduction

---

## 🎯 What This Lesson Covers

A historical comparison that explains why Python 3 exists and what actually changed. The focus is on the breaking differences you may encounter in old tutorials: `print` became a function, division changed meaning, text/bytes were separated, and `range()` replaced `xrange()`.

---

## 📝 Key Concepts

### 1. `print` Statement → `print()` Function

```python
# Python 2 (legacy)
print "Hello"

# Python 3 (this course)
print("Hello")
print("a", "b", sep="-")  # functions accept keyword options
```

Because `print` is a function in Python 3, it can be passed around, wrapped, and given extra arguments.

### 2. Division Changed

```python
print(7 / 2)   # 3.5 in Python 3; 3 in Python 2
print(7 // 2)  # 3 in both — floor division
```

Python 3 made true division the default; use `//` when you explicitly want truncation toward negative infinity.

### 3. Text vs Bytes

| Python 2 | Python 3 | Meaning |
| :------- | :------- | :------ |
| `str` | `str` | Unicode text |
| `unicode` | *(merged into `str`)* | Explicit Unicode text |
| — | `bytes` | Raw 8-bit data |

```python
text = "café"          # str — characters
raw = text.encode("utf-8")  # bytes — storage / network
print(raw)              # b'cafÃ©'
```

Mixing text and bytes without encoding is a `TypeError` in Python 3 — deliberately loud, because silent decoding caused countless bugs.

### 4. Iteration Cleanup

- `xrange()` → `range()` (lazy in Python 3; no list allocated).
- `.iteritems()` → `.items()` on dictionaries.
- `raw_input()` → `input()` (always returns `str`).

### 5. Why the Split Happened

Python 2 carried design compromises from the 1990s. Python 3 fixed them but broke backward compatibility; the migration took roughly a decade. Python 2 reached end-of-life on 2020-01-01.

---

## ⚠️ Gotchas & Pro Tips

1. **Old StackOverflow answers often use Python 2.** Check the date and translate: add parentheses to `print`, use `//` for integer results, and drop `u"..."` prefixes.
2. **`/` surprises ported code.** If you need Python 2-style truncation, write `a // b` explicitly and comment why.
3. **Never open binary files in text mode.** Use `"rb"` / `"wb"` to get `bytes`; text mode decodes using an encoding you should specify explicitly.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
