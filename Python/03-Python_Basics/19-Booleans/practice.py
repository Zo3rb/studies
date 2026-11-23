#!/usr/bin/env python3
"""Practice: Booleans

Module 03 - Python Basics, Lesson 19.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 19: Booleans")
    print("=" * 64)

    print("\n--- [1] The bool type ---")
    print(True, False, type(True).__name__)
    print("5 > 3:", 5 > 3)
    print("5 == 3:", 5 == 3)

    print("\n--- [2] Truthiness table in action ---")
    for value in (False, None, 0, 0.0, "", [], {}, "0", [0]):
        print(f"{value!r:>8} -> {bool(value)}")

    print("\n--- [3] Conversion and logic ---")
    print("bool('False'):", bool("False"))
    print("bool(''):", bool(""))
    print("True and False:", True and False)
    print("True or False:", True or False)
    print("not True:", not True)
    print("=" * 64)
    print("Lesson 19 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
