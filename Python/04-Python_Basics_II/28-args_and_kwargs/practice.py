#!/usr/bin/env python3
"""Practice: *args and **kwargs — Module 04, Python Basics II.

Demonstrates packing into tuples/dicts, unpacking with stars, and correct parameter order.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 28: *args and **kwargs")
    print("=" * 64)
    print("--- [1] *args packs positional arguments into a tuple ---")
    def total(*numbers):
        print(f"  type={type(numbers).__name__}, contents={numbers}")
        return sum(numbers)

    print(f"  total(1, 2, 3) = {total(1, 2, 3)}")
    print(f"  total() = {total()}")
    assert total(1, 2, 3) == 6

    print()
    print("--- [2] **kwargs packs keyword arguments into a dict ---")
    def build(label, *items, **options):
        return {"label": label, "items": items, "options": options}

    result = build("groceries", "milk", "eggs", urgent=True, store="market")
    print(f"  {result}")
    assert result["items"] == ("milk", "eggs")
    assert result["options"] == {"urgent": True, "store": "market"}

    print()
    print("--- [3] Full parameter order ---")
    def describe(a, b, *extra, label="default", **options):
        return a, b, extra, label, options

    values = [1, 2, 3, 4]
    settings = {"label": "custom", "verbose": True}
    unpacked = describe(*values, **settings)
    print(f"  describe(*values, **settings) -> {unpacked}")
    assert unpacked == (1, 2, (3, 4), "custom", {"verbose": True})

    print()
    print("--- [4] Unpacking in ordinary calls ---")
    def add(a, b):
        return a + b

    print(f"  add(*[3, 4]) = {add(*[3, 4])}")
    kwargs = {"a": 5, "b": 6}
    print(f"  add(**{kwargs}) = {add(**kwargs)}")
    try:
        add(**{"a": 1, "c": 2})
    except TypeError as exc:
        print(f"  mismatched keys: {type(exc).__name__}: {exc}")

    print()
    print("--- [5] A wrapper that forwards everything ---")
    def logged_call(function, *args, **kwargs):
        print(f"  calling {function.__name__} with {args} and {kwargs}")
        return function(*args, **kwargs)

    print(f"  result: {logged_call(add, 7, 8)}")
    print()
    print("=" * 64)
    print(f"  Lesson 28 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
