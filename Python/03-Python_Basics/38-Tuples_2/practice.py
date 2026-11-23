#!/usr/bin/env python3
"""Practice: Tuples 2

Module 03 - Python Basics, Lesson 38.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 38: Tuples 2")
    print("=" * 64)

    print("\n--- [1] Sequence operations ---")
    t = (0, 1, 2, 3)
    print("indexing:", t[1], t[-1])
    print("slice:", t[1:3])
    print("len/membership:", len(t), 2 in t)
    print("concat/repeat:", t + (4,), t * 2)

    print("\n--- [2] count() and index() ---")
    values = ("a", "b", "a", "c")
    print("count('a'):", values.count("a"))
    print("index('a'):", values.index("a"))
    print("index('a', 1):", values.index("a", 1))
    try:
        values.index("z")
    except ValueError as error:
        print("expected ValueError:", error)

    print("\n--- [3] Unpacking ---")
    point = (10, 20)
    x, y = point
    print("x, y:", x, y)
    first, *rest = (1, 2, 3)
    print("first/rest:", first, rest)
    print("=" * 64)
    print("Lesson 38 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
