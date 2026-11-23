# 📖 Lesson: How To Run Python Code

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/02-Python Introduction/0005. How To Run Python Code.mp4`  
> **Module:** 02 — Python Introduction

---

## 🎯 What This Lesson Covers

A hands-on lesson covering the three practical ways to execute Python: save code in a `.py` file and run it, pass a one-liner with `-c`, or experiment in the interactive interpreter. It also explains the command-line contract — the shell locates an executable, passes arguments in `sys.argv`, and receives an exit status when the process ends.

---

## 📝 Key Concepts

### 1. Script Mode

```bash
python3 hello.py
python3 hello.py Alice 42
```

Inside `hello.py`:

```python
import sys
print(sys.argv)  # ['hello.py', 'Alice', '42'] — all strings
```

`sys.argv[0]` is the script path; arguments start at index 1 and are always strings, even when they look numeric.

### 2. One-Liner Mode (`-c`)

```bash
python3 -c "print('Quick check:', 6 * 7)"
```

Useful in shell pipelines and CI checks, but unreadable beyond a single expression.

### 3. Interactive Mode (REPL)

```bash
python3
>>> 2 ** 10
1024
>>> exit()
```

Great for probing behavior: "What does `'abc' * 3` do?" — no file needed.

### 4. Modules with `-m`

```bash
python3 -m http.server 8000
python3 -m pytest
```

`-m` runs a module as a script. This is how most Python tools are launched and is a key reason virtual environments matter.

### 5. Exit Status

```python
import sys
sys.exit(0)  # success
sys.exit(1)  # failure — shells and CI read this
```

An uncaught exception also produces a non-zero exit status.

---

## ⚠️ Gotchas & Pro Tips

1. **Use `python3`, not `python`, on Linux/macOS** unless you know what `python` points to. On Windows, `py -3` is the cross-version launcher.
2. **The working directory matters.** Relative paths resolve from where you launched the command, not where the script file lives (use `pathlib.Path(__file__).parent` when needed).
3. **No stdin in these practice scripts.** They are designed to run non-interactively, just like CI jobs — use `input()` only in real interactive programs.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
