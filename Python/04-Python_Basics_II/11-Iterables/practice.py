#!/usr/bin/env python3
"""Practice: Iterables — Module 04, Python Basics II.

Explores iter()/next(), lazy generators, dictionary iteration, and tuple unpacking.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 11: Iterables")
    print("=" * 64)
    print("--- [1] Iterable vs iterator ---")
    items = ["a", "b", "c"]
    iterator = iter(items)
    print(f"  iter(items) type: {type(iterator).__name__}")
    print(f"  next -> {next(iterator)}, next -> {next(iterator)}")
    print(f"  next with default after exhaustion: {next(iterator, 'DONE')}")

    print()
    print("--- [2] What a for loop does implicitly ---")
    numbers = (10, 20)
    manual = iter(numbers)
    while True:
        try:
            value = next(manual)
        except StopIteration:
            break
        print(f"  manual next: {value}")

    print()
    print("--- [3] Lazy generators and range ---")
    def squares(limit):
        for n in range(limit):
            yield n * n

    print(f"  squares(4): {list(squares(4))}")
    print(f"  len(range(1000000)) = {len(range(1000000))} (no million-item list built)")

    print()
    print("--- [4] Dictionary iteration patterns ---")
    prices = {"apple": 2, "pear": 3}
    print(f"  keys: {list(prices)}")
    print(f"  values: {list(prices.values())}")
    for name, price in prices.items():
        print(f"  {name} costs {price}")
    for index, name in enumerate(prices, start=1):
        print(f"  #{index}: {name}")

    print()
    print("--- [5] Unpacking while iterating ---")
    pairs = [("x", 1), ("y", 2)]
    for letter, number in pairs:
        print(f"  {letter}={number}")
    print()
    print("=" * 64)
    print(f"  Lesson 11 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
