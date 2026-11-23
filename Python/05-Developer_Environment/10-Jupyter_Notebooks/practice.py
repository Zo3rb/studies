#!/usr/bin/env python3
"""Lesson 10: Jupyter Notebooks | Module 05 - Developer Environment.

Checks notebook tooling and prints a sample notebook cell plus shortcuts.
"""

import importlib.util
import shutil

SEPARATOR = "=" * 64


def print_header():
    print(SEPARATOR)
    print("  Lesson 10: Jupyter Notebooks")
    print(SEPARATOR)


def check_install():
    print("\n--- [1] Notebook tooling on this machine ---")
    for command in ("jupyter", "jupyter-lab", "jupyter-notebook"):
        print(f"  {command:<18} -> {shutil.which(command) or 'not on PATH'}")
    for module in ("IPython", "jupyter", "nbformat"):
        found = importlib.util.find_spec(module) is not None
        print(f"  import {module:<10} -> {'yes' if found else 'no'}")
    print("  Install with: python -m pip install jupyterlab")


def show_cells():
    print("\n--- [2] Example notebook cells ---")
    code_cell = "values = [1, 2, 3]\nprint(sum(values))"
    print("  [Markdown] # My first notebook")
    print("  [Code]")
    for line in code_cell.splitlines():
        print("    " + line)
    print("  Output: 6")


def show_shortcuts():
    print("\n--- [3] Kernel and keyboard reminders ---")
    shortcuts = [
        ("Shift+Enter", "run cell and select next"),
        ("Ctrl+Enter", "run cell in place"),
        ("Esc then A/B", "insert cell above/below"),
        ("Esc then M/Y", "switch to Markdown/code"),
        ("Esc then D D", "delete cell"),
    ]
    for key, meaning in shortcuts:
        print(f"  {key:<14} {meaning}")
    print("  Kernel state persists between cells; Restart & Run All verifies order.")


def main():
    print_header()
    check_install()
    show_cells()
    show_shortcuts()
    print("\n" + SEPARATOR)
    print("  Practice complete - no notebook was launched or modified.")
    print(SEPARATOR)


if __name__ == "__main__":
    main()
