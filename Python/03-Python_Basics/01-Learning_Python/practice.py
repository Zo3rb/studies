#!/usr/bin/env python3
"""Practice: Learning Python

Module 03 - Python Basics, Lesson 01.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 01: Learning Python")
    print("=" * 64)

    print("\n--- [1] REPL-style expressions (shown as computed values) ---")
    print("2 + 3 =", 2 + 3)
    print("7 / 2 =", 7 / 2)

    print("\n--- [2] Values and their types ---")
    samples = (42, 3.14, "Andrei", True, None)
    for value in samples:
        print(f"{value!r:>10} -> {type(value).__name__}")

    print("\n--- [3] Store, retrieve, act ---")
    name = "Andrei"
    message = "Hello, " + name
    print("message:", message)
    print("uppercase:", message.upper())

    print("\n--- [4] print() newline control ---")
    print("same", "line", end="")
    print(" joined")
    print("=" * 64)
    print("Lesson 01 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
