#!/usr/bin/env python3
"""Practice for Lesson 05: Exercise - Fibonacci Numbers — Module 10: Advanced Python Generators."""

from itertools import islice, takewhile


def fibonacci():
    """Yield the infinite Fibonacci sequence starting at 0, 1, 1, 2, ..."""
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b


def first_fibonacci(count):
    """Yield exactly count Fibonacci numbers."""
    a, b = 0, 1
    for _ in range(count):
        yield a
        a, b = b, a + b


def fib_recursive(n, calls):
    """Naive recursive version that records how many calls it makes."""
    calls[0] += 1
    if n < 2:
        return n
    return fib_recursive(n - 1, calls) + fib_recursive(n - 2, calls)


def main():
    print("=" * 64)
    print("  Lesson 05: Exercise - Fibonacci Numbers")
    print("=" * 64)

    print("\n--- [1] An infinite generator, bounded by islice ---")
    print("first ten:", list(islice(fibonacci(), 10)))

    print("\n--- [2] A generator bounded by count ---")
    print("first eight:", list(first_fibonacci(8)))

    print("\n--- [3] Bounded by value with takewhile ---")
    under_hundred = list(takewhile(lambda n: n <= 100, fibonacci()))
    print("values <= 100:", under_hundred)

    print("\n--- [4] A positional slice without materializing the prefix ---")
    print("indices 10 through 14:", list(islice(fibonacci(), 10, 15)))

    print("\n--- [5] Iterative state vs exponential recursion ---")
    calls = [0]
    recursive_value = fib_recursive(8, calls)
    iterative_value = list(islice(fibonacci(), 9))[-1]
    print("fib(8) recursively:", recursive_value)
    print("recursive calls:", calls[0])
    print("fib(8) iteratively:", iterative_value)
    print("iterative values yielded:", 9)

    print("\nLesson 05 practice completed successfully!")


if __name__ == "__main__":
    main()
