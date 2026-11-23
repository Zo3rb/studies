#!/usr/bin/env python3
"""Practice: Formatted Strings

Module 03 - Python Basics, Lesson 15.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 15: Formatted Strings")
    print("=" * 64)

    name = "Andrei"
    score = 95.5

    print("\n--- [1] f-strings ---")
    print(f"Hello, {name}!")
    print(f"Score: {score:.1f}")
    print(f"Items: {1234567:,}")
    print(f"2 + 3 = {2 + 3}")
    print(f"Literal braces: {{ok}}")

    print("\n--- [2] Legacy formatting ---")
    print("Hello, {}!".format(name))
    print("{0} + {1} = {2}".format(2, 3, 5))
    print("Hello, %(name)s" % {"name": name})
    print("Score: %.1f" % score)

    print("\n--- [3] Conversions and errors ---")
    print(f"str: {name!s} | repr: {name!r}")
    try:
        print("{} {}".format("only one"))
    except IndexError as error:
        print("expected IndexError:", error)
    print("extra ignored:", "{}".format(1, 2))
    print("=" * 64)
    print("Lesson 15 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
