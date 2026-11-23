#!/usr/bin/env python3
"""Practice: Common List Patterns

Module 03 - Python Basics, Lesson 29.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 29: Common List Patterns")
    print("=" * 64)

    fruits = ["apple", "banana", "kiwi"]

    print("\n--- [1] Length and iteration ---")
    print("count:", len(fruits))
    print("enumerated:", list(enumerate(fruits)))

    print("\n--- [2] Reversing and ranges ---")
    print("reversed:", fruits[::-1])
    print("range(5):", list(range(5)))
    print("range(1, 10, 2):", list(range(1, 10, 2)))

    print("\n--- [3] Joining strings ---")
    words = ["Python", "is", "fun"]
    print("space join:", " ".join(words))
    print("dash join:", "-".join(words))
    print("numbers joined:", " ".join(str(n) for n in [1, 2, 3]))
    try:
        ",".join([1, 2])
    except TypeError as error:
        print("expected TypeError:", error)
    print("=" * 64)
    print("Lesson 29 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
