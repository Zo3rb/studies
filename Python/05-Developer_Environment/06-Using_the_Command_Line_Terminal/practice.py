#!/usr/bin/env python3
"""Lesson 06: Using the Command Line - Terminal | Module 05 - Developer Environment.

Demonstrates what a script sees when launched from a shell: argv, cwd and paths.
"""

import sys
from pathlib import Path

SEPARATOR = "=" * 64


def print_header():
    print(SEPARATOR)
    print("  Lesson 06: Using the Command Line - Terminal")
    print(SEPARATOR)


def show_invocation():
    print("\n--- [1] What the shell passed to Python ---")
    print(f"  sys.argv[0]  : {sys.argv[0]}")
    print(f"  sys.argv[1:] : {sys.argv[1:] or '(none)'}")
    print("  Try: python3 practice.py hello world")
    print(f"  interactive  : {hasattr(sys, 'ps1')}")


def show_paths():
    print("\n--- [2] Working directory vs script directory ---")
    script_dir = Path(__file__).resolve().parent
    print(f"  Path.cwd()             : {Path.cwd()}")
    print(f"  Path(__file__).parent  : {script_dir}")
    print(f"  Path(__file__).name    : {Path(__file__).name}")
    print("  Relative paths follow the shell's cwd; anchor them with __file__.")


def show_commands():
    print("\n--- [3] Command-line recipes ---")
    recipes = [
        "python3 practice.py",
        "python -m pip --version",
        "python -m venv .venv",
        "python3 -i practice.py",
        "Ctrl+C stops a running script; Ctrl+D exits the REPL",
    ]
    for recipe in recipes:
        print(f"  $ {recipe}")


def main():
    print_header()
    show_invocation()
    show_paths()
    show_commands()
    print("\n" + SEPARATOR)
    print("  Practice complete - no stdin was required.")
    print(SEPARATOR)


if __name__ == "__main__":
    main()
