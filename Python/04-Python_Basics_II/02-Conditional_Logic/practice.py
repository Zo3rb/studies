#!/usr/bin/env python3
"""Practice: Conditional Logic — Module 04, Python Basics II.

Translates everyday rules into comparison and Boolean expressions used by conditionals.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 02: Conditional Logic")
    print("=" * 64)
    print("--- [1] Comparison operators ---")
    x = 7
    for expression, result in [
        ("x == 7", x == 7),
        ("x != 3", x != 3),
        ("x > 10", x > 10),
        ("x <= 7", x <= 7),
        ("1 < x <= 10", 1 < x <= 10),
    ]:
        print(f"  {expression:<14} -> {result}")

    print()
    print("--- [2] Conditions built with arithmetic ---")
    number = 12
    print(f"  {number} is even? {number % 2 == 0}")
    for year in (1900, 2000, 2023, 2024):
        leap = year % 400 == 0 or (year % 4 == 0 and year % 100 != 0)
        print(f"  {year} leap year? {leap}")

    print()
    print("--- [3] Translating a rule into boolean variables ---")
    age = 21
    has_ticket = True
    is_vip = False
    is_adult = age >= 18
    has_access = has_ticket or is_vip
    print(f"  is_adult={is_adult}, has_access={has_access}")
    if is_adult and has_access:
        print("  Entry allowed")
    else:
        print("  Entry denied")

    print()
    print("--- [4] String comparisons ---")
    print(f"  'apple' < 'banana' -> {'apple' < 'banana'}")
    print(f"  'Zebra' < 'apple' -> {'Zebra' < 'apple'} (Unicode order!)")
    print()
    print("=" * 64)
    print(f"  Lesson 02 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
