#!/usr/bin/env python3
"""Practice: Functions — Module 04, Python Basics II.

Defines and calls functions, removes duplicated output code, and confirms local scope.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 21: Functions")
    print("=" * 64)
    print("--- [1] Defining and calling a function ---")
    def greet():
        print("  Hello from a function!")

    print("  Before the call")
    greet()
    greet()
    print("  After the calls")

    print()
    print("--- [2] DRY: replace repetition with one function ---")
    def banner(title):
        line = "*" * len(title)
        print(f"  {line}")
        print(f"  {title}")
        print(f"  {line}")

    banner("Summary")
    banner("Details")

    print()
    print("--- [3] Functions are objects ---")
    def square(value):
        result = value * value
        return result

    operation = square
    print(f"  operation is square: {operation is square}")
    print(f"  operation(5) = {operation(5)}")

    print()
    print("--- [4] Each call gets fresh local variables ---")
    def tally(value):
        local_total = value + 1
        return local_total

    print(f"  tally(1)={tally(1)}, tally(10)={tally(10)}")
    try:
        print(local_total)
    except NameError as exc:
        print(f"  local_total is not global -> {type(exc).__name__}")

    print()
    print("--- [5] A function calling another defined later ---")
    def outer():
        return inner() + 1

    def inner():
        return 41

    print(f"  outer() = {outer()}")
    assert outer() == 42
    print()
    print("=" * 64)
    print(f"  Lesson 21 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
