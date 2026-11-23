#!/usr/bin/env python3
"""Lesson 07: Visual Studio Code | Module 05 - Developer Environment.

Inspects VS Code availability and prints example Python workspace settings.
"""

import json
import shutil
import sys
from pathlib import Path

SEPARATOR = "=" * 64


def print_header():
    print(SEPARATOR)
    print("  Lesson 07: Visual Studio Code")
    print(SEPARATOR)


def check_editor():
    print("\n--- [1] Editor availability ---")
    print(f"  shutil.which('code') -> {shutil.which('code') or 'not on PATH'}")
    workspace = Path(".vscode")
    print(f"  local .vscode folder : {workspace.exists()}")


def show_interpreter_setting():
    print("\n--- [2] Interpreter selection ---")
    print(f"  Python: Select Interpreter -> {sys.executable}")
    settings = {"python.defaultInterpreterPath": sys.executable}
    print("  " + json.dumps(settings, sort_keys=True))


def show_workflow_settings():
    print("\n--- [3] Formatting and linting settings ---")
    settings = {
        "editor.formatOnSave": True,
        "python.linting.flake8Enabled": True,
        "[python]": {"editor.defaultFormatter": "ms-python.black-formatter"},
    }
    print(json.dumps(settings, indent=2, sort_keys=True))
    print("  Extensions: Python (ms-python.python) and Pylance (ms-python.vscode-pylance)")


def main():
    print_header()
    check_editor()
    show_interpreter_setting()
    show_workflow_settings()
    print("\n" + SEPARATOR)
    print("  Practice complete - VS Code settings were printed, not written.")
    print(SEPARATOR)


if __name__ == "__main__":
    main()
