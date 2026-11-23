#!/usr/bin/env python3
"""Practice: return — Module 04, Python Basics II.

Checks early returns, implicit None, tuple unpacking, and return-versus-print behaviour.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 24: return")
    print("=" * 64)
    print("--- [1] return sends a value back and ends the call ---")
    def double(value):
        return value * 2
        print("  unreachable: never printed")

    result = double(4)
    print(f"  double(4) -> {result} ({type(result).__name__})")

    print()
    print("--- [2] No return means None ---")
    def no_return():
        value = 1

    print(f"  no_return() -> {no_return()}")
    print(f"  explicit None -> {None}")

    print()
    print("--- [3] Early-return guard clauses ---")
    def divide(a, b):
        if b == 0:
            return None
        return a / b

    for divisor in (0, 4, -2):
        print(f"  10 / {divisor} -> {divide(10, divisor)}")
    assert divide(10, 0) is None and divide(10, 4) == 2.5

    print()
    print("--- [4] Returning multiple values as a tuple ---")
    def min_max(values):
        return min(values), max(values)

    low, high = min_max([4, 1, 9, 3])
    print(f"  min_max([4, 1, 9, 3]) -> ({low}, {high})")
    packed = min_max([4, 1, 9, 3])
    print(f"  packed tuple: {packed}")
    assert packed == (1, 9)

    print()
    print("--- [5] return vs print ---")
    def noisy_sum(values):
        print(f"  noisy_sum prints: {sum(values)}")

    def pure_sum(values):
        return sum(values)

    printed = noisy_sum([1, 2, 3])
    returned = pure_sum([1, 2, 3])
    print(f"  noisy_sum returns: {printed}")
    print(f"  pure_sum returns:  {returned}")
    assert printed is None and returned == 6
    print()
    print("=" * 64)
    print(f"  Lesson 24 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
