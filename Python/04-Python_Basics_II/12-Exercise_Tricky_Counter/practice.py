#!/usr/bin/env python3
"""Practice: Exercise - Tricky Counter — Module 04, Python Basics II.

Traces counters through loops, fixes exclusive-stop errors, and counts conditional events.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 12: Exercise - Tricky Counter")
    print("=" * 64)
    print("--- [1] Count from zero ---")
    count = 0
    for item in ["a", "b", "c", "d"]:
        count += 1
    print(f"  items counted: {count}")
    assert count == 4

    print()
    print("--- [2] The exclusive stop trap ---")
    zero_based = list(range(5))
    one_based = list(range(1, 6))
    print(f"  range(5)     -> {zero_based} ({len(zero_based)} values)")
    print(f"  range(1, 6)  -> {one_based} ({len(one_based)} values)")
    assert zero_based[-1] == 4 and one_based[-1] == 5

    print()
    print("--- [3] Conditional counter ---")
    scores = [70, 45, 88, 92, 60]
    passing = 0
    for score in scores:
        if score >= 60:
            passing += 1
    print(f"  scores={scores}")
    print(f"  passing={passing}, failing={len(scores) - passing}")
    assert passing == 4

    print()
    print("--- [4] Counter that resets: longest streak ---")
    words = ["cat", "", "dog", "bird", "", "owl", "fox"]
    streak = 0
    longest = 0
    non_empty = 0
    for word in words:
        if word:
            non_empty += 1
            streak += 1
            longest = max(longest, streak)
        else:
            streak = 0
    print(f"  non_empty={non_empty}, longest_streak={longest}")
    assert non_empty == 5 and longest == 2

    print()
    print("--- [5] A while-loop counter that stops at the right place ---")
    counter = 1
    total = 0
    while counter <= 5:
        total += counter
        counter += 1
    print(f"  counter after loop={counter}, total 1..5={total}")
    assert counter == 6 and total == 15
    print()
    print("=" * 64)
    print(f"  Lesson 12 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
