#!/usr/bin/env python3
"""Practice: List Methods 3

Module 03 - Python Basics, Lesson 28.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 28: List Methods 3")
    print("=" * 64)

    print("\n--- [1] sort() vs sorted() ---")
    numbers = [3, 1, 2]
    ordered = sorted(numbers)
    print("sorted():", ordered, "original:", numbers)
    numbers.sort()
    print("after sort():", numbers)
    words = ["apple", "kiwi", "fig"]
    words.sort(key=len)
    print("sort(key=len):", words)

    print("\n--- [2] reverse() vs slicing ---")
    items = [1, 2, 3]
    reversed_copy = items[::-1]
    items.reverse()
    print("reversed_copy:", reversed_copy)
    print("after reverse():", items)

    print("\n--- [3] Shallow copy ---")
    original = [1, [2, 3]]
    copy = original.copy()
    copy.append(4)
    copy[1].append(99)
    print("original:", original)
    print("copy:", copy)
    print("outer shared:", original is copy)
    print("inner shared:", original[1] is copy[1])
    print("=" * 64)
    print("Lesson 28 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
