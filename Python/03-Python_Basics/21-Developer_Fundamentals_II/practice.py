#!/usr/bin/env python3
"""Practice: Developer Fundamentals II

Module 03 - Python Basics, Lesson 21.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 21: Developer Fundamentals II")
    print("=" * 64)

    print("\n--- [1] Self-explanatory code ---")
    SECONDS_PER_DAY = 24 * 60 * 60
    print("SECONDS_PER_DAY:", SECONDS_PER_DAY)

    print("\n--- [2] Comment the why ---")


    def retry_delay(attempt):
        '''Return a capped exponential backoff in seconds.'''
        # Cap at 60s so a stalled job does not block the queue forever.
        return min(2 ** attempt, 60)


    print("retry_delay(3):", retry_delay(3))
    print("retry_delay(10):", retry_delay(10))
    print("docstring:", retry_delay.__doc__)

    print("\n--- [3] Keep comments accurate ---")
    items = [4, 2, 7]
    items.sort()
    print("sorted items:", items)
    print("=" * 64)
    print("Lesson 21 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
