#!/usr/bin/env python3
"""Practice: enumerate() — Module 04, Python Basics II.

Demonstrates enumerate pairs, custom start values, unpacking, and mutation by index.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 14: enumerate()")
    print("=" * 64)
    print("--- [1] enumerate() returns index/value pairs ---")
    names = ["Ada", "Grace", "Linus"]
    print(f"  list(enumerate(names)) = {list(enumerate(names))}")

    print()
    print("--- [2] Unpacking pairs in a loop ---")
    for index, name in enumerate(names):
        print(f"  zero-based: {index} -> {name}")
    for number, name in enumerate(names, start=1):
        print(f"  human numbering #{number}: {name}")

    print()
    print("--- [3] enumerate() works on any iterable ---")
    for index, character in enumerate("abc"):
        print(f"  char {index} = {character!r}")
    for index, key in enumerate({"a": 1, "b": 2}, start=10):
        print(f"  dict key {index} = {key!r}")

    print()
    print("--- [4] enumerate() vs range(len(...)) ---")
    items = ["x", "y", "z"]
    for index in range(len(items)):
        items[index] = items[index].upper()
    print(f"  mutated in place: {items}")
    for index, value in enumerate(items):
        print(f"  {index}: {value}")

    print()
    print("--- [5] Using the index to label results ---")
    scores = [88, 92, 75]
    best_index, best_score = 0, scores[0]
    for index, score in enumerate(scores):
        if score > best_score:
            best_index, best_score = index, score
    print(f"  best student #{best_index + 1}: {best_score}")
    assert best_index == 1 and best_score == 92
    print()
    print("=" * 64)
    print(f"  Lesson 14 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
