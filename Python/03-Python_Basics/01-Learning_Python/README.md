# 📖 Lesson: Learning Python

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0011. Learning Python.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

Python is introduced as a high-level, interpreted language that emphasizes readability and fast experimentation.
The lesson contrasts the interactive REPL (immediate feedback) with `.py` script files (reusable programs).
You see `print()` produce output, expressions evaluate to values, and `type()` reveal what kind of data you are holding.
The goal is to store, retrieve, and act on data while building good habits from the very first line.

---

## 📝 Key Concepts

### 1. Python, the REPL, and Scripts

Python source is executed by an interpreter (CPython compiles to bytecode, then runs it).
Two everyday workflows are:

| Workflow | Best for | Example |
| :--- | :--- | :--- |
| REPL / interactive shell | Quick experiments, syntax checks, inspecting values | `>>> 2 + 3` |
| `.py` script file | Reusable programs you can save and run again | `python3 hello.py` |

The REPL echoes the value of the last expression, which makes it ideal for learning.

```pycon
>>> 2 + 3
5
>>> print("Hello, Python!")
Hello, Python!
```

---

### 2. Values, Types, and `type()`

Every value in Python has a type. `type()` is the simplest way to inspect it.
Python is dynamically typed: you do not declare a variable's type, the value determines it.

| Value | Type | `type()` result |
| :--- | :--- | :--- |
| `42` | integer | `<class 'int'>` |
| `3.14` | float | `<class 'float'>` |
| `'Andrei'` | string | `<class 'str'>` |
| `True` | boolean | `<class 'bool'>` |

```python
samples = (42, 3.14, "Andrei", True)
for value in samples:
    print(value, "->", type(value).__name__)
```

---

### 3. Statements, Variables, and the Data Workflow

An assignment statement binds a name to a value so you can reuse it.
`print()` is a function call that displays text; string concatenation (covered later) can build messages.
Most beginner programs follow the same rhythm: create data, store it in names, then display or transform it.

```python
name = "Andrei"
message = "Hello, " + name
print(message)
print(message.upper())
```

---

## ⚠️ Gotchas & Pro Tips

1. **Use Python 3** — `print` is a function in Python 3; `print 'x'` is a Python 2 syntax error. Always run `python3`.
2. **The REPL underscore** — In CPython's REPL, `_` holds the last displayed expression result; it is not a normal variable to rely on in scripts.
3. **`print()` adds a newline** — By default `print()` ends with `\n`; pass `end=''` to suppress it when needed.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
