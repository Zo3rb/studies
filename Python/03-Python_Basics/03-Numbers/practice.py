#!/usr/bin/env python3
"""Practice: Numbers

Module 03 - Python Basics, Lesson 03.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 03: Numbers")
    print("=" * 64)

    print("\n--- [1] Literals and types ---")
    for value in (42, 3.14, 1_000_000, 1e3):
        print(f"{value!r:>12} -> {type(value).__name__}")

    print("\n--- [2] Arithmetic operators ---")
    a, b = 7, 3
    print(f"{a} + {b} = {a + b}")
    print(f"{a} - {b} = {a - b}")
    print(f"{a} * {b} = {a * b}")
    print(f"{a} / {b} = {a / b} ({type(a / b).__name__})")
    print(f"{a} // {b} = {a // b}")
    print(f"{a} % {b} = {a % b}")
    print(f"2 ** 3 = {2 ** 3}")

    print("\n--- [3] Floor, modulo, divmod ---")
    print("-7 // 2 =", -7 // 2)
    print("17 % 5 =", 17 % 5)
    print("divmod(17, 5) =", divmod(17, 5))
    print("=" * 64)
    print("Lesson 03 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
