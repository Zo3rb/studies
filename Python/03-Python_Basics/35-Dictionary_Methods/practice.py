#!/usr/bin/env python3
"""Practice: Dictionary Methods

Module 03 - Python Basics, Lesson 35.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 35: Dictionary Methods")
    print("=" * 64)

    print("\n--- [1] Safe access with get() ---")
    user = {"name": "Andrei"}
    print("get('name'):", user.get("name"))
    print("get('age'):", user.get("age"))
    print("get('age', 0):", user.get("age", 0))

    print("\n--- [2] Construction styles ---")
    print("keywords:", dict(a=1, b=2))
    print("pairs:", dict([("a", 1), ("b", 2)]))
    print("fromkeys:", dict.fromkeys(["a", "b"], 0))

    print("\n--- [3] setdefault() ---")
    counts = {}
    for word in ["a", "b", "a"]:
        counts.setdefault(word, 0)
        counts[word] += 1
    print("counts:", counts)
    profile = {"age": 36}
    print("existing default returned:", profile.setdefault("age", 0))
    print("profile:", profile)
    print("=" * 64)
    print("Lesson 35 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
