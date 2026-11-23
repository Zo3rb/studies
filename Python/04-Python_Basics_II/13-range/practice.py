#!/usr/bin/env python3
"""Practice: range() — Module 04, Python Basics II.

Prints all range forms, demonstrates lazy indexing and membership, and counts down safely.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 13: range()")
    print("=" * 64)
    print("--- [1] The three forms of range() ---")
    print(f"  list(range(5))        -> {list(range(5))}")
    print(f"  list(range(2, 8))     -> {list(range(2, 8))}")
    print(f"  list(range(0, 10, 2)) -> {list(range(0, 10, 2))}")

    print()
    print("--- [2] The stop value is excluded ---")
    for stop in (3, 5, 10):
        values = list(range(stop))
        print(f"  range({stop}) -> {values} (length {len(values)})")

    print()
    print("--- [3] range objects are lazy but indexable ---")
    r = range(10, 20, 3)
    print(f"  type={type(r).__name__}, len={len(r)}, first={r[0]}, last={r[-1]}")
    print(f"  slice r[1:] -> {r[1:]}")
    print(f"  13 in r -> {13 in r}; 14 in r -> {14 in r}")

    print()
    print("--- [4] Counting backwards ---")
    print(f"  list(range(5, 0, -1))  -> {list(range(5, 0, -1))}")
    print(f"  list(range(10, 0, -2)) -> {list(range(10, 0, -2))}")
    print(f"  reversed([1, 2, 3])    -> {list(reversed([1, 2, 3]))}")

    print()
    print("--- [5] Looping with and without an index ---")
    items = ["alpha", "beta", "gamma"]
    for index in range(len(items)):
        print(f"  index {index}: {items[index]}")
    for _ in range(2):
        print("  repeated exactly twice")
    print()
    print("=" * 64)
    print(f"  Lesson 13 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
