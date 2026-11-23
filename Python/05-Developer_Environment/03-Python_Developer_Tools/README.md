# 📖 Lesson: Python Developer Tools

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/05-Developer Environment/0088. Python Developer Tools.mp4`  
> **Module:** 05 — Developer Environment

---

## 🎯 What This Lesson Covers

A tour of the pieces that make up a Python development environment and how they fit together: the interpreter, a code editor or IDE, the terminal, `pip`, and virtual environments. The lesson explains what each tool is responsible for so you can choose an editor based on workflow rather than popularity. It sets up the tool-specific lessons that follow (Sublime Text, VS Code, and PyCharm).

---

## 📝 Key Concepts

### 1. The Five Pieces of the Setup

A working environment has distinct layers. The **interpreter** executes code; the **editor/IDE** helps you write it; the **terminal** launches scripts and manages the machine; **pip** installs third-party packages; and a **virtual environment** keeps each project's dependencies separate. Confusing these layers is the source of most "it works in my editor but not in the terminal" problems.

```python
import sys

print(f"Interpreter in use: {sys.executable}")
print(f"Python version    : {sys.version.splitlines()[0]}")
```

### 2. Editor, IDE, or Terminal-Only?

A lightweight editor such as Sublime Text is fast and relies on the terminal for execution. VS Code adds an extension ecosystem, integrated terminal, and debugging in one window. PyCharm is a full IDE with refactoring, inspections, and project management built in. All three can run the same code — the right choice is whichever keeps you writing Python without friction.

```python
import shutil

editors = ("subl", "code", "pycharm", "charm")
for editor in editors:
    print(f"{editor:<10} -> {shutil.which(editor) or 'not on PATH'}")
```

### 3. One Interpreter per Project

Point your editor at the same interpreter you use in the terminal. Create an environment with `python -m venv .venv`, install into it with `python -m pip install <package>`, and select that interpreter inside the editor. This makes the project reproducible with a `requirements.txt` and avoids polluting the system Python.

```python
import importlib.util

for module in ("venv", "pip", "ensurepip"):
    print(f"{module:<10} available: {importlib.util.find_spec(module) is not None}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **An editor is not an interpreter** — installing VS Code or PyCharm does not install Python; verify `python --version` independently.
2. **Match editor and terminal interpreters** — a mismatch explains most "module not found" errors inside an IDE.
3. **You do not need every tool** — pick one editor and learn it deeply; the remaining lessons are comparisons, not mandatory installs.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
