#!/usr/bin/env python3
"""Practice: Developer Fundamentals I

Module 03 - Python Basics, Lesson 05.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 05: Developer Fundamentals I")
    print("=" * 64)

    print("\n--- [1] High-value fundamentals in one snippet ---")
    values = [1, 2, 3]
    total = 0
    for value in values:
        total += value
    print("values:", values, "total:", total)

    print("\n--- [2] Predict -> run -> compare ---")
    tests = [
        ("3 * (2 + 4)", 18, 3 * (2 + 4)),
        ("2 ** 3 + 1", 9, 2 ** 3 + 1),
        ("len('Python')", 6, len("Python")),
    ]
    for expression, predicted, actual in tests:
        print(f"{expression:>16} | predicted {predicted:>2} | actual {actual:>2} | match {predicted == actual}")

    print("\n--- [3] Practice checklist ---")
    for step in ("predict", "run", "compare", "explain mismatch"):
        print(f"[x] {step}")
    print("=" * 64)
    print("Lesson 05 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
