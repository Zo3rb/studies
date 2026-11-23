#!/usr/bin/env python3
"""Practice — Lesson 02: How To Run Python Code | 02 — Python Introduction."""

import subprocess
import sys
import tempfile
from pathlib import Path


def main():
    print("=" * 68)
    print("  Lesson: How To Run Python Code")
    print("=" * 68)

    print("\n[1] Current process view (sys.argv):")
    print(f"  {sys.argv}")

    print("\n[2] -c equivalent: evaluating source from a string:")
    expression = "print('6 * 7 =', 6 * 7)"
    exec(expression)

    print("\n[3] Script mode: create a temp .py file and run it in a subprocess:")
    with tempfile.TemporaryDirectory(prefix="py_run_lesson_") as tmp:
        script = Path(tmp) / "hello.py"
        script.write_text(
            "import sys\n"
            "print('Hello from', sys.argv[0].split('/')[-1])\n"
            "print('Arguments:', sys.argv[1:])\n",
            encoding="utf-8",
        )
        result = subprocess.run(
            [sys.executable, str(script), "Alice", "42"],
            capture_output=True,
            text=True,
            check=True,
        )
        print("  stdout:")
        for line in result.stdout.splitlines():
            print(f"    {line}")
        print(f"  exit code: {result.returncode}")

    print("\n[4] Module mode example (not executed here): python3 -m http.server 8000")
    print("\nAll practice.py files in this repository are safe to run with: python3 practice.py")

if __name__ == "__main__":
    main()

