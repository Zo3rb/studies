#!/usr/bin/env python3
"""Practice for Lesson 07: reduce() — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 07: reduce()")
    print("=" * 64)
    print("\n--- [1] Cumulative product ---")
    from functools import reduce

    product = reduce(lambda a, b: a * b, [1, 2, 3, 4])
    print('product:', product)
    print("\n--- [2] Starting from an initializer ---")
    total = reduce(lambda acc, n: acc + n, [1, 2, 3], 10)
    print('total with initializer:', total)
    print("\n--- [3] Empty input and built-in alternatives ---")
    try:
        reduce(lambda a, b: a + b, [])
    except TypeError as exc:
        print('empty reduce error:', type(exc).__name__)

    print('sum instead:', sum([1, 2, 3]))
    print("\nLesson 07 practice completed successfully!")


if __name__ == "__main__":
    main()
