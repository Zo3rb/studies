# 📖 Lesson: Latest Version Of Python

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/02-Python Introduction/0007. Latest Version Of Python.mp4`  
> **Module:** 02 — Python Introduction

---

## 🎯 What This Lesson Covers

This lesson explains Python's release cadence — PEP 440 version numbers, annual minor releases, maintenance updates, and the difference between the version installed on your machine and the newest stable one. It also teaches you to inspect and compare versions from inside Python so code can guard newer features.

---

## 📝 Key Concepts

### 1. Reading a Version Number

`Python 3.12.4` means:

| Part | Name | Meaning |
| :--- | :--- | :------ |
| `3` | major | Python 3 series (Python 2 is legacy) |
| `12` | minor | Annual feature release; adds syntax/stdlib features |
| `4` | micro/patch | Bug-fix release; safe drop-in update |

Pre-releases add suffixes: `3.13.0rc2` (release candidate), `3.14.0a1` (alpha), `3.14.0b2` (beta).

### 2. Ask the Runtime, Not Your Memory

```python
import platform, sys

print(platform.python_version())   # '3.12.4'
print(sys.version_info)            # sys.version_info(major=3, minor=12, ...)
print(sys.version_info >= (3, 10)) # structural comparison — safe
```

Compare tuples/`sys.version_info` rather than parsing a version string.

### 3. Why Minor Versions Matter

Newer minors add syntax that older interpreters cannot parse:

- `3.8`: walrus operator `:=`, positional-only parameters
- `3.9`: built-in generics like `list[int]`
- `3.10`: structural pattern matching, `X | Y` unions
- `3.11`: `ExceptionGroup`, `tomllib`
- `3.12`: f-string syntax relaxation, type parameter syntax

A file using `3.10` syntax raises `SyntaxError` on `3.9` before a single line executes.

### 4. Stable ≠ Installed

Course videos may be recorded on an older release. The language fundamentals in Modules 01–06 are stable across Python 3.x; only version-specific extras need attention. Check what your project requires in `pyproject.toml` or a virtual environment.

---

## ⚠️ Gotchas & Pro Tips

1. **Do not chase the newest release blindly.** Libraries may lag; a boring, supported version is better than a bleeding-edge one with incompatible dependencies.
2. **String comparison is wrong.** `"3.9" > "3.10"` is `True` lexicographically. Use `sys.version_info` or `packaging.version`.
3. **Python 2 reached end-of-life in 2020.** Any `print "x"` syntax you see online is legacy and will not run here.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
