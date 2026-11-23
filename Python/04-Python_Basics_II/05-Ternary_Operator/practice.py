#!/usr/bin/env python3
"""Practice: Ternary Operator — Module 04, Python Basics II.

Compares ternary expressions with if/else and shows safe, readable uses in assignments and comprehensions.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 05: Ternary Operator")
    print("=" * 64)
    print("--- [1] Ternary expression vs if/else ---")
    for score in (95, 73, 40):
        result = "pass" if score >= 60 else "fail"
        if score >= 60:
            expected = "pass"
        else:
            expected = "fail"
        assert result == expected
        print(f"  score={score}: {result}")

    print()
    print("--- [2] Conditional values in calculations ---")
    for price in (80, 120, 250):
        final = price * 0.9 if price > 100 else price
        label = "discounted" if final < price else "full price"
        print(f"  {price} -> {final:.2f} ({label})")

    print()
    print("--- [3] Inside f-strings and comprehensions ---")
    names = ["Ada", "", "Grace"]
    cleaned = [name if name else "unknown" for name in names]
    print(f"  cleaned names: {cleaned}")
    print(f"  status: {'ready' if cleaned else 'empty'}")

    print()
    print("--- [4] Lazy branch evaluation ---")
    def risky():
        print("  risky() was called")
        return 1 / 0

    ok = True
    value = 42 if ok else risky()
    print(f"  value = {value} (risky branch skipped)")

    print()
    print("--- [5] Multi-way decisions are clearer with if/elif ---")
    def grade(score):
        if score >= 90:
            return "A"
        if score >= 80:
            return "B"
        if score >= 70:
            return "C"
        return "F"

    for sample in (91, 84, 75, 60):
        print(f"  {sample} -> {grade(sample)}")
    print()
    print("=" * 64)
    print(f"  Lesson 05 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
