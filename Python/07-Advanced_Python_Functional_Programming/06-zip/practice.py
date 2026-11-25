#!/usr/bin/env python3
"""Practice for Lesson 06: zip() — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 06: zip()")
    print("=" * 64)
    print("\n--- [1] Pair two sequences ---")
    names = ['Ana', 'Ben', 'Cy']
    scores = [88, 92, 75]
    for name, score in zip(names, scores):
        print(f'{name}: {score}')
    print("\n--- [2] Shortest input wins ---")
    pairs = list(zip([1, 2, 3], ['a', 'b']))
    print('pairs:', pairs)
    print("\n--- [3] Unzip with the star operator ---")
    letters, numbers = zip(*pairs)
    print('letters:', letters)
    print('numbers:', numbers)
    print("\nLesson 06 practice completed successfully!")


if __name__ == "__main__":
    main()
