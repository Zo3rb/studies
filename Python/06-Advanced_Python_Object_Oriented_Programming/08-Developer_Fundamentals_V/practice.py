#!/usr/bin/env python3
"""Practice for Lesson 08: Developer Fundamentals V — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 08: Developer Fundamentals V")
    print("=" * 64)

    print("\n--- [1] Global state versus an owning object ---")
    loose_items = []
    loose_items.append("pen")
    print("loose_items:", loose_items)

    class Cart:
        def __init__(self):
            self._items = []       # owned state

        @property
        def item_count(self):
            return len(self._items)

        def add(self, name, price):
            if price < 0:
                raise ValueError("price cannot be negative")
            self._items.append((name, price))

        def total(self):
            return self._sum()

        def _sum(self):            # small internal helper
            return sum(price for _, price in self._items)

    print("\n--- [2] Tell, don't ask ---")
    cart = Cart()
    cart.add("Book", 20)
    cart.add("Pen", 3)
    print("item_count:", cart.item_count)
    print("total:", cart.total())

    print("\n--- [3] Invariants are protected in one place ---")
    try:
        cart.add("Bad", -5)
    except ValueError as exc:
        print("ValueError:", exc)
    print("total unchanged:", cart.total())

    print("\n--- [4] A narrow public interface ---")
    print("public members:", [n for n in dir(cart) if not n.startswith("_")])

    print("\nLesson 08 practice completed successfully!")


if __name__ == "__main__":
    main()
