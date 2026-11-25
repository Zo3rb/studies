# 📖 Lesson: What Is Functional Programming?

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0118. What Is Functional Programming?.mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

A precise definition of functional programming: building programs from pure functions, avoiding shared mutable state, and favoring expressions over step-by-step statements. How this contrasts with imperative programming, and why referential transparency makes code easier to test and reason about.

---

## 📝 Key Concepts

### 1. Declarative vs Imperative

Imperative code describes each step and mutates variables along the way. Functional code describes the relationship between input and output, letting Python handle the iteration.

```python
# Imperative: build the list step by step
squares = []
for n in range(5):
    squares.append(n * n)

# Functional: describe the result
squares = [n * n for n in range(5)]
```

---

### 2. Pure Functions and No Shared State

A pure function depends only on its arguments and changes nothing outside itself. Because it has no hidden dependencies, the same input always produces the same output.

```python
def area(width, height):
    return width * height

print(area(3, 4))  # 12
```

---

### 3. Referential Transparency

If a call can be replaced by its result without changing the program, the call is referentially transparent. This property makes reasoning, caching, and testing much simpler.

```python
total = area(3, 4) + area(3, 4)
print(total)  # 24
```

---

## ⚠️ Gotchas & Pro Tips

1. **Python is not a pure functional language** — Side effects such as `print` and file I/O are normal and useful; the goal is to keep core logic pure where practical.
2. **Immutability reduces surprises** — Copying or building new values instead of mutating a shared object avoids bugs caused by aliasing.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
