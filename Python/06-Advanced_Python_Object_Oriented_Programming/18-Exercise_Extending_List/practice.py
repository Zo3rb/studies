#!/usr/bin/env python3
"""Practice for Lesson 18: Exercise - Extending List — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 18: Exercise - Extending List")
    print("=" * 64)

    print("\n--- [1] Subclassing list and overriding append ---")
    class UpperList(list):
        def append(self, item):
            super().append(item.upper())

        def extend(self, items):
            for item in items:
                self.append(item)

    words = UpperList()
    words.append("hello")
    words.extend(["world", "again"])
    print("words:", words)
    print("isinstance(words, list):", isinstance(words, list))
    print("inherited count:", words.count("HELLO"))

    print("\n--- [2] Validating input ---")
    class PositiveNumbers(list):
        def append(self, value):
            if value <= 0:
                raise ValueError("value must be positive")
            super().append(value)

    nums = PositiveNumbers([1, 2])
    nums.append(3)
    print("nums:", nums)
    try:
        nums.append(-1)
    except ValueError as exc:
        print("ValueError:", exc)

    print("\n--- [3] Built-in methods bypass Python overrides ---")
    list.append(nums, -9)
    print("after list.append(nums, -9):", nums)
    print("note: C-level list methods never call our override")

    print("\n--- [4] Adding a helpful representation ---")
    class TaggedList(list):
        def __repr__(self):
            return f"TaggedList({list(self)!r})"

    print("repr:", repr(TaggedList([1, 2])))

    print("\nLesson 18 practice completed successfully!")


if __name__ == "__main__":
    main()
