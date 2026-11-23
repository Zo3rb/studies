#!/usr/bin/env python3
"""Practice: Sets

Module 03 - Python Basics, Lesson 39.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 39: Sets")
    print("=" * 64)

    print("\n--- [1] Deduplication ---")
    numbers = [1, 2, 2, 3, 3, 3]
    unique = set(numbers)
    print("unique:", sorted(unique), "count:", len(unique))
    print("empty set:", set())

    print("\n--- [2] Membership and mutation ---")
    tags = {"python", "basics"}
    tags.add("learning")
    tags.discard("missing")
    print("sorted tags:", sorted(tags))
    print("'python' in tags:", "python" in tags)
    try:
        tags.remove("missing")
    except KeyError as error:
        print("expected KeyError:", error)

    print("\n--- [3] Copy and clear ---")
    original = {1, 2}
    copy = original.copy()
    copy.add(3)
    print("original:", sorted(original))
    print("copy:", sorted(copy))
    copy.clear()
    print("cleared:", copy)
    print("=" * 64)
    print("Lesson 39 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
