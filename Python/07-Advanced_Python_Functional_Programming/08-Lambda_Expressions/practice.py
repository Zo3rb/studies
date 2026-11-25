#!/usr/bin/env python3
"""Practice for Lesson 08: Lambda Expressions — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 08: Lambda Expressions")
    print("=" * 64)
    print("\n--- [1] Anonymous functions ---")
    double = lambda x: x * 2
    print('double(7):', double(7))
    print("\n--- [2] Sorting with a key lambda ---")
    words = ['pear', 'apple', 'fig']
    print('by length:', sorted(words, key=lambda w: len(w)))
    print("\n--- [3] Conditional expressions in a lambda ---")
    grade = lambda score: 'pass' if score >= 60 else 'fail'
    print('grade(75):', grade(75))
    print("\n--- [4] Binding captured values ---")
    funcs = [lambda x, n=n: x + n for n in (1, 2, 3)]
    print('captured:', [f(10) for f in funcs])
    print("\nLesson 08 practice completed successfully!")


if __name__ == "__main__":
    main()
