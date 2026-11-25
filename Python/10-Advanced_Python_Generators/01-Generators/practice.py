#!/usr/bin/env python3
"""Practice for Lesson 01: Generators — Module 10: Advanced Python Generators."""

def countdown(n):
    """Yield n, n-1, ... 1 without building a list."""
    while n > 0:
        yield n
        n -= 1


def traced_pairs():
    """Show that statements after a yield run on the next resume."""
    print("  [body] before first yield")
    yield "first"
    print("  [body] resumed after first yield")
    yield "second"
    print("  [body] resumed after second yield")


def main():
    print("=" * 64)
    print("  Lesson 01: Generators")
    print("=" * 64)

    print("\n--- [1] A generator function returns a generator object ---")
    gen = countdown(3)
    print("type:", type(gen).__name__)
    print("has __iter__:", hasattr(gen, "__iter__"))
    print("has __next__:", hasattr(gen, "__next__"))

    print("\n--- [2] next() pulls one value at a time ---")
    print("first:", next(gen))
    print("second:", next(gen))
    print("third:", next(gen))

    print("\n--- [3] Exhaustion raises StopIteration ---")
    try:
        next(gen)
    except StopIteration:
        print("StopIteration raised — generator is exhausted")
    print("list(gen) after exhaustion:", list(gen))
    print("new countdown(2):", list(countdown(2)))

    print("\n--- [4] The body suspends and resumes lazily ---")
    for value in traced_pairs():
        print("  received:", value)

    print("\n--- [5] Iterable vs iterator vs generator ---")
    numbers = [1, 2, 3]
    print("iter(list) is list:", iter(numbers) is numbers)
    squares = (n * n for n in numbers)
    print("iter(generator) is generator:", iter(squares) is squares)
    print("squares:", list(squares))

    print("\nLesson 01 practice completed successfully!")


if __name__ == "__main__":
    main()
