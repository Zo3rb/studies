#!/usr/bin/env python3
"""Practice: Developer Fundamentals IV — Module 04, Python Basics II.

Practises decomposition, traceback reading, incremental changes, and assertion-based verification.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 19: Developer Fundamentals IV")
    print("=" * 64)
    print("--- [1] Decompose a problem into named steps ---")
    def valid_scores(scores):
        return [value for value in scores if isinstance(value, (int, float))]

    def passing_scores(scores):
        return [value for value in scores if value >= 60]

    def report(scores):
        clean = valid_scores(scores)
        passes = passing_scores(clean)
        return {"valid": clean, "passing": passes, "count": len(passes)}

    data = [90, "not a number", 45, 72, None]
    result = report(data)
    print(f"  input: {data}")
    print(f"  report: {result}")
    assert result["count"] == 2

    print()
    print("--- [2] Reading a traceback (simulated text) ---")
    message = (
        "Traceback (most recent call last):\n"
        '  File "app.py", line 5, in <module>\n'
        "    print(1 / 0)\n"
        "ZeroDivisionError: division by zero"
    )
    print(message)
    print("  -> last line names the exception; last frame names the failing line")

    print()
    print("--- [3] Assertions verify assumptions ---")
    def average(values):
        assert values, "values must not be empty"
        return sum(values) / len(values)

    for sample in ([2, 4, 6], [10, 20]):
        value = average(sample)
        print(f"  average({sample}) = {value}")
    assert average([2, 4, 6]) == 4.0

    print()
    print("--- [4] One change at a time: find the bug ---")
    def double_sum(values):
        # The intended result is twice the total of the values.
        return 2 * sum(values)

    for sample in ([1, 2], [3, 4, 5]):
        got = double_sum(sample)
        expected = 2 * sum(sample)
        print(f"  {sample} -> {got} (expected {expected})")
        assert got == expected

    print()
    print("All developer-fundamentals checks passed.")
    print()
    print("=" * 64)
    print(f"  Lesson 19 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
