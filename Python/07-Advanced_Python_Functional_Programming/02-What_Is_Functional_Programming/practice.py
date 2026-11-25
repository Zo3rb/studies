#!/usr/bin/env python3
"""Practice for Lesson 02: What Is Functional Programming? — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 02: What Is Functional Programming?")
    print("=" * 64)
    print("\n--- [1] Imperative vs declarative ---")
    squares_loop = []
    for n in range(5):
        squares_loop.append(n * n)
    squares_comp = [n * n for n in range(5)]
    print('imperative:', squares_loop)
    print('declarative:', squares_comp)
    print("\n--- [2] Pure functions depend only on arguments ---")
    def area(width, height):
        return width * height

    print('area(3, 4):', area(3, 4))
    print("\n--- [3] Referential transparency ---")
    first = area(3, 4)
    second = area(3, 4)
    print('same result:', first == second, 'sum:', first + second)
    print("\nLesson 02 practice completed successfully!")


if __name__ == "__main__":
    main()
