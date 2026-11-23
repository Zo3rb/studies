#!/usr/bin/env python3
"""Lesson 03: Python Developer Tools | Module 05 - Developer Environment.

Surveys the local toolchain: interpreter, package tooling, shells and editors.
Only read-only checks are performed.
"""

import importlib.util
import platform
import shutil
import sys

SEPARATOR = "=" * 64


def print_header():
    print(SEPARATOR)
    print("  Lesson 03: Python Developer Tools")
    print(SEPARATOR)


def report_interpreter():
    print("\n--- [1] Interpreter layer ---")
    print(f"  version    : {sys.version.splitlines()[0]}")
    print(f"  executable : {sys.executable}")
    print(f"  platform   : {platform.platform()}")


def report_stdlib_modules():
    print("\n--- [2] Package and environment tooling ---")
    for module in ("pip", "venv", "ensurepip", "site"):
        available = importlib.util.find_spec(module) is not None
        print(f"  {module:<10} {'available' if available else 'missing'}")


def report_tools():
    print("\n--- [3] Editors, shells and version control on PATH ---")
    tools = ("subl", "code", "pycharm", "charm", "jupyter", "git", "bash", "zsh", "powershell")
    for tool in tools:
        location = shutil.which(tool)
        print(f"  {tool:<12} -> {location or 'not on PATH'}")


def main():
    print_header()
    report_interpreter()
    report_stdlib_modules()
    report_tools()
    print("\n" + SEPARATOR)
    print("  Summary: interpreter + editor + terminal + pip + venv = ready to code.")
    print(SEPARATOR)


if __name__ == "__main__":
    main()
