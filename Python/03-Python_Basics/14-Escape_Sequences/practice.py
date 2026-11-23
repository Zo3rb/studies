#!/usr/bin/env python3
"""Practice: Escape Sequences

Module 03 - Python Basics, Lesson 14.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 14: Escape Sequences")
    print("=" * 64)

    print("\n--- [1] Common escapes ---")
    print("It's working")
    print("She said, \"hello\"")
    print("C:\\Users\\Andrei")
    print("one\ntwo")
    print("col1\tcol2")

    print("\n--- [2] Quote choices ---")
    print("It's easy")
    print('He said "hi"')
    print('It\'s quoted')

    print("\n--- [3] Newlines, tabs, repr ---")
    print("Line 1\nLine 2")
    print("Name\tScore")
    print("repr of a newline string:", repr("a\nb"))
    print("raw path:", r"C:\Users\Andrei")
    print("=" * 64)
    print("Lesson 14 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
