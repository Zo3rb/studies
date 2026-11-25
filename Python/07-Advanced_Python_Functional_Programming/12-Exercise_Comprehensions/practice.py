#!/usr/bin/env python3
"""Practice for Lesson 12: Exercise - Comprehensions — Module 07: Advanced Python Functional Programming."""

def main():
    print("=" * 64)
    print("  Lesson 12: Exercise - Comprehensions")
    print("=" * 64)
    print("\n--- [1] Rewrite a map/filter chain ---")
    numbers = range(10)
    old = list(map(lambda n: n * 2, filter(lambda n: n % 2 == 0, numbers)))
    new = [n * 2 for n in numbers if n % 2 == 0]
    print('equivalent:', old == new, new)
    print("\n--- [2] Build a lookup table ---")
    users = [{'id': 1, 'name': 'Ana'}, {'id': 2, 'name': 'Ben'}]
    by_id = {user['id']: user['name'] for user in users}
    print('by_id:', by_id)
    print("\n--- [3] Prefer a loop when nesting grows ---")
    result = []
    for row in [[1, 2], [3, 4]]:
        for value in row:
            if value % 2 == 0:
                result.append(value)
    print('explicit loop:', result)
    print("\nLesson 12 practice completed successfully!")


if __name__ == "__main__":
    main()
