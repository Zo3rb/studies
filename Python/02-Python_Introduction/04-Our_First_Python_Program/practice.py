#!/usr/bin/env python3
"""Practice — Lesson 02: Our First Python Program | 02 — Python Introduction."""

def main():
    print("=" * 68)
    print("  Lesson: Our First Python Program")
    print("=" * 68)

    print("\n[1] The classic one-liner:")
    print("Hello, World!")

    print("\n[2] Same idea with a variable and an f-string:")
    name = "World"
    print(f"Hello, {name}!")

    print("\n[3] print() controls separators and endings:")
    print("a", "b", "c", sep=" | ")
    print("no newline here", end="")
    print(" → but now there is one")

    print("\n[4] Top-to-bottom execution:")
    greeting = "Hi"
    greeting = greeting + " there"
    print(f"  greeting is now: {greeting!r}")

    print("\n[5] print() returns None:")
    result = print("  this line is printed by print()")
    print(f"  but its return value is: {result!r}")

if __name__ == "__main__":
    main()

