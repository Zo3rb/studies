#!/usr/bin/env python3
"""Practice: List Slicing

Module 03 - Python Basics, Lesson 24.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 24: List Slicing")
    print("=" * 64)

    items = [0, 1, 2, 3, 4, 5]

    print("\n--- [1] Slice syntax ---")
    for label, value in (
        ("items[1:4]", items[1:4]),
        ("items[:3]", items[:3]),
        ("items[::2]", items[::2]),
        ("items[::-1]", items[::-1]),
        ("items[50:100]", items[50:100]),
    ):
        print(f"{label:>16} -> {value}")

    print("\n--- [2] Copy vs alias ---")
    original = [1, 2, 3]
    alias = original
    copy = original[:]
    copy.append(4)
    print("original:", original)
    print("alias:", alias)
    print("copy:", copy)
    print("alias is original:", alias is original)
    print("copy is original:", copy is original)

    print("\n--- [3] Assigning to a slice ---")
    values = ["a", "b", "c", "d"]
    first_two = values[:2]
    values[1:3] = ["X", "Y", "Z"]
    print("saved slice:", first_two)
    print("after slice assignment:", values)
    print("=" * 64)
    print("Lesson 24 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
