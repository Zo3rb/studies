# 📖 Lesson: Python Interpreter

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/02-Python Introduction/0004. Python Interpreter.mp4`  
> **Module:** 02 — Python Introduction

---

## 🎯 What This Lesson Covers

This lesson demystifies what happens when you type `python3`: a program starts, reads your source, compiles it to bytecode, and executes that bytecode on the CPython virtual machine. It also contrasts the interactive REPL (read–eval–print loop) with running a `.py` file, and introduces the idea of alternative interpreters.

---

## 📝 Key Concepts

### 1. What "Python" Actually Is

Python is a **language specification**; CPython is the reference implementation most people mean when they say "Python". Other implementations include PyPy (JIT), Jython (JVM), and IronPython (.NET).

```python
import platform, sys
print(platform.python_implementation())  # CPython on most systems
print(sys.executable)                    # path to the running interpreter
```

### 2. Source → Bytecode → VM

```
hello.py  ──tokenize──>  AST  ──compile──>  bytecode  ──CPython VM──>  output
```

Bytecode is cached in `__pycache__/*.pyc` so repeated imports skip the parse step. You rarely manage these files manually — Python invalidates them when the source mtime/size changes.

### 3. Script Mode vs REPL Mode

| Mode | How it starts | Best for |
| :--- | :------------ | :------- |
| Script | `python3 app.py` | Real programs, repeatable runs, version control |
| REPL | `python3` then type expressions | Exploration, quick checks, learning semantics |
| `-c` | `python3 -c "print(1 + 1)"` | One-liners in shells and CI |

In the REPL, `_` holds the last displayed result — handy for quick arithmetic chains.

### 4. The Import System Is Part of the Runtime

`import math` searches `sys.path`, loads the module, executes it once, and caches the result in `sys.modules`. That caching is why module-level side effects happen only on the first import.

---

## ⚠️ Gotchas & Pro Tips

1. **Never name a file `math.py`, `random.py`, or `string.py`.** It can shadow the standard-library module and produce bizarre errors.
2. **The REPL lies about scope slightly.** Variables defined interactively live in `__main__`; restarting the interpreter clears everything.
3. **Version matters.** `python`, `python3`, and a virtualenv's `python` can be different executables; always check `sys.executable` when debugging "it works here" problems.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
