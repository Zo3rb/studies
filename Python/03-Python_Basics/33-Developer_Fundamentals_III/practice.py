#!/usr/bin/env python3
"""Practice: Developer Fundamentals III

Module 03 - Python Basics, Lesson 33.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 33: Developer Fundamentals III")
    print("=" * 64)

    print("\n--- [1] List: ordered sequence ---")
    queue = ["first", "second", "third"]
    print("first:", queue[0])
    print("index of second:", queue.index("second"))

    print("\n--- [2] Dict: keyed lookup ---")
    scores = {"Andrei": 95, "Bob": 82}
    print("Andrei:", scores["Andrei"])
    scores["Bob"] = 88
    print("updated:", scores)

    print("\n--- [3] Tradeoffs ---")
    as_list = [("Andrei", 95), ("Bob", 82)]
    as_dict = {"Andrei": 95, "Bob": 82}
    print("list positional:", as_list[0])
    print("dict keyed:", as_dict["Andrei"])
    print("=" * 64)
    print("Lesson 33 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
