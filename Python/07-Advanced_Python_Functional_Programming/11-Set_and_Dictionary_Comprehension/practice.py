#!/usr/bin/env python3
"""Practice for Lesson 11: Set and Dictionary Comprehension — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 11: Set and Dictionary Comprehension")
    print("=" * 64)
    print("\n--- [1] Set comprehension removes duplicates ---")
    words = ['apple', 'pear', 'apple']
    initials = {word[0] for word in words}
    print('initials:', sorted(initials))
    print("\n--- [2] Dictionary comprehension ---")
    names = ['Ana', 'Ben', 'Cy']
    lengths = {name: len(name) for name in names}
    print('lengths:', lengths)
    print("\n--- [3] Duplicate keys and filtering ---")
    pairs = [('a', 1), ('a', 9), ('b', 2)]
    print('last key wins:', {k: v for k, v in pairs})
    print('filtered:', {k: v for k, v in pairs if v > 1})
    print('empty set type:', type(set()).__name__)
    print("\nLesson 11 practice completed successfully!")


if __name__ == "__main__":
    main()
