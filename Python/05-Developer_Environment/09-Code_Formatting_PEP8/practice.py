#!/usr/bin/env python3
"""Lesson 09: Code Formatting - PEP 8 | Module 05 - Developer Environment.

Prints a before/after example and runs a tiny style check on the formatted text.
"""

SEPARATOR = "=" * 64

BEFORE = """def greet(name):
  x="Hello"
  print(x+" "+name)
"""


def print_header():
    print(SEPARATOR)
    print("  Lesson 09: Code Formatting - PEP 8")
    print(SEPARATOR)


def formatted_example():
    print("\n--- [1] Before and after ---")
    print("BEFORE:")
    for line in BEFORE.splitlines():
        print("  |" + line)
    print("AFTER (PEP 8):")
    after = [
        "def greet(name: str) -> None:",
        '    """Print a friendly greeting."""',
        '    message = f"Hello, {name}!"',
        "    print(message)",
    ]
    for line in after:
        print("  |" + line)
    return after


def check_style(lines):
    print("\n--- [2] Mini style check on the AFTER snippet ---")
    problems = []
    for number, line in enumerate(lines, start=1):
        if "\t" in line:
            problems.append(f"line {number}: tab character")
        if line != line.rstrip():
            problems.append(f"line {number}: trailing whitespace")
        if len(line) > 79:
            problems.append(f"line {number}: longer than 79 chars")
    print(f"  Lines checked: {len(lines)}")
    print("  Issues:", ", ".join(problems) if problems else "none")
    return problems


def show_tooling():
    print("\n--- [3] Automation and conventions ---")
    commands = (
        "python -m black .",
        "python -m autopep8 --in-place -r .",
        "python -m flake8 .",
    )
    for command in commands:
        print(f"  $ {command}")
    print("  Names: snake_case functions, CamelCase classes, UPPER_CASE constants")
    print("  Layout: 4 spaces, 79 chars, 2 blank lines around top-level defs")


def main():
    print_header()
    after = formatted_example()
    check_style(after)
    show_tooling()
    print("\n" + SEPARATOR)
    print("  Practice complete - no source files were reformatted.")
    print(SEPARATOR)


if __name__ == "__main__":
    main()
