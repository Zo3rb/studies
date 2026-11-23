#!/usr/bin/env python3
"""Lesson 08: PyCharm | Module 05 - Developer Environment.

Checks for a local PyCharm project layout and prints a model run configuration.
"""

import json
import shutil
import sys
from pathlib import Path

SEPARATOR = "=" * 64


def print_header():
    print(SEPARATOR)
    print("  Lesson 08: PyCharm")
    print(SEPARATOR)


def check_ide():
    print("\n--- [1] IDE availability and project markers ---")
    for command in ("pycharm", "charm"):
        print(f"  shutil.which('{command}') -> {shutil.which(command) or 'not on PATH'}")
    for marker in (".idea", ".venv"):
        print(f"  {marker}/ exists here: {Path(marker).exists()}")


def report_interpreter():
    print("\n--- [2] Project interpreter ---")
    print(f"  sys.executable : {sys.executable}")
    print(f"  version        : {sys.version.splitlines()[0]}")
    print("  Set this in Settings -> Project -> Python Interpreter.")


def show_run_configuration():
    print("\n--- [3] Model run configuration ---")
    config = {
        "name": "practice",
        "type": "PythonConfigurationType",
        "scriptName": str(Path("practice.py").resolve()),
        "pythonInterpreter": sys.executable,
        "workingDirectory": str(Path.cwd()),
    }
    print(json.dumps(config, indent=2, sort_keys=True))
    print("  Keep .idea/ and .venv/ out of version control.")


def main():
    print_header()
    check_ide()
    report_interpreter()
    show_run_configuration()
    print("\n" + SEPARATOR)
    print("  Practice complete - no IDE files were created.")
    print(SEPARATOR)


if __name__ == "__main__":
    main()
