#!/usr/bin/env python3
"""Practice: Indentation In Python — Module 04, Python Basics II.

Shows how indentation defines blocks, how nested levels work, and which indentation mistakes Python rejects.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 03: Indentation In Python")
    print("=" * 64)
    print("--- [1] Indentation marks block membership ---")
    weather = "rain"
    if weather == "rain":
        print("  inside: take an umbrella")
        print("  inside: wear boots")
    print("outside: leave the house")

    print()
    print("--- [2] Nested levels ---")
    for number in (1, 5, 25):
        if number > 10:
            print(f"  {number}: level 3 -> large")
        else:
            print(f"  {number}: level 3 -> small")

    print()
    print("--- [3] Comments and blank lines do not close a block ---")
    flag = True
    if flag:

        # still inside the if block
        print("  still inside after blank line and comment")

    print()
    print("--- [4] A class with an intentionally empty block ---")
    class Placeholder:
        pass

    instance = Placeholder()
    print(f"  created: {type(instance).__name__}")

    print()
    print("--- [5] A consistent four-space level in a function ---")
    def describe(value):
        if value == 0:
            return "zero"
        return "positive" if value > 0 else "negative"

    for sample in (-2, 0, 3):
        print(f"  {sample} -> {describe(sample)}")
    print()
    print("=" * 64)
    print(f"  Lesson 03 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
