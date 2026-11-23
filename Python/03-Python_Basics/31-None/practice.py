#!/usr/bin/env python3
"""Practice: None

Module 03 - Python Basics, Lesson 31.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 31: None")
    print("=" * 64)

    print("\n--- [1] The singleton ---")
    value = None
    print("value:", value, "type:", type(value).__name__)
    print("is None:", value is None)
    print("None == 0:", None == 0)
    print("None == False:", None == False)

    print("\n--- [2] Placeholder value ---")
    weapon = None
    print("equipped:", weapon)
    weapon = "sword"
    print("equipped:", weapon)

    print("\n--- [3] Falsiness and implicit None ---")
    print("bool(None):", bool(None))
    sample = {"a": 1}
    print("get('b'):", sample.get("b"))
    print("get('b', 0):", sample.get("b", 0))
    print("=" * 64)
    print("Lesson 31 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
