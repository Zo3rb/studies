#!/usr/bin/env python3
"""Practice for Lesson 17: Dunder Methods — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 17: Dunder Methods")
    print("=" * 64)

    print("\n--- [1] Representation ---")
    class Point:
        def __init__(self, x, y):
            self.x, self.y = x, y

        def __repr__(self):
            return f"Point({self.x}, {self.y})"

        def __str__(self):
            return f"({self.x}, {self.y})"

    p = Point(2, 3)
    print("str:", str(p))
    print("repr:", repr(p))
    print("f-string:", f"{p}")

    print("\n--- [2] Container protocol ---")
    class Bag:
        def __init__(self, items):
            self.items = list(items)

        def __len__(self):
            return len(self.items)

        def __getitem__(self, index):
            return self.items[index]

        def __contains__(self, item):
            return item in self.items

    bag = Bag(["apple", "pear", "plum"])
    print("len:", len(bag))
    print("bag[1]:", bag[1])
    print("'pear' in bag:", "pear" in bag)

    print("\n--- [3] Iteration, equality and calling ---")
    class Counter:
        def __init__(self, value=2):
            self.value = value

        def __iter__(self):
            return iter(range(self.value))

        def __eq__(self, other):
            return self.value == other.value

        def __call__(self, step=1):
            self.value += step
            return self.value

    counter = Counter()
    print("list(iter):", list(counter))
    print("equality:", Counter(2) == Counter(2))
    print("call:", counter(3), "then value:", counter.value)
    print("__hash__ is None:", Counter.__hash__ is None)

    print("\nLesson 17 practice completed successfully!")


if __name__ == "__main__":
    main()
