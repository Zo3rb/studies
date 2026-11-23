# 📖 Lesson: Section Review

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/05-Developer Environment/0096. Section Review.mp4`  
> **Module:** 05 — Developer Environment

---

## 🎯 What This Lesson Covers

A consolidated recap of the developer-environment module: verifying the Python install on macOS and Windows, choosing and configuring an editor, using the terminal confidently, formatting code consistently, and using Jupyter for exploration. The review reframes the tools as a single connected setup rather than a list of apps to install. It ends with a troubleshooting checklist you can reuse whenever a new machine or project appears.

---

## 📝 Key Concepts

### 1. Verification Checklist

Before writing course code, prove that the foundation works. On macOS/Linux check `python3 --version` and `python3 -m pip --version`; on Windows use `python --version`, `py -0`, and `python -m pip --version`. Then run a script from the terminal, open it in your editor, and confirm the editor's interpreter path matches `sys.executable` from the shell.

```python
import sys

print("version   :", sys.version.splitlines()[0])
print("executable:", sys.executable)
print("prefix    :", sys.prefix)
```

### 2. One Reproducible Setup per Project

The durable workflow is: create a virtual environment, select it in both editor and terminal, install dependencies with `python -m pip`, and record them in `requirements.txt`. Editor choice (Sublime Text, VS Code, or PyCharm) is interchangeable — what matters is that you can run, debug, and format the same code from any of them. Keep project settings that are portable and ignore machine-specific folders such as `.idea/` and `.venv/`.

```python
import importlib.util

required = ("pip", "venv")
for name in required:
    print(f"{name}: {'ok' if importlib.util.find_spec(name) else 'missing'}")
print("Freeze dependencies with: python -m pip freeze > requirements.txt")
```

### 3. Habits That Survive the Next Machine

Format with PEP 8 conventions (or Black) so code reads the same everywhere, and use notebooks only for exploration before moving logic into modules. When something breaks, work down the stack: wrong directory, wrong interpreter, package installed elsewhere, stale editor configuration, or unsaved file. Fix the layer, not the symptom.

```python
checks = [
    "Am I in the right directory? (pwd)",
    "Is the interpreter the one I expect? (sys.executable)",
    "Is the package installed in that interpreter? (python -m pip list)",
    "Did I save the file and restart the kernel/server?",
]
for number, item in enumerate(checks, 1):
    print(f"{number}. {item}")
```

---

## ⚠️ Gotchas & Pro Tips

1. **Tools are means, not goals** — do not keep installing editors and themes; settle on one setup and write Python.
2. **PATH problems return after upgrades** — re-run the verification commands after installing a new Python version or a new machine.
3. **Commit the small things** — a `.gitignore` for `.venv/`, `.idea/`, and `__pycache__/` prevents the environment from polluting the repository.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
