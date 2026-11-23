#!/usr/bin/env python3
"""Practice: Clean Code — Module 04, Python Basics II.

Refactors vague, duplicated code into named constants and focused, documented functions.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 27: Clean Code")
    print("=" * 64)
    print("--- [1] Before: vague names and magic numbers ---")
    def calc(a, b):
        return a * b * 0.9

    print(f"  calc(10, 5) = {calc(10, 5)}")

    print()
    print("--- [2] After: descriptive names and a named constant ---")
    DISCOUNT_RATE = 0.9

    def calculate_discounted_total(price, quantity):
        """Return the total after applying the standard discount."""
        return price * quantity * DISCOUNT_RATE

    print(f"  calculate_discounted_total(10, 5) = {calculate_discounted_total(10, 5)}")
    assert calculate_discounted_total(10, 5) == calc(10, 5)

    print()
    print("--- [3] DRY: one helper instead of repeated formatting ---")
    def format_price(amount):
        return f"${amount:.2f}"

    values = [5, 12.5, 99]
    print(f"  formatted prices: {[format_price(v) for v in values]}")
    assert format_price(5) == "$5.00"

    print()
    print("--- [4] Small focused functions compose cleanly ---")
    MINIMUM_AGE = 18
    MAX_RETRIES = 3

    def is_old_enough(age):
        return age >= MINIMUM_AGE

    def has_retries_left(retries):
        return retries < MAX_RETRIES

    def eligible(age, retries):
        return is_old_enough(age) and has_retries_left(retries)

    for age, retries in [(17, 0), (20, 2), (20, 3)]:
        print(f"  age={age}, retries={retries} -> {eligible(age, retries)}")
    assert eligible(20, 2) and not eligible(20, 3)

    print()
    print("--- [5] A docstring documents the contract ---")
    print(f"  helper docstring: {calculate_discounted_total.__doc__}")
    print()
    print("=" * 64)
    print(f"  Lesson 27 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
