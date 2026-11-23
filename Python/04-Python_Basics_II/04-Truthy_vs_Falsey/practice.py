#!/usr/bin/env python3
"""Practice: Truthy vs Falsey — Module 04, Python Basics II.

Tests bool() across common values and uses truthiness to filter data safely.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 04: Truthy vs Falsey")
    print("=" * 64)
    print("--- [1] bool() reveals truthiness ---")
    values = (False, None, 0, 0.0, "", [], (), {}, set(), 1, -3, "x", [0], {"k": 0})
    for value in values:
        print(f"  {value!r:<12} -> bool() = {bool(value)}")

    print()
    print("--- [2] Implicit conditions in if statements ---")
    name = ""
    items = [1, 2, 3]
    if name:
        print("  name provided")
    else:
        print("  name is empty (falsey)")

    if items:
        print(f"  found {len(items)} items")
    else:
        print("  no items")

    print()
    print("--- [3] Filtering with truthiness ---")
    records = ["ada", "", "grace", None, "linus", 0]
    valid = [record for record in records if record]
    print(f"  original: {records}")
    print(f"  filtered: {valid}")

    print()
    print("--- [4] Custom objects can define truthiness ---")
    class Basket:
        def __init__(self, items):
            self.items = items

        def __len__(self):
            return len(self.items)

    for basket in (Basket([]), Basket(["apple"])):
        print(f"  {basket.items!r} -> {bool(basket)}")
    print()
    print("=" * 64)
    print(f"  Lesson 04 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
