# 📖 Lesson: Code Formatting - PEP 8

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/05-Developer Environment/0094. Code Formatting - PEP 8.mp4`  
> **Module:** 05 — Developer Environment

---

## 🎯 What This Lesson Covers

PEP 8, Python's style guide, and why readable consistency matters more than personal preference. We look at concrete rules — four-space indentation, line length, blank lines, naming conventions, whitespace, and imports — then automate them with formatters and linters available in the editor and from the terminal. The goal is code that looks the same across every project and tool.

---

## 📝 Key Concepts

### 1. Layout Rules That Matter Most

PEP 8 recommends four spaces per indentation level (never tabs), lines no longer than 79 characters, and two blank lines around top-level functions and classes. Keep trailing whitespace out, end files with a single newline, and break long expressions with parentheses rather than backslashes. Consistency inside a project wins over any individual rule.

```python
# Before: two-space indent, no spacing, no blank lines
def greet(name):
  print("hi "+name)

# After: four spaces, f-string, spacing, descriptive name
def greet(name):
    print(f"Hi, {name}!")
```

### 2. Naming, Whitespace, and Imports

Use `snake_case` for variables, functions, and modules; `CamelCase` for classes; and `UPPER_CASE` for constants. Put spaces around `=` and after commas, but not inside parentheses or immediately before a colon. Imports go at the top, grouped as standard library, third-party, then local, with a blank line between groups.

```python
import os
import sys

# third-party imports would go here

MAX_RETRIES = 3


def build_url(host, port):
    return f"{host}:{port}"
```

### 3. Let Tools Do the Reformatting

Run `python -m black .` or `python -m autopep8 --in-place -r .` to rewrite layout automatically, and `python -m flake8 .` to report remaining violations. Black deliberately uses an 88-character line limit, which conflicts with PEP 8's 79; either accept Black's style wholesale or configure a linter to match. Enable format-on-save in VS Code or use PyCharm's reformat shortcut (`Ctrl/Cmd + Alt + L`).

```python
line = "x = " + "y" * 90  # flake8 flags over-long lines (E501)
# Better: break it up rather than fighting the linter.
parts = ["x = ", "y" * 90]
line = "".join(parts)
```

---

## ⚠️ Gotchas & Pro Tips

1. **Black vs PEP 8 line length** — Black defaults to 88 characters, so configure `max-line-length = 88` in Flake8 instead of letting two tools disagree.
2. **Formatters do not fix logic** — they only change layout; readable names, functions, and comments are still your job.
3. **Do not mix tabs and spaces** — Python 3 raises a `TabError`; configure the editor to convert tabs to four spaces on save.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
