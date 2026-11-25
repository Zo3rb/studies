#!/usr/bin/env python3
"""Practice for Lesson 02: Higher Order Functions — Module 08: Advanced Python Decorators."""

from functools import reduce


def main():
    print("=" * 64)
    print("  Lesson 02: Higher Order Functions")
    print("=" * 64)

    print("\n--- [1] Passing functions as arguments ---")
    def apply(func, value):
        return func(value)

    def shout(text):
        return text.upper()

    print("apply(abs, -7):", apply(abs, -7))
    print("apply(shout, 'hi'):", apply(shout, "hi"))

    print("\n--- [2] sorted with a key function ---")
    names = ["Grace", "Ada", "Linus"]
    print("names by length:", sorted(names, key=len))

    print("\n--- [3] map and filter are lazy iterators ---")
    values = [1, 2, 3, 4, 5]
    squares = map(lambda n: n * n, values)
    print("map object type:", type(squares).__name__)
    print("squares:", list(squares))
    print("evens:", list(filter(lambda n: n % 2 == 0, values)))
    print("reduce sum:", reduce(lambda a, b: a + b, values, 0))

    print("\n--- [4] A factory returns a closure ---")
    def make_multiplier(factor):
        def multiply(value):
            return value * factor
        return multiply

    double = make_multiplier(2)
    triple = make_multiplier(3)
    print("double(10):", double(10))
    print("triple(10):", triple(10))
    print("captured factor:", double.__closure__[0].cell_contents)

    print("\n--- [5] Late binding and the default-argument fix ---")
    def make_late():
        funcs = []
        for n in range(3):
            funcs.append(lambda: n)
        return funcs

    def make_early():
        funcs = []
        for n in range(3):
            funcs.append(lambda n=n: n)
        return funcs

    print("late results:", [func() for func in make_late()])
    print("early results:", [func() for func in make_early()])

    print("\nLesson 02 practice completed successfully!")


if __name__ == "__main__":
    main()
