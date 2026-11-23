#!/usr/bin/env python3
"""Practice: Type Conversion

Module 03 - Python Basics, Lesson 13.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 13: Type Conversion")
    print("=" * 64)

    print("\n--- [1] Conversion constructors ---")
    for call, value in (
        ("str(36)", str(36)),
        ("int('36')", int("36")),
        ("float('3.5')", float("3.5")),
        ("bool(0)", bool(0)),
        ("bool('x')", bool("x")),
    ):
        print(f"{call:>14} -> {value!r:>8} ({type(value).__name__})")

    print("\n--- [2] Parsing vs truncating ---")
    print("int('42'):", int("42"))
    print("int(42.9):", int(42.9), "int(-42.9):", int(-42.9))
    try:
        int("42.9")
    except ValueError as error:
        print("expected ValueError:", error)
    print("int(float('42.9')):", int(float("42.9")))

    print("\n--- [3] Round-trip ---")
    age = 36
    text_age = str(age)
    rebuilt = int(text_age)
    print("text:", text_age, type(text_age).__name__)
    print("rebuilt:", rebuilt, isinstance(rebuilt, int))
    print("message:", "Next year: " + str(rebuilt + 1))
    print("=" * 64)
    print("Lesson 13 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
