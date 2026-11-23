#!/usr/bin/env python3
"""Practice: While Loops — Module 04, Python Basics II.

Runs countdowns and accumulators, and shows a bounded while-True retry simulation.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 15: While Loops")
    print("=" * 64)
    print("--- [1] A simple countdown ---")
    countdown = 3
    while countdown > 0:
        print(f"  countdown: {countdown}")
        countdown -= 1
    print("  Liftoff!")

    print()
    print("--- [2] Accumulating until a threshold ---")
    total = 0
    number = 1
    while total < 20:
        total += number
        number += 1
    print(f"  total={total}, last number added={number - 1}")
    assert total >= 20

    print()
    print("--- [3] Consuming a collection with while ---")
    queue = ["first", "second", "third"]
    while queue:
        item = queue.pop(0)
        print(f"  processed: {item} (remaining: {len(queue)})")
    assert queue == []

    print()
    print("--- [4] Bounded while True with break ---")
    attempts = 0
    while True:
        attempts += 1
        if attempts >= 3:
            break
    print(f"  succeeded after {attempts} attempts")
    assert attempts == 3

    print()
    print("--- [5] while/else: else runs only without break ---")
    for limit in (3, 10):
        value = 0
        while value < limit:
            if value == 3:
                break
            value += 1
        else:
            print(f"  limit={limit}: loop completed without break")
        if value == 3:
            print(f"  limit={limit}: stopped early with break")
    print()
    print("=" * 64)
    print(f"  Lesson 15 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
