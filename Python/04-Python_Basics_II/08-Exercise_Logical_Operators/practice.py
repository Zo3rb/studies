#!/usr/bin/env python3
"""Practice: Exercise - Logical Operators — Module 04, Python Basics II.

Solves validation exercises with named boolean tests, boundary checks, and self-verifying assertions.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 08: Exercise - Logical Operators")
    print("=" * 64)
    print("--- [1] Exercise: movie ticket eligibility ---")
    def can_watch(age, has_parent, is_rated_g):
        """Adults may watch anything; minors need a parent except for G-rated films."""
        is_adult = age >= 18
        return is_adult or is_rated_g or has_parent

    for age, has_parent, rated_g in [(12, False, False), (12, True, False), (12, False, True), (18, False, False)]:
        print(f"  age={age}, parent={has_parent}, G-rated={rated_g} -> {can_watch(age, has_parent, rated_g)}")
    assert can_watch(12, False, False) is False
    assert can_watch(12, True, False) is True
    assert can_watch(18, False, False) is True

    print()
    print("--- [2] Exercise: positive even numbers only ---")
    def positive_even(number):
        return number > 0 and number % 2 == 0

    for value in (-4, 0, 3, 4, 10):
        print(f"  {value}: {positive_even(value)}")
    assert [n for n in range(-2, 7) if positive_even(n)] == [2, 4, 6]

    print()
    print("--- [3] Exercise: safe non-empty uppercase word ---")
    def starts_upper(text):
        return bool(text) and text[0].isupper()

    for word in ("", "python", "Python"):
        print(f"  {word!r}: {starts_upper(word)}")
    assert starts_upper("") is False
    assert starts_upper("Python") is True

    print()
    print("--- [4] Exercise: equivalent negative rules ---")
    def blocked_1(is_open, has_items):
        return not is_open or not has_items

    def blocked_2(is_open, has_items):
        return not (is_open and has_items)

    for is_open in (False, True):
        for has_items in (False, True):
            a, b = blocked_1(is_open, has_items), blocked_2(is_open, has_items)
            assert a == b
            print(f"  open={is_open}, items={has_items} -> blocked={a}")

    print()
    print("All exercise assertions passed.")
    print()
    print("=" * 64)
    print(f"  Lesson 08 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
