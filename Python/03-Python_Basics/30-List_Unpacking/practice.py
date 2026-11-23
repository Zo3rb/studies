#!/usr/bin/env python3
"""Practice: List Unpacking

Module 03 - Python Basics, Lesson 30.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 30: List Unpacking")
    print("=" * 64)

    print("\n--- [1] Basic unpacking ---")
    coordinates = [10, 20, 30]
    x, y, z = coordinates
    print("x, y, z:", x, y, z)
    try:
        a, b = coordinates
    except ValueError as error:
        print("expected ValueError:", error)

    print("\n--- [2] Starred unpacking ---")
    numbers = [1, 2, 3, 4, 5]
    first, *rest = numbers
    head, *middle, tail = numbers
    print("first/rest:", first, rest)
    print("head/middle/tail:", head, middle, tail)
    only, *empty = [7]
    print("single capture:", only, empty)

    print("\n--- [3] Swapping and ignoring ---")
    a, b = 1, 2
    a, b = b, a
    print("swapped:", a, b)
    name, _, age = ["Andrei", "ignored", 36]
    print("name/age:", name, age)
    print("=" * 64)
    print("Lesson 30 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
