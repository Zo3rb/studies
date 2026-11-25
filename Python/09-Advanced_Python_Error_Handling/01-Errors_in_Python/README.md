# 📖 Lesson: Errors in Python

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/09-Advanced Python - Error Handling/0135. Errors in Python.mp4`  
> **Module:** 09 — Advanced Python: Error Handling

---

## 🎯 What This Lesson Covers

What happens when Python cannot finish an operation, and how that differs from code that cannot even be parsed. The exception hierarchy from `BaseException` down to familiar built-ins such as `ValueError` and `KeyError`. How to read a traceback from the bottom up so the real failure is not hidden by the surrounding call stack.

---

## 📝 Key Concepts

### 1. Syntax Errors vs Exceptions

A `SyntaxError` is raised by the parser before any code runs, so no `try` block in the same file can catch it. An exception is a runtime problem: the code is valid, but an operation fails and, if uncaught, ends the program.

```python
def divide(a, b):
    return a / b

divide(1, 0)  # ZeroDivisionError: division by zero
```

---

### 2. The Exception Hierarchy

Exceptions are classes. `BaseException` is the root; `Exception` is the parent of nearly every error you should catch. `SystemExit`, `KeyboardInterrupt`, and `GeneratorExit` inherit directly from `BaseException` so that a broad `except Exception` will not swallow them.

```python
print(issubclass(ValueError, Exception))         # True
print(issubclass(KeyboardInterrupt, Exception))  # False
```

---

### 3. Common Built-in Exceptions

Python raises specific types for specific mistakes: `ValueError` for a correct type with a bad value, `TypeError` for an inappropriate type, `KeyError` for a missing dictionary key, `IndexError` for an out-of-range sequence index, `ZeroDivisionError` for division by zero, and `FileNotFoundError` for a missing file.

```python
lookup = {"a": 1}
print(lookup.get("b", 0))  # 0 — no KeyError
```

---

### 4. Tracebacks Are Read Bottom-Up

A traceback lists the call stack from outermost frame to innermost. The last line contains the exception type and message, and the frame directly above it points at the exact line that failed.

```pycon
>>> int("oops")
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: invalid literal for int() with base 10: 'oops'
```

---

## ⚠️ Gotchas & Pro Tips

1. **A syntax error cannot be caught at runtime** — the whole module fails to compile before any handler exists; fix the source instead.
2. **Read the last line first** — the final `SomeError: message` tells you what went wrong; the frames above show how execution reached it.
3. **Do not catch `BaseException` by habit** — it also captures `KeyboardInterrupt`, which makes a program hard to stop with Ctrl+C.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
