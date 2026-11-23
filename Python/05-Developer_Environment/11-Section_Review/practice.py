#!/usr/bin/env python3
"""Lesson 11: Section Review | Module 05 - Developer Environment.

Runs a compact end-of-module health check across installs, tools and packages.
"""

import importlib.util
import platform
import shutil
import sys
from pathlib import Path

SEPARATOR = "=" * 64


def print_header():
    print(SEPARATOR)
    print("  Lesson 11: Section Review")
    print(SEPARATOR)


def check_python():
    print("\n--- [1] Python install ---")
    print(f"  version    : {sys.version.splitlines()[0]}")
    print(f"  executable : {sys.executable}")
    print(f"  platform   : {platform.system()}")


def check_tools():
    print("\n--- [2] Editors, shell and notebook tools ---")
    for tool in ("code", "subl", "pycharm", "git", "jupyter"):
        print(f"  {tool:<10} -> {shutil.which(tool) or 'not on PATH'}")


def check_modules():
    print("\n--- [3] Package and notebook modules ---")
    for module in ("pip", "venv", "IPython", "nbformat"):
        found = importlib.util.find_spec(module) is not None
        print(f"  {module:<10} {'ok' if found else 'missing'}")


def print_checklist():
    print("\n--- [4] Troubleshooting order ---")
    items = [
        "pwd - am I in the right directory?",
        "sys.executable - is this the interpreter I expect?",
        "python -m pip list - is the package installed there?",
        "Save the file and restart the kernel before retrying.",
    ]
    for number, item in enumerate(items, 1):
        print(f"  {number}. {item}")
    print(f"  Lesson folder: {Path(__file__).resolve().parent.name}")


def main():
    print_header()
    check_python()
    check_tools()
    check_modules()
    print_checklist()
    print("\n" + SEPARATOR)
    print("  Module 05 review complete - environment checked, nothing changed.")
    print(SEPARATOR)


if __name__ == "__main__":
    main()
