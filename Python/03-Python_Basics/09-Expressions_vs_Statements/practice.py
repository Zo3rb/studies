#!/usr/bin/env python3
"""Practice: Expressions vs Statements

Module 03 - Python Basics, Lesson 09.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 09: Expressions vs Statements")
    print("=" * 64)

    print("\n--- [1] Expressions produce values ---")
    result = 100 / 5
    print("100 / 5 =", result)
    print("2 + 3 * 4 =", 2 + 3 * 4)
    print("len('Python') =", len("Python"))

    print("\n--- [2] Statements do actions ---")
    import math
    radius = 5
    area = math.pi * radius ** 2
    print("area:", round(area, 2))

    print("\n--- [3] Expression statement vs printed output ---")
    value = 7
    computed = value + 1  # bare expression would be discarded
    print("value:", value)
    print("computed but not printed by itself:", computed)
    print("print() returns:", print("hi"))
    print("=" * 64)
    print("Lesson 09 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
