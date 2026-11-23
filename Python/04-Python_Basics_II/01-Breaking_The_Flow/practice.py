#!/usr/bin/env python3
"""Practice: Breaking The Flow — Module 04, Python Basics II.

Demonstrates straight-line flow, single-branch decisions, graded elif chains, and nested conditionals.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 01: Breaking The Flow")
    print("=" * 64)
    print("--- [1] Straight-line flow vs a single branch ---")
    temperature = 28
    print("Before the if statement")
    if temperature > 25:
        print(f"  temperature={temperature}: hot branch taken")
    print("After the if statement")

    print()
    print("--- [2] elif chain: only the first true branch ---")
    score = 82
    if score >= 90:
        grade = "A"
    elif score >= 80:
        grade = "B"
    elif score >= 70:
        grade = "C"
    else:
        grade = "F"
    print(f"  score={score} -> grade {grade}")

    for sample in (95, 74, 40):
        if sample >= 90:
            label = "A"
        elif sample >= 80:
            label = "B"
        elif sample >= 70:
            label = "C"
        else:
            label = "F"
        print(f"  sample={sample} -> grade {label}")

    print()
    print("--- [3] Nested decisions (a prerequisite test) ---")
    logged_in = True
    user_age = 17
    if logged_in:
        if user_age >= 18:
            print("  Welcome, adult user")
        else:
            print("  Welcome, minor user")
    else:
        print("  Please log in first")

    print()
    print("--- [4] Independent ifs can both run ---")
    number = 6
    if number % 2 == 0:
        print("  even branch")
    if number > 3:
        print("  greater-than-three branch")
    print()
    print("=" * 64)
    print(f"  Lesson 01 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
