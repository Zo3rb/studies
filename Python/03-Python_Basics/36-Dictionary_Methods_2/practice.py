#!/usr/bin/env python3
"""Practice: Dictionary Methods 2

Module 03 - Python Basics, Lesson 36.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 36: Dictionary Methods 2")
    print("=" * 64)

    print("\n--- [1] Membership and views ---")
    user = {"name": "Andrei", "age": 36}
    print("'name' in user:", "name" in user)
    print("'Andrei' in user:", "Andrei" in user)
    print("keys:", list(user.keys()))
    print("values:", list(user.values()))
    print("items:", list(user.items()))

    print("\n--- [2] Removing items ---")
    data = {"a": 1, "b": 2, "c": 3}
    print("pop('a'):", data.pop("a"))
    print("pop missing:", data.pop("z", "default"))
    print("popitem:", data.popitem())
    del data["b"]
    print("after del:", data)
    data.clear()
    print("cleared:", data)

    print("\n--- [3] Copy and update ---")
    original = {"a": 1, "nested": [2]}
    copy = original.copy()
    copy["a"] = 99
    copy["nested"].append(3)
    print("original:", original)
    print("copy:", copy)
    target = {"a": 1}
    target.update({"b": 2}, a=10)
    print("updated:", target)
    print("=" * 64)
    print("Lesson 36 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
