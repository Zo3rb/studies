#!/usr/bin/env python3
"""Practice: String Indexes

Module 03 - Python Basics, Lesson 16.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 16: String Indexes")
    print("=" * 64)

    text = "Python Basics"

    print("\n--- [1] Indexing ---")
    print("text:", text, "len:", len(text))
    for index in (0, 2, -1):
        print(f"text[{index}] = {text[index]!r}")
    try:
        print(text[100])
    except IndexError as error:
        print("expected IndexError:", error)

    print("\n--- [2] Slicing ---")
    for label, value in (
        ("text[0:6]", text[0:6]),
        ("text[7:]", text[7:]),
        ("text[:6]", text[:6]),
        ("text[::2]", text[::2]),
        ("text[100:200]", text[100:200]),
    ):
        print(f"{label:>16} -> {value!r}")

    print("\n--- [3] Reverse and enumerate ---")
    print("text[::-1]:", text[::-1])
    print("index enumeration:", list(enumerate("Py")))
    print("text.index('th'):", text.index("th"))
    print("=" * 64)
    print("Lesson 16 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
