#!/usr/bin/env python3
"""Practice: Exercise - Functions — Module 04, Python Basics II.

Builds and asserts a small set of reusable helpers with defaults, guards, and docstrings.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 29: Exercise - Functions")
    print("=" * 64)
    print("--- [1] normalise(): defaults and keyword-only options ---")
    def normalise(name, *, strip=True):
        """Return a title-cased name, optionally stripping whitespace."""
        cleaned = name.strip() if strip else name
        return cleaned.title()

    for raw in ("  ada lovelace  ", "GRACE hopper"):
        print(f"  {raw!r} -> {normalise(raw)!r}")
    assert normalise("  ada lovelace  ") == "Ada Lovelace"

    print()
    print("--- [2] safe_divide(): guard clause + return ---")
    def safe_divide(a, b):
        """Return a / b, or None when b is zero."""
        if b == 0:
            return None
        return a / b

    for divisor in (0, 2, -4):
        print(f"  9 / {divisor} -> {safe_divide(9, divisor)}")
    assert safe_divide(9, 0) is None and safe_divide(9, 2) == 4.5

    print()
    print("--- [3] Composable helpers ---")
    def valid(values):
        """Keep only numeric values."""
        return [value for value in values if isinstance(value, (int, float))]

    def doubled(values):
        """Return each value multiplied by two."""
        return [value * 2 for value in values]

    def summary(values):
        """Return (total, count) for doubled numeric values."""
        processed = doubled(valid(values))
        return sum(processed), len(processed)

    data = [1, "x", 3, None, 5]
    print(f"  data={data}")
    print(f"  valid={valid(data)}, doubled={doubled(valid(data))}, summary={summary(data)}")
    assert summary(data) == (18, 3)

    print()
    print("--- [4] Flexible configuration with *args and **kwargs ---")
    def make_record(name, *tags, active=True, **extra):
        """Build a record dictionary from positional tags and keyword extras."""
        return {"name": name, "tags": tags, "active": active, "extra": extra}

    record = make_record("Ada", "python", "math", active=False, level="senior")
    print(f"  {record}")
    assert record["tags"] == ("python", "math") and record["extra"] == {"level": "senior"}

    print()
    print("--- [5] All functions carry usable docstrings ---")
    for function in (normalise, safe_divide, valid, doubled, summary, make_record):
        assert function.__doc__, f"{function.__name__} needs a docstring"
        print(f"  {function.__name__}: {function.__doc__.splitlines()[0]}")
    print()
    print("=" * 64)
    print(f"  Lesson 29 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
