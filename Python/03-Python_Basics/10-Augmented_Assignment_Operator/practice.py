#!/usr/bin/env python3
"""Practice: Augmented Assignment Operator

Module 03 - Python Basics, Lesson 10.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 10: Augmented Assignment Operator")
    print("=" * 64)

    print("\n--- [1] Add and rebind ---")
    score = 5
    print("start:", score)
    score += 2
    print("after += 2:", score)
    score *= 3
    print("after *= 3:", score)

    print("\n--- [2] Full numeric set ---")
    value = 20
    for step in (" /= 4", " //= 2", " %= 2", " **= 3"):
        if step.startswith(" /"):
            value /= 4
        elif step.startswith(" //"):
            value //= 2
        elif step.startswith(" %"):
            value %= 2
        else:
            value **= 3
        print(f"after{step:>7} -> {value} ({type(value).__name__})")

    print("\n--- [3] Strings and lists ---")
    text = "Hi"
    text += "!"
    items = [1]
    alias = items
    items += [2]
    print("text:", text)
    print("items:", items, "alias:", alias, "same object:", items is alias)
    print("=" * 64)
    print("Lesson 10 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
