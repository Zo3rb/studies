# 📖 Lesson: Using the Command Line - Terminal

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/05-Developer Environment/0091. Using the Command Line - Terminal.mp4`  
> **Module:** 05 — Developer Environment

---

## 🎯 What This Lesson Covers

Using the terminal as the primary way to run Python: opening a shell in your project folder, executing scripts with `python script.py` (or `python3 script.py` on macOS/Linux), and understanding what the shell does before Python starts. We connect `cd`, the current working directory, `sys.argv`, and relative paths, then look at the interactive REPL and at installing packages through `python -m pip`.

---

## 📝 Key Concepts

### 1. Running a Script From the Shell

The shell locates the interpreter, starts it, and passes the script path plus any extra arguments. From your project directory run `python3 hello.py` on macOS/Linux or `python hello.py` on Windows; add arguments with `python3 hello.py Alice`. Inside Python, `sys.argv[0]` is the script path and `sys.argv[1:]` are the arguments. Re-run the script after every edit — the terminal never caches your code.

```python
import sys

print("Arguments received:", sys.argv[1:] or "(none)")
print("Script path (argv[0]):", sys.argv[0])
```

### 2. Working Directory Determines Relative Paths

A relative path is resolved against the shell's current directory, not against where the editor keeps the file. If a script opens `data.txt`, run it from the folder containing that file, or build paths from `Path(__file__).parent` so the script works from anywhere. `cd`, `ls`, and `pwd` are therefore part of debugging, not just navigation.

```python
from pathlib import Path

here = Path(__file__).resolve().parent
print("Script directory:", here)
print("Relative to it  :", here / "data.txt")
print("cwd             :", Path.cwd())
```

### 3. The REPL and pip From the Command Line

Typing `python3` with no arguments opens the interactive interpreter: type expressions, see results immediately, and exit with `exit()` or `Ctrl+D`. The same command-line habit applies to packages — `python3 -m pip install requests` installs into the interpreter you named, which is safer than a bare `pip install`. Press `Ctrl+C` to stop a running script; an activated virtual environment changes the `python` that the shell finds.

```python
import sys

print(f"Interactive? {hasattr(sys, 'ps1')}")
print(f"Use: {sys.executable} -m pip install <package>")
```

---

## ⚠️ Gotchas & Pro Tips

1. **"No such file or directory"** — usually you are in the wrong folder; run `pwd` and `ls` before blaming the script.
2. **`python` vs `python3`** — Windows typically uses `python`, macOS/Linux `python3`; use whichever matches the interpreter you installed.
3. **Environment activation is per shell** — activating a venv in one terminal tab does not activate it in another, and closing the tab discards the activation.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
