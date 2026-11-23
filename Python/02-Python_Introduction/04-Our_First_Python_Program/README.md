# 📖 Lesson: Our First Python Program

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/02-Python Introduction/0006. Our First Python Progam.mp4`  
> **Module:** 02 — Python Introduction

---

## 🎯 What This Lesson Covers

The traditional first program: print a greeting, then make it slightly personal with a variable and a formatted string. Beyond the famous one-liner, this lesson establishes the shape of every Python script you will write — imports, values, expressions, and `print()` calls executed top to bottom.

---

## 📝 Key Concepts

### 1. `print()` Is a Function

```python
print("Hello, World!")
print("Two values:", 2, "three")  # spaces inserted automatically
```

`print()` accepts any number of objects, converts each with `str()`, separates them with `sep=' '` by default, and ends with a newline (`end='\n'`).

### 2. Variables Make the Program Reusable

```python
name = "World"
print(f"Hello, {name}!")
```

The f-string (formatted string literal) is evaluated at runtime and is the preferred formatting tool in modern Python.

### 3. Top-to-Bottom Execution

Python executes statements in source order:

```python
greeting = "Hi"       # 1. bind name
greeting = greeting + " there"  # 2. rebind name
print(greeting)       # 3. observe result
```

There is no separate compile-and-run button for a script — the runtime compiles the whole file first, then executes sequentially.

### 4. The Shape of a Small Script

```python
#!/usr/bin/env python3
'''One-line description.'''

import sys


def main():
    print("...")


if __name__ == "__main__":
    main()
```

This pattern is used throughout the repository: it makes files importable without running their logic.

---

## ⚠️ Gotchas & Pro Tips

1. **`print()` returns `None`.** `x = print("hi")` prints then binds `None` to `x` — a classic beginner surprise.
2. **Assignment is naming, not copying into a box.** `a = b` makes `a` refer to the same object `b` refers to; this matters later with lists and dicts.
3. **The source filename has a typo** (`Progam`). The README preserves it so you can find the video, but the study folder uses the correct spelling.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
