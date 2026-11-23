#!/usr/bin/env python3
"""Lesson 02: WINDOWS - Python Install | Module 05 - Developer Environment.

Reports interpreter details and the Windows launcher/pip checks used in the video.
Runs on any OS so the notes remain inspectable from Linux or macOS too.
"""

import os
import platform
import shutil
import sys

SEPARATOR = "=" * 64


def print_header():
    print(SEPARATOR)
    print("  Lesson 02: WINDOWS - Python Install")
    print(SEPARATOR)


def report_interpreter():
    print("\n--- [1] Which Python is running? ---")
    print(f"  os.name         : {os.name}")
    print(f"  platform.system(): {platform.system()}")
    print(f"  version         : {sys.version.splitlines()[0]}")
    print(f"  executable      : {sys.executable}")
    if os.name == "nt":
        print("  -> Windows detected: check 'py -0' in a new terminal.")
    else:
        print("  -> Non-Windows host: Windows steps are shown as reference.")


def report_path_hits():
    print("\n--- [2] PATH entries mentioning Python ---")
    entries = [e for e in os.environ.get("PATH", "").split(os.pathsep) if "Python" in e]
    if entries:
        for entry in sorted(set(entries)):
            print(f"  {entry}")
    else:
        print("  (none found in this process environment)")


def check_launchers():
    print("\n--- [3] Launcher and pip verification ---")
    for command in ("py", "python", "python3", "pip"):
        print(f"  {command:<8} -> {shutil.which(command) or 'NOT FOUND'}")
    print("  Windows checks: python --version | py -0 | python -m pip --version")


def main():
    print_header()
    report_interpreter()
    report_path_hits()
    check_launchers()
    print("\n" + SEPARATOR)
    print("  Practice complete - no settings were changed.")
    print(SEPARATOR)


if __name__ == "__main__":
    main()
