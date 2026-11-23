# 📖 Lesson: Optional - Terminal Commands

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/05-Developer Environment/0090. Optional - Terminal Commands.mp4`  
> **Module:** 05 — Developer Environment

---

## 🎯 What This Lesson Covers

A practical survival kit for the terminal (with a macOS/Linux flavour): what a shell prompt means, how to move around the filesystem, and how to inspect and manipulate files without a GUI. The lesson covers `pwd`, `ls`, `cd`, `mkdir`, `touch`, `cp`, `mv`, `rm`, and the `man` pages, then maps those ideas back to Python's `pathlib` module. It is marked optional because you can complete the course with only a few commands — but they make everything faster.

---

## 📝 Key Concepts

### 1. The Prompt and the Directory Tree

A prompt such as `ali@MacBook ~ %` shows the user, machine, and current directory; `~` is your home, `/` is the filesystem root, `.` is here, and `..` is the parent. Use `pwd` ("print working directory") whenever you feel lost, `cd <path>` to move, and `cd` alone to return home. Paths with spaces must be quoted or escaped.

```python
from pathlib import Path

print("Home:       ", Path.home())
print("Current:    ", Path.cwd())
print("Parent:     ", Path.cwd().parent)
```

### 2. Looking Around: `ls` and `man`

`ls -lah` is the most useful listing: long format, all entries including dotfiles, and human-readable sizes. `ls -lt` sorts by modification time and `ls -R` descends recursively. For any command, `man <command>` opens the manual; press `q` to quit, `/word` to search, and `h` for navigation help. `--help` is the quicker built-in summary for most GNU tools.

```python
from pathlib import Path

entries = sorted(Path(".").iterdir())
for entry in entries[:5]:
    kind = "dir" if entry.is_dir() else "file"
    print(f"  {kind:<3} {entry.name}")
```

### 3. Creating, Moving, and Removing

`mkdir -p projects/demo` creates nested directories without complaining if they exist; `touch notes.txt` creates an empty file or updates its timestamp; `cp -r src dest` copies recursively; `mv` renames or moves; and `rm -i` asks before deleting. Avoid `rm -rf` unless you have double-checked the exact path — there is no recycle bin in the shell.

```python
from pathlib import Path

target = Path("projects") / "demo"
print("Planned path:", target)
print("Exists right now:", target.exists())
print("Python equivalent: target.mkdir(parents=True, exist_ok=True)")
```

---

## ⚠️ Gotchas & Pro Tips

1. **`rm` is permanent** — prefer `rm -i`, and never run a destructive command built from an unquoted variable or wildcard you have not listed first with `ls`.
2. **Case sensitivity** — macOS filesystems are usually case-insensitive by default while Linux is not; `File.py` and `file.py` are the same file on a Mac but two files on Linux.
3. **Quote paths with spaces** — `cd "My Projects"` works; `cd My Projects` is interpreted as two arguments.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
