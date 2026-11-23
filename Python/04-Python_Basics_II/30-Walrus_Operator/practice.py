#!/usr/bin/env python3
"""Practice: Walrus Operator — Module 04, Python Basics II.

Tests walrus expressions in conditions, loops, and comprehensions with correct parentheses.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 30: Walrus Operator")
    print("=" * 64)
    print("--- [1] Assign and test in one expression ---")
    data = [1, 2, 3, 4]
    if (n := len(data)) > 3:
        print(f"  large list: {n} items")
    else:
        print(f"  small list: {n} items")
    print(f"  n is still available: {n}")
    assert n == 4

    print()
    print("--- [2] Without parentheses the meaning changes ---")
    value = (m := 10) > 5
    print(f"  (m := 10) > 5 -> {value}, m={m}")
    wrong = (n := len(data) > 3)
    print(f"  (n := len(data) > 3) -> {wrong}, n={n} (a bool, not the length!)")

    print()
    print("--- [3] A read loop without repeated next() calls ---")
    lines = iter(["first", "second", None])
    while (line := next(lines, None)) is not None:
        print(f"  line: {line}")
    print(f"  loop ended with line={line}")

    print()
    print("--- [4] Walrus in a comprehension ---")
    values = [y for x in range(6) if (y := x * x) > 5]
    print(f"  squares greater than 5: {values}")
    print(f"  last y in enclosing scope: {y}")
    assert values == [9, 16, 25]

    print()
    print("--- [5] Guard clauses with match-like checks ---")
    def describe(text):
        if (length := len(text)) == 0:
            return "empty"
        return f"{length} characters: {text}"

    for sample in ("", "hi", "hello"):
        print(f"  {sample!r} -> {describe(sample)}")
    print()
    print("=" * 64)
    print(f"  Lesson 30 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
