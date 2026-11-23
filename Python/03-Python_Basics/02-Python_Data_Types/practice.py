#!/usr/bin/env python3
"""Practice: Python Data Types

Module 03 - Python Basics, Lesson 02.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 02: Python Data Types")
    print("=" * 64)

    print("\n--- [1] Scalar types ---")
    for value in (42, 3.14, True, "text", None):
        print(f"{value!r:>8} -> {type(value).__name__}")

    print("\n--- [2] Collection types ---")
    examples = {
        "list": ["a", "a", 2],
        "tuple": (10, 20),
        "set": {1, 2, 2},
        "dict": {"name": "Andrei", "age": 36},
    }
    for kind, example in examples.items():
        print(f"{kind:>6}: {example} ({type(example).__name__})")

    print("\n--- [3] Dynamic typing ---")
    value = 10
    print("first:", type(value).__name__, isinstance(value, int))
    value = "ten"
    print("after rebinding:", type(value).__name__, isinstance(value, str))
    print("=" * 64)
    print("Lesson 02 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
