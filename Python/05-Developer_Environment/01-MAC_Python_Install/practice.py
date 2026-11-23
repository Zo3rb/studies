#!/usr/bin/env python3
"""Lesson 01: MAC - Python Install | Module 05 - Developer Environment.

Read-only inspection of the active interpreter and Python-related commands.
"""

import platform
import shutil
import sys

SEPARATOR = "=" * 64


def print_header():
    print(SEPARATOR)
    print("  Lesson 01: MAC - Python Install")
    print(SEPARATOR)


def report_interpreter():
    print("\n--- [1] Active Python interpreter ---")
    print(f"  sys.version      : {sys.version.splitlines()[0]}")
    print(f"  sys.executable   : {sys.executable}")
    print(f"  sys.prefix       : {sys.prefix}")
    print(f"  platform.system(): {platform.system()}")
    if platform.system() == "Darwin":
        print("  -> macOS: python.org installs under")
        print("     /Library/Frameworks/Python.framework/Versions/")
    else:
        print("  -> Not macOS; these install steps are macOS-specific.")


def check_commands():
    print("\n--- [2] Python commands on PATH ---")
    for command in ("python3", "python", "pip3", "pip"):
        print(f"  {command:<8} -> {shutil.which(command) or 'NOT FOUND'}")
    print("  Shell equivalent: which -a python3   (shows every match)")


def check_pip_module():
    print("\n--- [3] pip belonging to this interpreter ---")
    try:
        import pip
    except ImportError:
        print("  pip is not importable in this interpreter.")
    else:
        print(f"  pip importable: yes, version {pip.__version__}")
        print("  Shell equivalent: python3 -m pip --version")


def main():
    print_header()
    report_interpreter()
    check_commands()
    check_pip_module()
    print("\n" + SEPARATOR)
    print("  Practice complete - no files were changed.")
    print(SEPARATOR)


if __name__ == "__main__":
    main()
