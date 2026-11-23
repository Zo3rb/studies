#!/usr/bin/env python3
"""Practice: Operator Precedence

Module 03 - Python Basics, Lesson 06.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 06: Operator Precedence")
    print("=" * 64)

    print("\n--- [1] Precedence ladder ---")
    expressions = [
        ("20 - 3 + 5", 20 - 3 + 5),
        ("20 + 3 * 4", 20 + 3 * 4),
        ("(20 + 3) * 4", (20 + 3) * 4),
        ("2 + 3 ** 2", 2 + 3 ** 2),
    ]
    for text, value in expressions:
        print(f"{text:>16} = {value}")

    print("\n--- [2] Associativity ---")
    print("8 / 4 / 2 =", 8 / 4 / 2)
    print("2 ** 3 ** 2 =", 2 ** 3 ** 2)
    print("(2 ** 3) ** 2 =", (2 ** 3) ** 2)

    print("\n--- [3] Comparisons and logic ---")
    x = 4
    print("x + 1 > 5 =", x + 1 > 5)
    print("x > 2 and x < 10 =", x > 2 and x < 10)
    print("=" * 64)
    print("Lesson 06 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
