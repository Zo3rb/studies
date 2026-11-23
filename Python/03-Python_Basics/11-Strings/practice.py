#!/usr/bin/env python3
"""Practice: Strings

Module 03 - Python Basics, Lesson 11.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 11: Strings")
    print("=" * 64)

    print("\n--- [1] Creating strings ---")
    single = "hello"
    double = "it's fine"
    multiline = '''line 1
    line 2'''
    print("single:", single)
    print("double:", double)
    print("multiline:", repr(multiline))
    print("empty length:", len(""))

    print("\n--- [2] Ordered sequences ---")
    word = "Python"
    print("len:", len(word), "first:", word[0], "last:", word[-1])
    print("characters:", " ".join(word))

    print("\n--- [3] Login greeting ---")
    username = "Andrei"
    greeting = "Welcome, " + username + "!"
    print(greeting)
    print("upper:", greeting.upper())
    print("=" * 64)
    print("Lesson 11 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
