#!/usr/bin/env python3
"""Practice: Immutability

Module 03 - Python Basics, Lesson 17.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 17: Immutability")
    print("=" * 64)

    print("\n--- [1] No item assignment ---")
    text = "cat"
    try:
        text[0] = "b"
    except TypeError as error:
        print("expected TypeError:", error)
    new_text = text.replace("c", "b")
    print("original:", text, "new:", new_text)

    print("\n--- [2] Rebinding vs sharing ---")
    a = "hello"
    b = a
    a = a.upper()
    print("a:", a, "b:", b, "same object:", a is b)

    print("\n--- [3] Building text efficiently ---")
    pieces = []
    for word in ("Python", "is", "fun"):
        pieces.append(word)
    sentence = " ".join(pieces)
    print("sentence:", sentence)
    print("hashable:", isinstance("key", str))
    print("=" * 64)
    print("Lesson 17 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
