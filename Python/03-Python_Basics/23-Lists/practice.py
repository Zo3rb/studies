#!/usr/bin/env python3
"""Practice: Lists

Module 03 - Python Basics, Lesson 23.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 23: Lists")
    print("=" * 64)

    print("\n--- [1] Creating lists ---")
    empty = []
    basket = ["apple", "banana", 2, ["extra", "item"]]
    print("empty:", empty)
    print("basket:", basket)
    print("list('abc'):", list("abc"))

    print("\n--- [2] Indexing and membership ---")
    fruits = ["apple", "banana", "apple"]
    print("len:", len(fruits))
    print("first:", fruits[0], "last:", fruits[-1])
    print("'apple' in fruits:", "apple" in fruits)
    print("'pear' in fruits:", "pear" in fruits)

    print("\n--- [3] Mixed types ---")
    mixed = [1, "two", 3.0, True]
    print("items:", mixed)
    print("types:", [type(item).__name__ for item in mixed])
    print("=" * 64)
    print("Lesson 23 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
