# 📖 Lesson: PyCharm

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/05-Developer Environment/0093. PyCharm.mp4`  
> **Module:** 05 — Developer Environment

---

## 🎯 What This Lesson Covers

Creating a first project in PyCharm Community, choosing or creating the project interpreter, and running code through a run configuration. The lesson highlights the IDE features that differ from a plain editor — code completion, inspections, refactoring, an integrated terminal, and Git integration — plus the project files that should stay out of version control.

---

## 📝 Key Concepts

### 1. New Project and Base Interpreter

On the welcome screen choose **New Project**, pick a location, and expand **Python interpreter**. Selecting **New environment using Virtualenv** creates a `.venv` folder inside the project; **Previously configured interpreter** reuses an existing Python. PyCharm then indexes the project and the selected interpreter's packages, which is why completion knows about installed libraries.

```python
import sys

print(f"Project interpreter: {sys.executable}")
print(f"Version: {sys.version.splitlines()[0]}")
```

### 2. Run Configurations

Right-click a file and choose **Run 'filename'** or press `Shift + F10`; PyCharm creates a run configuration containing the script path, interpreter, and working directory. Edit it via **Run → Edit Configurations** when a script reads files from a different folder or needs command-line arguments. The Run tool window shows output and a clickable traceback that jumps straight to the failing line.

```python
def add(left: int, right: int) -> int:
    """Small function to try PyCharm's inspections and refactoring."""
    return left + right


if __name__ == "__main__":
    print(add(2, 3))
```

### 3. IDE Productivity and Project Files

Use `Ctrl/Cmd + B` to jump to a definition, `Shift + F6` to rename safely across the project, and the integrated terminal for `python -m pip install` using the same interpreter. PyCharm stores its settings in `.idea/`; add `.idea/` and `.venv/` to `.gitignore` so only source code is committed. The Community edition is free and sufficient for this course; Professional adds web-framework and database tooling.

```python
ignore_entries = [".idea/", ".venv/", "__pycache__/"]
print("\n".join(f"{entry}  <- keep out of git" for entry in ignore_entries))
```

---

## ⚠️ Gotchas & Pro Tips

1. **Opening an existing folder** — PyCharm may not mark it as a Python project automatically; set the interpreter and mark the source root so completion works.
2. **Two pythons again** — the interpreter shown in the status bar and the one in the integrated terminal should match; if not, reselect it in *Settings → Project → Python Interpreter*.
3. **Large first index** — the initial indexing or virtualenv creation can take a minute; it is a one-time cost per project.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
