#!/usr/bin/env python3
"""Practice: List Methods

Module 03 - Python Basics, Lesson 26.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 26: List Methods")
    print("=" * 64)

    print("\n--- [1] Adding items ---")
    basket = ["apple", "banana"]
    basket.append("orange")
    basket.insert(1, "pear")
    basket.extend(["grape", "kiwi"])
    print("basket:", basket)

    print("\n--- [2] Removing items ---")
    last = basket.pop()
    print("popped:", last)
    basket.remove("apple")
    print("after remove('apple'):", basket)
    popped_index = basket.pop(0)
    print("pop(0):", popped_index)
    basket.clear()
    print("cleared:", basket)

    print("\n--- [3] Return values ---")
    items = [1, 2]
    result = items.append(3)
    print("append returned:", result)
    print("items still:", items)
    del items[0]
    print("after del items[0]:", items)
    print("=" * 64)
    print("Lesson 26 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
