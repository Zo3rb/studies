#!/usr/bin/env python3
"""Practice: Math Functions

Module 03 - Python Basics, Lesson 04.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 04: Math Functions")
    print("=" * 64)

    import math

    print("\n--- [1] Built-in helpers ---")
    print("abs(-8):", abs(-8))
    print("round(3.14159, 2):", round(3.14159, 2))
    print("pow(2, 5):", pow(2, 5))
    print("min/max:", min(4, 1, 9), max(4, 1, 9))
    print("sum([1, 2, 3]):", sum([1, 2, 3]))

    print("\n--- [2] math module ---")
    print("math.pi:", round(math.pi, 4))
    print("sqrt(16):", math.sqrt(16))
    print("floor(2.9) / ceil(2.1):", math.floor(2.9), math.ceil(2.1))
    print("gcd(12, 18):", math.gcd(12, 18))

    print("\n--- [3] Rounding and operators ---")
    print("round(2.5), round(3.5):", round(2.5), round(3.5))
    print("2 ** 10:", 2 ** 10)
    print("10 // 3, 10 % 3:", 10 // 3, 10 % 3)
    print("=" * 64)
    print("Lesson 04 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
