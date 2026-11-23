#!/usr/bin/env python3
"""Practice: Methods vs Functions — Module 04, Python Basics II.

Contrasts built-in functions with bound methods and checks which operations mutate data.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 25: Methods vs Functions")
    print("=" * 64)
    print("--- [1] Functions vs methods ---")
    items = [1, 2]
    print(f"  function len(items) -> {len(items)}")
    items.append(3)
    print(f"  method items.append(3) -> {items}")
    print(f"  names: len={len.__name__}, append={items.append.__name__}")

    print()
    print("--- [2] self is supplied automatically ---")
    class Counter:
        def __init__(self):
            self.value = 0

        def increment(self, step=1):
            self.value += step
            return self.value

    counter = Counter()
    print(f"  increments: {counter.increment()}, {counter.increment(5)}")
    assert counter.value == 6

    print()
    print("--- [3] Methods that create a new object ---")
    text = "hello"
    upper = text.upper()
    print(f"  text={text!r}, upper={upper!r} (original unchanged)")
    assert text == "hello" and upper == "HELLO"

    print()
    print("--- [4] Methods that mutate in place ---")
    items = [3, 1, 2]
    returned = items.sort()
    print(f"  items.sort() returned {returned}; items is now {items}")
    assert returned is None and items == [1, 2, 3]
    fresh = sorted([3, 1, 2])
    print(f"  sorted([3, 1, 2]) -> {fresh} (new list)")

    print()
    print("--- [5] A module function is not a method ---")
    import math
    print(f"  math.sqrt(9) = {math.sqrt(9)}")
    print(f"  math.sqrt is a {type(math.sqrt).__name__}: no instance is passed")
    print()
    print("=" * 64)
    print(f"  Lesson 25 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
