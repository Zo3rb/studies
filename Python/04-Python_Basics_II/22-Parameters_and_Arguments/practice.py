#!/usr/bin/env python3
"""Practice: Parameters and Arguments — Module 04, Python Basics II.

Compares positional and keyword calls and captures the TypeError messages for bad arity.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 22: Parameters and Arguments")
    print("=" * 64)
    print("--- [1] Parameters vs arguments ---")
    def add(a, b):
        return a + b

    print(f"  add(2, 3) = {add(2, 3)}")
    print(f"  add(a=10, b=20) = {add(a=10, b=20)}")

    print()
    print("--- [2] Positional, keyword, and mixed calls ---")
    def describe(name, age, city):
        return f"{name}, {age}, from {city}"

    print("  positional:", describe("Ada", 36, "London"))
    print("  keywords:  ", describe(city="Paris", name="Grace", age=45))
    print("  mixed:     ", describe("Linus", age=55, city="Helsinki"))

    print()
    print("--- [3] Arity errors are TypeErrors ---")
    def connect(host, port):
        return f"{host}:{port}"

    print(f"  valid: {connect('localhost', 5432)}")
    try:
        connect("localhost")
    except TypeError as exc:
        print(f"  too few: {type(exc).__name__}: {exc}")
    try:
        connect("localhost", 5432, retry=True)
    except TypeError as exc:
        print(f"  too many: {type(exc).__name__}: {exc}")
    try:
        connect("localhost", port=5432, protocol="tcp")
    except TypeError as exc:
        print(f"  unknown keyword: {type(exc).__name__}: {exc}")

    print()
    print("--- [4] Parameter reassignment is local ---")
    def change(value):
        value = 99
        return value

    number = 7
    print(f"  before={number}, returned={change(number)}, after={number}")

    print()
    print("--- [5] Mutable arguments refer to the same object ---")
    def append_item(items, value):
        items.append(value)

    data = [1]
    append_item(data, 2)
    print(f"  data after the call: {data}")
    assert data == [1, 2]
    print()
    print("=" * 64)
    print(f"  Lesson 22 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
