# 📖 Lesson: Visual Studio Code

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/05-Developer Environment/0092. Visual Studio Code.mp4`  
> **Module:** 05 — Developer Environment

---

## 🎯 What This Lesson Covers

Turning VS Code into a productive Python workspace: installing the editor, adding Microsoft's Python extension (with Pylance), and selecting the interpreter that matches your project. The lesson walks through opening a folder, running a file from the editor or integrated terminal, and using formatters and linters such as Black and Flake8 through editor settings.

---

## 📝 Key Concepts

### 1. Install the Editor and the Python Extension

Install VS Code from `code.visualstudio.com`, then open the Extensions view (`Ctrl/Cmd + Shift + X`) and install **Python** by Microsoft; Pylance is installed with it and provides completions and type information. Extensions are editor features, not Python packages — the interpreter still has to be installed separately.

```python
# A normal script is all VS Code needs to offer completion and debugging.
def greet(name: str) -> str:
    return f"Hello, {name}!"

print(greet("VS Code"))
```

### 2. Select the Right Interpreter

Open the Command Palette (`Ctrl/Cmd + Shift + P`) and run **Python: Select Interpreter**. Choose the python.org interpreter, a virtual environment such as `.venv/bin/python`, or `py -3.11` on Windows. The chosen path appears in the status bar and is stored in `.vscode/settings.json`, so teammates can share it; user settings apply globally, workspace settings override them.

```python
import sys

print(f"Status bar should show: {sys.executable}")
settings = {"python.defaultInterpreterPath": sys.executable}
print("Workspace setting:", settings)
```

### 3. Run, Debug, and Format

Use the play button in the editor title bar to run the whole file in the integrated terminal, or press `F5` to start the debugger with breakpoints. Install Black and Flake8 into the selected interpreter, then set `"editor.formatOnSave": true` and choose Black as the Python formatter. The Problems panel gathers lint warnings without leaving the editor.

```python
formatter_settings = {
    "editor.formatOnSave": True,
    "[python]": {"editor.defaultFormatter": "ms-python.black-formatter"},
    "python.linting.flake8Enabled": True,
}
print(formatter_settings["editor.formatOnSave"])
```

---

## ⚠️ Gotchas & Pro Tips

1. **Wrong interpreter selected** — if imports fail only inside VS Code, re-run *Python: Select Interpreter*; installing a package with a different `python` will not help.
2. **Run Python File runs the saved file** — unsaved edits are not executed, and the integrated terminal's working directory is usually the workspace root.
3. **Separate settings scopes** — a workspace `.vscode/settings.json` beats user settings; commit it only if the interpreter path makes sense for everyone.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
