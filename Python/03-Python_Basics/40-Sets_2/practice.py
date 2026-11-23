#!/usr/bin/env python3
"""Practice: Sets 2

Module 03 - Python Basics, Lesson 40.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 40: Sets 2")
    print("=" * 64)

    a = {1, 2, 3}
    b = {3, 4, 5}

    print("\n--- [1] Set algebra ---")
    print("a:", sorted(a), "b:", sorted(b))
    print("union:", sorted(a | b))
    print("intersection:", sorted(a & b))
    print("difference a-b:", sorted(a - b))
    print("symmetric difference:", sorted(a ^ b))
    print("method union matches:", a.union(b) == a | b)

    print("\n--- [2] Relationships ---")
    small = {1, 2}
    large = {1, 2, 3}
    print("small <= large:", small <= large)
    print("large >= small:", large >= small)
    print("isdisjoint({8, 9}):", small.isdisjoint({8, 9}))
    print("proper subset:", small < large)

    print("\n--- [3] Mutating variants ---")
    left = {1, 2, 3}
    new_set = left.union(b)
    print("union returned:", sorted(new_set), "left unchanged:", sorted(left))
    left.intersection_update(b)
    print("after intersection_update:", sorted(left))
    left.discard(3)
    left.add(9)
    print("after discard/add:", sorted(left))
    print("=" * 64)
    print("Lesson 40 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
