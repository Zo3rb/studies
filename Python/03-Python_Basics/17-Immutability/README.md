# 📖 Lesson: Immutability

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0027. Immutability.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson reinforces string slicing and then explains immutability: once created, a string's characters cannot be modified.
Attempting `text[0] = 'J'` raises a `TypeError`, and methods such as `replace()` return new strings instead of changing the original.
Reassigning a variable to the result makes it look changed, but a new object was created.
The lesson hints at memory implications and contrasts strings with mutable lists.

---

## 📝 Key Concepts

### 1. Strings Cannot Be Mutated

Square-bracket assignment is not supported for strings. Every string operation that appears to change text actually builds a new string.
This is why `text = text.replace("a", "b")` is the correct pattern.

```python
text = "cat"
try:
    text[0] = "b"
except TypeError as error:
    print("TypeError:", error)
new_text = text.replace("c", "b")
print(text, new_text)
```

---

### 2. Rebinding vs Mutating

A variable name can be pointed at a new object without touching the old one.
If two names refer to the same string, rebinding one leaves the other unchanged because the original object still exists.

```python
a = "hello"
b = a
a = a.upper()
print(a, b)           # HELLO hello
print(a is b)         # False
```

---

### 3. Why Immutability Helps

Immutable values can be safely shared and used as dictionary keys because they cannot change unexpectedly.
Building text in a loop with `+=` creates many intermediate strings; for larger jobs, collect pieces in a list and `''.join()` them.

```python
pieces = []
for word in ("Python", "is", "fun"):
    pieces.append(word)
sentence = " ".join(pieces)
print(sentence)
print(hash("key"))  # strings are hashable (value shown is CPython-dependent)
```

---

## ⚠️ Gotchas & Pro Tips

1. **Methods return new strings** — `upper()`, `lower()`, `replace()`, and `strip()` do not change the original; assign their result.
2. **`+=` on a string rebinds** — `s += 'x'` creates a new string and points `s` at it; it is not an in-place edit.
3. **Lists are the mutable contrast** — `items[0] = 'x'` is valid for a list, which is why aliasing matters more there.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
