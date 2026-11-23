# 📖 Lesson: WINDOWS - Python Install

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/05-Developer Environment/0087. WINDOWS - Python Install.mp4`  
> **Module:** 05 — Developer Environment

---

## 🎯 What This Lesson Covers

Installing Python 3 on Windows with the python.org installer, with special attention to the "Add Python to PATH" checkbox that trips up most beginners. We verify the install from both Command Prompt and PowerShell, meet the `py` launcher for machines with several Python versions, and confirm that `pip` is available through `python -m pip` before installing any packages.

---

## 📝 Key Concepts

### 1. Install From python.org and Add Python to PATH

Download the Windows installer from `python.org/downloads/windows` and run it. Tick **Add Python to PATH** at the bottom of the first screen, then choose **Install Now** (or Customize if you need a specific location such as `C:\Python311`). Without that checkbox, `python` is not recognized in a new terminal even though the files are on disk.

```python
import os
import sys

print("Interpreter:", sys.executable)
print("os.name:", os.name)
print("PATH entries containing 'Python':")
for entry in os.environ.get("PATH", "").split(os.pathsep):
    if "Python" in entry:
        print("  ", entry)
```

### 2. The `py` Launcher and Version Selection

Windows installs a small `py.exe` launcher in `C:\Windows`. It finds installed interpreters and lets you target one explicitly: `py -0` lists every registered version, `py -3.11 script.py` selects 3.11, and `py` alone uses the default. Verify a plain install with `python --version`, but prefer `py -0` when diagnosing a machine with multiple versions.

```python
import platform
import shutil

print("Platform:", platform.platform())
for command in ("py", "python", "python3"):
    print(f"{command:<8} -> {shutil.which(command) or 'NOT FOUND'}")
print("Try in a Windows shell: py -0")
```

### 3. pip and the Microsoft Store Alias

Modern python.org installers bundle pip and IDLE. Always call it as `python -m pip --version`, which removes ambiguity about which interpreter receives the package. Windows also ships a Microsoft Store stub for `python`; if clicking it opens the Store, put the python.org `Python311\Scripts` and install directories ahead of `WindowsApps` in `PATH` (or uninstall the alias).

```python
import sys

print(f"Checking pip for: {sys.executable}")
try:
    import pip
except ImportError:
    print("pip missing - repair the install from python.org")
else:
    print(f"pip {pip.__version__} is available")
```

---

## ⚠️ Gotchas & Pro Tips

1. **The PATH checkbox is easy to miss** — if `python` is "not recognized", rerun the installer and choose **Modify** to add PATH rather than manually editing environment variables.
2. **Restart the terminal after installation** — Command Prompt and PowerShell only read `PATH` at startup.
3. **Close version gaps with `py -0`** — it prints the exact versions available, so you can stop guessing which `python` a script is using.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
