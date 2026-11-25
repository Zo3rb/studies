#!/usr/bin/env python3
"""Practice for Lesson 13: Exercise - Imposter Syndrome — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 13: Exercise - Imposter Syndrome")
    print("=" * 64)
    print("\n--- [1] Record a small win ---")
    values = [1, 2, 3, 4]
    result = [n * n for n in values if n % 2 == 0]
    print('pipeline result:', result)
    print("\n--- [2] Deliberate practice adds up ---")
    def practice(attempts):
        return [attempt * 2 for attempt in range(attempts)]

    print('practice rounds:', practice(3))
    print("\n--- [3] Evidence beats feelings ---")
    solved = ['lambda sort key', 'dict comprehension', 'reduce with initializer']
    print(f'Concepts practiced: {len(solved)}')
    print("\nLesson 13 practice completed successfully!")


if __name__ == "__main__":
    main()
