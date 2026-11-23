#!/usr/bin/env python3
"""Practice: break, continue, pass — Module 04, Python Basics II.

Compares break, continue, pass, and loop-else with short, verifiable searches.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 17: break, continue, pass")
    print("=" * 64)
    print("--- [1] break: stop at the first match ---")
    for number in range(1, 20):
        if number % 7 == 0:
            print(f"  first multiple of 7: {number}")
            break

    print()
    print("--- [2] continue: skip even numbers ---")
    odds = []
    for number in range(1, 10):
        if number % 2 == 0:
            continue
        odds.append(number)
    print(f"  odds: {odds}")
    assert odds == [1, 3, 5, 7, 9]

    print()
    print("--- [3] pass: a legal empty block ---")
    class Todo:
        pass

    def pending():
        pass

    print(f"  created {Todo.__name__} and called pending() -> {pending()}")
    for number in (1, 2, 3):
        if number == 2:
            pass
        print(f"  visited {number}")

    print()
    print("--- [4] while with continue and a safe counter update ---")
    value = 0
    kept = []
    while value < 6:
        value += 1                 # update BEFORE continue
        if value % 2 == 0:
            continue
        kept.append(value)
    print(f"  kept odd values: {kept}")
    assert kept == [1, 3, 5]

    print()
    print("--- [5] loop else: runs only when there was no break ---")
    for target in (4, 7):
        for candidate in (2, 4, 6):
            if candidate == target:
                print(f"  target {target}: found {candidate}")
                break
        else:
            print(f"  target {target}: not found (else clause ran)")
    print()
    print("=" * 64)
    print(f"  Lesson 17 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
