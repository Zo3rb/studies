#!/usr/bin/env python3
"""Practice: String Concatenation

Module 03 - Python Basics, Lesson 12.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 12: String Concatenation")
    print("=" * 64)

    print("\n--- [1] Joining strings ---")
    first = "Hello,"
    name = "Andrei"
    print("without space:", first + name)
    print("with space:", first + " " + name)

    print("\n--- [2] Repetition ---")
    print("ha * 3:", "ha" * 3)
    print("separator:", "=" * 30)
    print("x * 0 is empty:", "x" * 0 == "")

    print("\n--- [3] Type errors and conversion ---")
    print("numeric strings:", "1" + "2")
    try:
        result = "Age: " + 36
    except TypeError as error:
        print("expected TypeError:", error)
    print("converted:", "Age: " + str(36))
    print("f-string:", f"Age: {36}")
    print("=" * 64)
    print("Lesson 12 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
