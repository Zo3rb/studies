#!/usr/bin/env python3
"""Practice: Variables

Module 03 - Python Basics, Lesson 08.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 08: Variables")
    print("=" * 64)

    import keyword

    print("\n--- [1] Assignment and rebinding ---")
    score = 10
    print("initial:", score)
    score = score + 5
    print("after update:", score)

    print("\n--- [2] Naming rules ---")
    print("'class' is keyword:", keyword.iskeyword("class"))
    print("'total' is keyword:", keyword.iskeyword("total"))
    print("case-sensitive:", "score" != "Score")
    user_name = "Andrei"
    print("user_name:", user_name)

    print("\n--- [3] Chained and multiple assignment ---")
    x = y = 0
    first, second = 1, 2
    print("x, y:", x, y)
    print("first, second:", first, second)
    print("=" * 64)
    print("Lesson 08 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
