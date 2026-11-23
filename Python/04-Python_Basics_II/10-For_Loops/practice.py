#!/usr/bin/env python3
"""Practice: For Loops — Module 04, Python Basics II.

Iterates sequences, builds totals with accumulators, and prints a nested-loop grid.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 10: For Loops")
    print("=" * 64)
    print("--- [1] Basic for loop over a list ---")
    fruits = ["apple", "banana", "cherry"]
    for fruit in fruits:
        print(f"  I like {fruit}")
    print(f"  loop variable after the loop: {fruit!r}")

    print()
    print("--- [2] Looping over a string and a tuple ---")
    for character in "tab":
        print(f"  character: {character}")
    for pair in ((1, "one"), (2, "two")):
        print(f"  tuple unpacked: {pair[0]} -> {pair[1]}")

    print()
    print("--- [3] Accumulators: total, count, average ---")
    numbers = [3, 5, 8, 12]
    total = 0
    count = 0
    for number in numbers:
        total += number
        count += 1
    print(f"  total={total}, count={count}, average={total / count:.2f}")
    assert total == 28 and count == 4

    print()
    print("--- [4] Nested loops: multiplication table ---")
    for row in range(1, 4):
        products = []
        for column in range(1, 4):
            products.append(f"{row * column:>2}")
        print("  " + " ".join(products))

    print()
    print("--- [5] Building a filtered list instead of mutating during iteration ---")
    values = [1, 2, 3, 4, 5, 6]
    evens = []
    for value in values:
        if value % 2 == 0:
            evens.append(value)
    print(f"  evens: {evens}")
    assert evens == [2, 4, 6]
    print()
    print("=" * 64)
    print(f"  Lesson 10 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
