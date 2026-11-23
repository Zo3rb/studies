#!/usr/bin/env python3
"""Practice: Built-In Functions + Methods

Module 03 - Python Basics, Lesson 18.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 18: Built-In Functions + Methods")
    print("=" * 64)

    print("\n--- [1] Built-in functions ---")
    text = "Hello"
    items = [3, 1, 2]
    print("len(text), len(items):", len(text), len(items))
    print("type:", type(text).__name__)
    print("sorted(items):", sorted(items))

    print("\n--- [2] String methods ---")
    raw = "  Hello, World  "
    print("strip().upper():", raw.strip().upper())
    print("find('World'):", raw.find("World"))
    print("replace:", raw.replace("World", "Python"))
    print("split:", raw.split())

    print("\n--- [3] Chaining and return values ---")
    email = "  User@Example.COM "
    normalized = email.strip().lower()
    print("normalized:", normalized)
    print("at index:", normalized.find("@"))
    print("missing index:", normalized.find("!"))
    print("startswith:", normalized.startswith("user@"))
    print("=" * 64)
    print("Lesson 18 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
