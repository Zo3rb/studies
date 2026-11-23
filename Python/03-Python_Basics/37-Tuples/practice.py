#!/usr/bin/env python3
"""Practice: Tuples

Module 03 - Python Basics, Lesson 37.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 37: Tuples")
    print("=" * 64)

    print("\n--- [1] Creating tuples ---")
    point = (10, 20)
    single = (42,)
    empty = ()
    print("point:", point)
    print("single:", single, "type:", type(single).__name__)
    print("empty:", empty)
    print("from list:", tuple([1, 2, 3]))
    print("(42) is:", type(42).__name__)

    print("\n--- [2] Immutability and hashability ---")
    try:
        point[0] = 5
    except TypeError as error:
        print("expected TypeError:", error)
    lookup = {(10, 20): "origin"}
    print("lookup:", lookup[(10, 20)])
    try:
        hash((1, [2]))
    except TypeError as error:
        print("expected TypeError:", error)

    print("\n--- [3] Fixed data ---")
    rgb = (255, 128, 0)
    print("rgb:", rgb, "red:", rgb[0], "green:", rgb[1])
    print("=" * 64)
    print("Lesson 37 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
