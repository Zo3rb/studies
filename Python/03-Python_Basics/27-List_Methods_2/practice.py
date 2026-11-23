#!/usr/bin/env python3
"""Practice: List Methods 2

Module 03 - Python Basics, Lesson 27.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 27: List Methods 2")
    print("=" * 64)

    items = ["a", "b", "a", "c"]

    print("\n--- [1] index() with bounds ---")
    print("index('a'):", items.index("a"))
    print("index('a', 1):", items.index("a", 1))
    print("index('a', 1, 2) raises:", end=" ")
    try:
        items.index("a", 1, 2)
    except ValueError:
        print("ValueError")

    print("\n--- [2] Membership and count ---")
    numbers = [1, 2, 2, 3, 2]
    print("2 in numbers:", 2 in numbers)
    print("9 in numbers:", 9 in numbers)
    print("count(2):", numbers.count(2))
    print("9 not in numbers:", 9 not in numbers)

    print("\n--- [3] Effects and returns ---")
    sample = [5, 6]
    print("append returned:", sample.append(7))
    print("pop returned:", sample.pop())
    print("index returned:", sample.index(6))
    print("count returned:", sample.count(6))
    print("final list:", sample)
    print("=" * 64)
    print("Lesson 27 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
