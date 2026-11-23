#!/usr/bin/env python3
"""Lesson 05: Optional - Terminal Commands | Module 05 - Developer Environment.

Shows Python equivalents of common shell navigation commands. Read-only.
"""

import os
from pathlib import Path

SEPARATOR = "=" * 64


def print_header():
    print(SEPARATOR)
    print("  Lesson 05: Optional - Terminal Commands")
    print(SEPARATOR)


def show_navigation():
    print("\n--- [1] Navigation: pwd, ~, ., .. ---")
    print(f"  pwd        -> {Path.cwd()}")
    print(f"  echo ~     -> {Path.home()}")
    print(f"  current    -> {Path('.').resolve()}")
    print(f"  parent     -> {Path('..').resolve()}")
    print(f"  os.getcwd()-> {os.getcwd()}")


def show_listing():
    print("\n--- [2] Listing: ls -lah (first entries, sorted) ---")
    entries = sorted(Path(".").iterdir(), key=lambda item: item.name.lower())
    for entry in entries[:6]:
        kind = "dir " if entry.is_dir() else "file"
        print(f"  {kind} {entry.stat().st_size:>7} B  {entry.name}")
    print("  man <command> opens the manual; press q to quit.")


def show_command_map():
    print("\n--- [3] Shell command -> Python standard library ---")
    pairs = [
        ("pwd", "Path.cwd()"),
        ("mkdir -p name", "Path('name').mkdir(parents=True, exist_ok=True)"),
        ("touch name", "Path('name').touch()"),
        ("ls -lah", "sorted(Path('.').iterdir())"),
        ("cd path", "os.chdir(path)"),
    ]
    for shell, python in pairs:
        print(f"  {shell:<18} -> {python}")


def main():
    print_header()
    show_navigation()
    show_listing()
    show_command_map()
    print("\n" + SEPARATOR)
    print("  Practice complete - nothing was created or deleted.")
    print(SEPARATOR)


if __name__ == "__main__":
    main()
