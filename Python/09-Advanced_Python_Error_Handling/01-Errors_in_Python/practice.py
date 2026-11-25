#!/usr/bin/env python3
"""Practice for Lesson 01: Errors in Python — Module 09: Advanced Python: Error Handling."""

import os
import tempfile
import traceback


def attempt(label, operation):
    """Run an operation and report its exception instead of crashing."""
    try:
        result = operation()
    except Exception as exc:
        print(f"  {label}: {type(exc).__name__}: {exc}")
    else:
        print(f"  {label}: OK -> {result!r}")


def main():
    print("=" * 64)
    print("  Lesson 01: Errors in Python")
    print("=" * 64)

    print("\n--- [1] The exception hierarchy ---")
    hierarchy = {
        "ValueError": ValueError,
        "KeyError": KeyError,
        "KeyboardInterrupt": KeyboardInterrupt,
        "SystemExit": SystemExit,
    }
    for name, error_type in hierarchy.items():
        print(f"  {name:<18} subclass of Exception: {issubclass(error_type, Exception)}")

    print("\n--- [2] Common built-in exceptions are caught safely ---")
    attempt("ValueError", lambda: int("three"))
    attempt("TypeError", lambda: len(42))
    attempt("KeyError", lambda: {"a": 1}["b"])
    attempt("IndexError", lambda: [10, 20][7])
    attempt("ZeroDivisionError", lambda: 1 / 0)

    print("\n--- [3] FileNotFoundError from a read-only attempt ---")
    missing = os.path.join(tempfile.gettempdir(), "lesson09_missing_demo_file.txt")
    try:
        with open(missing, encoding="utf-8") as handle:
            handle.read()
    except FileNotFoundError as exc:
        print(f"  FileNotFoundError caught (errno {exc.errno}) for a missing file")

    print("\n--- [4] Reading a traceback bottom-up ---")
    try:
        int("oops")
    except ValueError:
        last_line = traceback.format_exc().strip().splitlines()[-1]
    print("  final traceback line:", last_line)

    print("\n--- [5] A handled failure does not stop the script ---")
    attempt("divide by zero", lambda: 7 // 0)
    print("  still running after the handled failure")

    print("\nLesson 01 practice completed successfully!")


if __name__ == "__main__":
    main()
