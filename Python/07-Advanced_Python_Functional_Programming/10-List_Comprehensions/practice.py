#!/usr/bin/env python3
"""Practice for Lesson 10: List Comprehensions — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 10: List Comprehensions")
    print("=" * 64)
    print("\n--- [1] Basic comprehension ---")
    squares = [n * n for n in range(6)]
    print('squares:', squares)
    print("\n--- [2] Filtering inside the comprehension ---")
    evens = [n for n in range(10) if n % 2 == 0]
    print('evens:', evens)
    print("\n--- [3] Nested loops ---")
    pairs = [(x, y) for x in (1, 2) for y in 'ab']
    print('pairs:', pairs)
    print("\n--- [4] Generator expression vs list ---")
    gen = (n * n for n in range(3))
    print('sum of generator:', sum(gen))
    print("\nLesson 10 practice completed successfully!")


if __name__ == "__main__":
    main()
