#!/usr/bin/env python3
"""Practice for Lesson 09: Exercise - Lambda Expressions — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 09: Exercise - Lambda Expressions")
    print("=" * 64)
    print("\n--- [1] Sort records by score ---")
    students = [('Ana', 88), ('Ben', 92), ('Cy', 75)]
    print('by score:', sorted(students, key=lambda s: s[1]))
    print("\n--- [2] Lambda with map and filter ---")
    values = [1, 2, 3, 4, 5]
    odds = filter(lambda n: n % 2 == 1, values)
    print('odd squares:', list(map(lambda n: n ** 2, odds)))
    print("\n--- [3] Multiple parameters and safe captures ---")
    add_offset = lambda x, offset: x + offset
    print('add_offset(4, 5):', add_offset(4, 5))
    funcs = [lambda x, n=n: x * n for n in (2, 3)]
    print('multipliers:', [f(4) for f in funcs])
    print("\nLesson 09 practice completed successfully!")


if __name__ == "__main__":
    main()
