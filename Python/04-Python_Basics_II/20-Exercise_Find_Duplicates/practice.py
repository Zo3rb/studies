#!/usr/bin/env python3
"""Practice: Exercise - Find Duplicates — Module 04, Python Basics II.

Implements both set-based and Counter-based duplicate detection and verifies their results.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 20: Exercise - Find Duplicates")
    print("=" * 64)
    from collections import Counter

    print("--- [1] Set-based detection (each duplicate once) ---")
    items = ["a", "b", "a", "c", "b", "a", "d"]
    seen = set()
    reported = set()
    duplicates = []
    for item in items:
        if item in seen:
            if item not in reported:
                duplicates.append(item)
                reported.add(item)
        else:
            seen.add(item)
    print(f"  items: {items}")
    print(f"  duplicates in first-repeat order: {duplicates}")
    assert duplicates == ["a", "b"]

    print()
    print("--- [2] Dictionary counts ---")
    counts = {}
    for item in items:
        counts[item] = counts.get(item, 0) + 1
    print(f"  counts: {counts}")
    print(f"  duplicates: {[item for item, count in counts.items() if count > 1]}")
    assert counts["a"] == 3 and counts["d"] == 1

    print()
    print("--- [3] collections.Counter shortcut ---")
    counter = Counter(items)
    print(f"  Counter: {dict(counter)}")
    print(f"  most common two: {counter.most_common(2)}")
    assert counter.most_common(1) == [("a", 3)]

    print()
    print("--- [4] No duplicates case ---")
    unique = [1, 2, 3, 4]
    print(f"  unique input -> {[k for k, v in Counter(unique).items() if v > 1]} (empty list)")
    assert not [k for k, v in Counter(unique).items() if v > 1]

    print()
    print("--- [5] Case-insensitive duplicate detection ---")
    words = ["Ada", "ada", "Grace", "GRACE", "Linus"]
    normalised = [word.lower() for word in words]
    found = [word for word, count in Counter(normalised).items() if count > 1]
    print(f"  words: {words}")
    print(f"  case-insensitive duplicates: {found}")
    assert found == ["ada", "grace"]
    print()
    print("=" * 64)
    print(f"  Lesson 20 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
