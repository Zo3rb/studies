# 📖 Lesson: Pure Functions

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0119. Pure Functions.mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

The defining properties of a pure function: deterministic output and no observable side effects. Why mutating an argument, printing, or reading global state makes a function impure, and how purity pays off in testing, caching, and parallel work.

---

## 📝 Key Concepts

### 1. Deterministic Output

Given the same arguments, a pure function always returns the same value. It does not consult the clock, randomness, or changing global variables.

```python
def add(a, b):
    return a + b

print(add(2, 3))  # 5
```

---

### 2. No Side Effects

A pure function leaves everything outside itself untouched: no printing, no writing to files, and no mutation of arguments or globals. Return data and let the caller handle output.

```python
def impure(items):
    items.append(99)  # mutates the caller's list
    return len(items)

def pure(items):
    return len(items) + 1  # leaves items unchanged
```

---

### 3. Referential Transparency in Practice

Because a pure call can be swapped for its result, you can memoize it, reorder calls, or test it with a single assertion instead of setting up elaborate state.

```python
def cube(x):
    return x ** 3

assert cube(3) == 27
print(cube(3))  # 27
```

---

## ⚠️ Gotchas & Pro Tips

1. **Printing is a side effect** — A function that prints is not pure even if it returns a value; return the string and let the caller decide.
2. **Clock and randomness are impure** — `random.random()` and `datetime.now()` read changing state; pass a seed or timestamp in as an argument when determinism matters.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
