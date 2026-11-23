#!/usr/bin/env python3
"""Lesson 04: Sublime Text | Module 05 - Developer Environment.

Checks whether the editor is reachable and prints a model Python build system.
Read-only: the configuration is printed, never written to disk.
"""

import platform
import shutil
import sys
from pathlib import Path

SEPARATOR = "=" * 64


def print_header():
    print(SEPARATOR)
    print("  Lesson 04: Sublime Text")
    print(SEPARATOR)


def find_editor():
    print("\n--- [1] Is Sublime Text reachable? ---")
    found = shutil.which("subl")
    print(f"  shutil.which('subl') -> {found or 'not on PATH'}")
    if platform.system() == "Darwin":
        candidate = Path("/Applications/Sublime Text.app")
        print(f"  macOS app bundle exists: {candidate.exists()}")
    elif platform.system() == "Windows":
        candidate = Path.home() / "AppData/Local/Programs/Sublime Text/subl.exe"
        print(f"  Windows executable exists: {candidate.exists()}")
    print("  Any file with a .py extension is highlighted as Python automatically.")


def show_python_settings():
    print("\n--- [2] Python-specific editor settings ---")
    settings = {
        "tab_size": 4,
        "translate_tabs_to_spaces": True,
        "ensure_newline_at_eof_on_save": True,
    }
    for key, value in settings.items():
        print(f"  {key}: {value}")


def show_build_system():
    print("\n--- [3] Model build system printed as JSON ---")
    build_system = {
        "cmd": [sys.executable, "-u", "$file"],
        "file_regex": r'^[ ]*File "(.*?)", line ([0-9]*)',
        "selector": "source.python",
    }
    print(f"  cmd        : {build_system['cmd']}")
    print(f"  selector   : {build_system['selector']}")
    print("  This is what Tools -> Build System uses when you press Ctrl/Cmd+B.")


def main():
    print_header()
    find_editor()
    show_python_settings()
    show_build_system()
    print("\n" + SEPARATOR)
    print("  Practice complete - no Sublime configuration was modified.")
    print(SEPARATOR)


if __name__ == "__main__":
    main()
