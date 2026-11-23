#!/usr/bin/env python3
"""Practice: While Loops 2 — Module 04, Python Basics II.

Uses flags, nested while loops, and a deterministic read-validate-repeat simulation.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 16: While Loops 2")
    print("=" * 64)
    print("--- [1] A flag controls the loop ---")
    running = True
    attempts = 0
    while running:
        attempts += 1
        print(f"  pass {attempts}")
        if attempts == 4:
            running = False
    print(f"  stopped after {attempts} passes")

    print()
    print("--- [2] Nested while loops: a 3x3 grid ---")
    row = 1
    while row <= 3:
        column = 1
        output = []
        while column <= 3:
            output.append(f"{row * column:>2}")
            column += 1
        print("  " + " ".join(output))
        row += 1

    print()
    print("--- [3] Simulated input validation (no stdin needed) ---")
    answers = iter(["maybe", "-3", "7"])
    answer = next(answers)
    while not answer.isdigit():
        print(f"  rejecting {answer!r}: not a number")
        answer = next(answers)
    print(f"  accepted: {answer}")
    assert answer == "7"

    print()
    print("--- [4] Counting occurrences of a target while scanning ---")
    data = ["a", "b", "a", "c", "a"]
    index = 0
    count = 0
    while index < len(data):
        if data[index] == "a":
            count += 1
        index += 1
    print(f"  {data.count('a')} 'a' values; counted with while: {count}")
    assert count == 3

    print()
    print("--- [5] while True with a break condition ---")
    total = 0
    while True:
        total += 1
        if total % 5 == 0:
            break
    print(f"  first multiple of 5 reached: {total}")
    print()
    print("=" * 64)
    print(f"  Lesson 16 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
