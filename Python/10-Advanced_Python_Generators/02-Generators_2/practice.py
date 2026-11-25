#!/usr/bin/env python3
"""Practice for Lesson 02: Generators 2 — Module 10: Advanced Python Generators."""

from itertools import count, islice


def combine(*sources):
    """Yield every item from each source using yield from."""
    for source in sources:
        yield from source


def evens(values):
    """Yield only even values from an iterable."""
    for value in values:
        if value % 2 == 0:
            yield value


def scaled(values, factor):
    """Yield each input value multiplied by factor."""
    for value in values:
        yield value * factor


def multiples(of):
    """Yield an unbounded sequence of multiples."""
    for n in count(1):
        yield n * of


def main():
    print("=" * 64)
    print("  Lesson 02: Generators 2")
    print("=" * 64)

    print("\n--- [1] Generator expressions are lazy and one-shot ---")
    squares = (n * n for n in range(6) if n % 2 == 0)
    print("type:", type(squares).__name__)
    print("first:", next(squares))
    print("remaining as list:", list(squares))
    print("consumed again:", list(squares))

    print("\n--- [2] yield from delegates to each source ---")
    combined = combine([1, 2], (3, 4), "ab")
    print("combined:", list(combined))

    print("\n--- [3] Small generators compose into a pipeline ---")
    pipeline = scaled(evens(range(6)), 10)
    print("pipeline:", list(pipeline))

    print("\n--- [4] islice bounds an infinite generator ---")
    print("first five multiples of 3:", list(islice(multiples(3), 5)))
    print("items 3 through 5:", list(islice(multiples(3), 2, 5)))

    print("\n--- [5] The outer iterable of a generator expression is eager ---")
    calls = []

    def build_items():
        calls.append("called")
        return [1, 2, 3]

    lazy = (n for n in build_items())
    print("calls after creation:", calls)
    print("first value:", next(lazy))
    print("calls after first next:", calls)

    print("\nLesson 02 practice completed successfully!")


if __name__ == "__main__":
    main()
