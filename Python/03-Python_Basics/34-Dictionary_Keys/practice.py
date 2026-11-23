#!/usr/bin/env python3
"""Practice: Dictionary Keys

Module 03 - Python Basics, Lesson 34.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 34: Dictionary Keys")
    print("=" * 64)

    print("\n--- [1] Hashable keys ---")
    valid = {"name": "Andrei", 1: "one", (10, 20): "point"}
    print("valid:", valid)
    try:
        bad = {["list"]: "bad"}
    except TypeError as error:
        print("expected TypeError:", error)

    print("\n--- [2] Unique keys ---")
    data = {"a": 1, "a": 2}
    print("duplicate literal:", data)
    data["a"] = 3
    print("after update:", data, "pairs:", len(data))

    print("\n--- [3] Equality surprises ---")
    collision = {True: "yes", 1: "one", False: "no", 0: "zero"}
    print("bool/int collision:", collision)
    mixed = {"Name": "A", "name": "B"}
    print("case-sensitive:", mixed)
    print("missing case:", mixed.get("NAME", "missing"))
    print("=" * 64)
    print("Lesson 34 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
