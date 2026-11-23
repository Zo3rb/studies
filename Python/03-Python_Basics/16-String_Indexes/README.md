# 📖 Lesson: String Indexes

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0026. String Indexes.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

Strings are ordered collections of characters, so each character has an index.
The lesson covers zero-based positive indexes, negative indexes from the end, and slicing with start, stop, and step.
Negative steps reverse a string, which is one of the most useful slice idioms.
`IndexError` versus silent slice clamping is an important practical distinction.

---

## 📝 Key Concepts

### 1. Positive and Negative Indexes

`text[0]` is the first character; `text[-1]` is the last. Out-of-range single indexes raise `IndexError`.
Indexing returns a new one-character string, not a mutable slot.

| Expression | On `"Python"` | Result |
| :--- | :--- | :--- |
| `text[0]` | first char | `'P'` |
| `text[2]` | third char | `'t'` |
| `text[-1]` | last char | `'n'` |
| `text[10]` | too far | `IndexError` |

```python
text = "Python"
print(text[0], text[2], text[-1])
try:
    print(text[10])
except IndexError as error:
    print("IndexError:", error)
```

---

### 2. Slicing `[start:stop:step]`

A slice returns a new string from `start` inclusive to `stop` exclusive, moving by `step`.
Omitted parts default to beginning, end, and 1. Out-of-range slice bounds are clipped rather than raising an error.

```python
text = "Python Basics"
print(text[0:6])     # Python
print(text[7:])      # Basics
print(text[:6])      # Python
print(text[::2])     # every second character
print(text[2:10])    # clipped safely
```

---

### 3. Reversing and Iterating

`text[::-1]` walks backward and is the idiomatic reverse.
Use `for char in text` to visit characters, or `enumerate(text)` when you also need the position.

```python
text = "Python"
print(text[::-1])
for index, char in enumerate(text):
    print(index, char, end=" | ")
print()
print(text.index("th"))
```

---

## ⚠️ Gotchas & Pro Tips

1. **`stop` is exclusive** — `text[0:6]` includes indexes 0 through 5; `text[:len(text)]` copies the whole string.
2. **Slices clamp, indexes fail** — `text[100:200]` returns `''`, but `text[100]` raises `IndexError`.
3. **Unicode nuances** — Python indexes Unicode code points; combining marks or emoji sequences may not match visual characters.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
