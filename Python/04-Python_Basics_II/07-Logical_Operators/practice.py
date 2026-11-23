#!/usr/bin/env python3
"""Practice: Logical Operators — Module 04, Python Basics II.

Builds truth tables, tests operator precedence, and applies De Morgan's laws.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 07: Logical Operators")
    print("=" * 64)
    print("--- [1] Truth table for and / or ---")
    for a in (False, True):
        for b in (False, True):
            print(f"  a={str(a):<5} b={str(b):<5} | and={str(a and b):<5} or={str(a or b):<5} not a={not a}")

    print()
    print("--- [2] Precedence: not > and > or ---")
    age = 20
    has_id = True
    expression = age >= 18 and has_id or age > 21
    grouped = (age >= 18 and has_id) or (age > 21)
    print(f"  ungrouped={expression}, grouped={grouped}")
    print(f"  not age < 18 -> {not age < 18} (same as not (age < 18))")

    print()
    print("--- [3] De Morgan's laws ---")
    for is_weekend in (False, True):
        for is_holiday in (False, True):
            lhs = not (is_weekend or is_holiday)
            rhs = (not is_weekend) and (not is_holiday)
            assert lhs == rhs
            print(f"  weekend={is_weekend}, holiday={is_holiday} -> workday={lhs}")

    print()
    print("--- [4] A combined real-world gate ---")
    for age, has_ticket, is_vip in [(17, True, True), (18, False, False), (25, False, True)]:
        can_enter = age >= 18 and (has_ticket or is_vip)
        print(f"  age={age}, ticket={has_ticket}, vip={is_vip} -> enter={can_enter}")
    print()
    print("=" * 64)
    print(f"  Lesson 07 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
