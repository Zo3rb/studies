# 📖 Lesson: Sublime Text

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/05-Developer Environment/0089. Sublime Text.mp4`  
> **Module:** 05 — Developer Environment

---

## 🎯 What This Lesson Covers

Setting up Sublime Text as a lightweight Python editor: installing it, opening a project folder, choosing the Python syntax mode, and making the editor obey Python's indentation rules. We also cover Package Control for installing extras and configuring a build system so `Ctrl/Cmd + B` runs the current file with the correct interpreter.

---

## 📝 Key Concepts

### 1. Install, Open a Folder, Set the Syntax

Download Sublime Text from `sublimetext.com` and install it with the defaults; the occasional evaluation reminder does not disable features. Use **File → Open Folder** so the sidebar shows the whole project, not one loose file. Sublime detects Python from the `.py` extension, but you can force it with **View → Syntax → Python** or the syntax selector in the status bar.

```python
# A file saved as script.py is automatically highlighted as Python.
message = "Hello from Sublime Text"
print(message.upper())
```

### 2. Indentation and Syntax-Specific Settings

Python cares about whitespace, so set tab conversion to four spaces: **View → Indentation → Convert Indentation to Spaces** and choose tab width 4. Preferences can be scoped to Python only by opening *Preferences → Settings – Syntax Specific* and adding `"tab_size": 4` and `"translate_tabs_to_spaces": true` — this prevents other languages from inheriting the rule.

```python
settings = {
    "tab_size": 4,
    "translate_tabs_to_spaces": True,
    "ensure_newline_at_eof_on_save": True,
}
print(settings["tab_size"], "spaces per indentation level")
```

### 3. Package Control and the Build System

Install **Package Control** from `packagecontrol.io`, then use `Ctrl/Cmd + Shift + P → Package Control: Install Package` to add linters or themes. A *build system* tells Sublime which command to run: create one with `cmd` pointing at your interpreter and `$file`, select it under **Tools → Build System**, and press `Ctrl/Cmd + B`. Output appears in a panel at the bottom of the window.

```python
build_system = {
    "cmd": ["python3", "-u", "$file"],
    "file_regex": "^[ ]*File \"(...*?)\", line ([0-9]*)",
    "selector": "source.python",
}
print("Build command:", " ".join(build_system["cmd"]))
```

---

## ⚠️ Gotchas & Pro Tips

1. **Wrong interpreter in the build system** — if `python3` on your machine is not the interpreter with your packages, put the absolute path (or the activated venv path) in `cmd`.
2. **Build runs the saved file** — unsaved changes are not executed; save before pressing `Ctrl/Cmd + B`.
3. **Package Control needs a first-time bootstrap** — install it once via the console snippet on its website; after that, use the command palette for everything.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
