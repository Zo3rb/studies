# 📖 Lesson: MAC - Python Install

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/05-Developer Environment/0086. MAC - Python Install.mp4`  
> **Module:** 05 — Developer Environment

---

## 🎯 What This Lesson Covers

Getting a real Python 3 interpreter onto a Mac using the official python.org installer, then proving from Terminal that the installation works. We look at where the installer puts Python, why macOS already has a `python3` stub, and how to verify both the interpreter and `pip` from the command line. Homebrew is discussed as a legitimate alternative, but it is not required to follow this course.

---

## 📝 Key Concepts

### 1. The python.org Universal2 Installer

Download the latest Python 3 `.pkg` from `python.org/downloads/macos` and run it with the default options. The package installs a framework under `/Library/Frameworks/Python.framework/Versions/3.x/`, creates symlinks in `/usr/local/bin`, installs IDLE, and registers the interpreter on the system `PATH` via `/etc/paths.d`. After it finishes, open a **new** Terminal window so the updated path is picked up.

```python
import sys

print(sys.version.splitlines()[0])
print(sys.executable)
```

### 2. Why `python3` Matters on macOS

Apple ships a stub `/usr/bin/python3` that may prompt you to install Xcode Command Line Tools. The python.org build installed earlier should take precedence because its directory appears earlier in `PATH`. Check with `which -a python3`, then verify with `python3 --version` and `python3 -m pip --version` — using `-m pip` guarantees that pip belongs to the interpreter you just tested.

```python
import shutil

for command in ("python3", "python", "pip3"):
    print(f"{command:<8} -> {shutil.which(command) or 'not on PATH'}")
```

### 3. Homebrew Is Optional, Environments Are Not

`brew install python` is a fine alternative that installs into `/opt/homebrew/bin` on Apple Silicon or `/usr/local/bin` on Intel Macs; do not install the same Python twice with both methods. Whichever route you choose, create per-project virtual environments with `python3 -m venv .venv`, because globally installed packages quickly become incompatible across projects.

```python
import sys

print(f"Interpreter: {sys.executable}")
print(f"Environment prefix: {sys.prefix}")
print("Create an isolated env with: python3 -m venv .venv")
```

---

## ⚠️ Gotchas & Pro Tips

1. **Two different `python3` executables** — the Apple stub and the python.org build can both exist; `which -a python3` shows the order, and the first match is the one that runs.
2. **Open a fresh terminal after installing** — an already-running shell caches the old `PATH`, so version checks can look like the install failed when it did not.
3. **Avoid `sudo pip install`** — install into a virtual environment; if you hit SSL certificate errors on older Python builds, run the bundled `Install Certificates.command` from the Python folder in Applications.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
