#!/usr/bin/env python3
"""Practice for Lesson 04: map() — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 04: map()")
    print("=" * 64)
    print("\n--- [1] map applies a function to every item ---")
    def square(x):
        return x * x

    squares = map(square, [1, 2, 3, 4])
    print('squares:', list(squares))
    print("\n--- [2] Multiple iterables ---")
    left = [1, 2, 3]
    right = [10, 20, 30]
    combined = map(lambda a, b: a + b, left, right)
    print('sums:', list(combined))
    print("\n--- [3] Lazy, one-shot iteration ---")
    scores = map(str, [1, 2, 3])
    print('first:', next(scores))
    print('rest:', list(scores))
    print("\nLesson 04 practice completed successfully!")


if __name__ == "__main__":
    main()
