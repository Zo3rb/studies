#!/usr/bin/env python3
"""Practice for Lesson 05: filter() — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 05: filter()")
    print("=" * 64)
    print("\n--- [1] Filter with a named predicate ---")
    def is_even(n):
        return n % 2 == 0

    print('evens:', list(filter(is_even, range(10))))
    print("\n--- [2] Truthiness and filter(None, ...) ---")
    values = [0, 1, '', 'hi', None, []]
    print('truthy only:', list(filter(None, values)))
    print("\n--- [3] Compose filter and map ---")
    numbers = range(10)
    evens = filter(lambda n: n % 2 == 0, numbers)
    print('even squares:', list(map(lambda n: n * n, evens)))
    print("\nLesson 05 practice completed successfully!")


if __name__ == "__main__":
    main()
