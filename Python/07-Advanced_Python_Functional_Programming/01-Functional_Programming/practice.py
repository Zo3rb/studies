#!/usr/bin/env python3
"""Practice for Lesson 01: Functional Programming — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 01: Functional Programming")
    print("=" * 64)
    print("\n--- [1] Functions are values ---")
    def double(x):
        return 2 * x

    f = double
    print('double(5) via alias:', f(5))
    print("\n--- [2] Higher-order functions take behavior ---")
    def apply(func, values):
        return [func(value) for value in values]

    print('uppercase:', apply(str.upper, ['a', 'b', 'c']))
    print("\n--- [3] A small functional pipeline ---")
    values = list(range(1, 8))
    odds = filter(lambda n: n % 2 == 1, values)
    doubled = map(lambda n: n * 2, odds)
    print('pipeline:', list(doubled))
    print("\nLesson 01 practice completed successfully!")


if __name__ == "__main__":
    main()
