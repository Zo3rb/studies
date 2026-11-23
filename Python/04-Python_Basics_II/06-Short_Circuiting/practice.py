#!/usr/bin/env python3
"""Practice: Short Circuiting — Module 04, Python Basics II.

Proves that the right operand may be skipped, shows returned operands, and guards unsafe operations.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 06: Short Circuiting")
    print("=" * 64)
    print("--- [1] and short-circuits on a falsey left operand ---")
    def evaluated(label):
        print(f"    evaluated {label}()")
        return True

    print("  False and evaluated('right'):")
    print("  ->", False and evaluated("right"))
    print("  True and evaluated('right'):")
    print("  ->", True and evaluated("right"))

    print()
    print("--- [2] or short-circuits on a truthy left operand ---")
    print("  True or evaluated('right'):")
    print("  ->", True or evaluated("right"))
    print("  False or evaluated('right'):")
    print("  ->", False or evaluated("right"))

    print()
    print("--- [3] and/or return operands, not always booleans ---")
    for expr, value in [
        ("0 or 'fallback'", 0 or "fallback"),
        ("'' or 'default'", "" or "default"),
        ("1 and 2", 1 and 2),
        ("[] and 'never'", [] and "never"),
        ("not []", not []),
    ]:
        print(f"  {expr:<18} -> {value!r}")

    print()
    print("--- [4] Guarding an out-of-range index ---")
    numbers = [10, 20, 30]
    for index in (-1, 0, 2, 5):
        in_range = 0 <= index < len(numbers)
        bigger = in_range and numbers[index] > 15
        print(f"  index={index}: in_range={in_range}, bigger_than_15={bigger}")

    print()
    print("--- [5] Guarding division by zero ---")
    for divisor in (0, 4):
        safe = divisor != 0 and 100 / divisor > 10
        print(f"  divisor={divisor}: {safe}")
    print()
    print("=" * 64)
    print(f"  Lesson 06 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
