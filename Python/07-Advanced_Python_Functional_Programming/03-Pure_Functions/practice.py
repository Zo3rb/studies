#!/usr/bin/env python3
"""Practice for Lesson 03: Pure Functions — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 03: Pure Functions")
    print("=" * 64)
    print("\n--- [1] Deterministic output ---")
    def add(a, b):
        return a + b

    print('add(2, 3):', add(2, 3))
    print('repeat:', add(2, 3))
    print("\n--- [2] Mutation is a side effect ---")
    def impure(items):
        items.append(99)
        return len(items)

    def pure_length(items):
        return len(items) + 1

    data = [1, 2]
    print('impure result:', impure(data), 'data now:', data)
    print('pure result:', pure_length([1, 2]))
    print("\n--- [3] Test a pure function directly ---")
    def cube(x):
        return x ** 3

    assert cube(3) == 27
    print('cube(3) passes assertion:', cube(3))
    print("\nLesson 03 practice completed successfully!")


if __name__ == "__main__":
    main()
