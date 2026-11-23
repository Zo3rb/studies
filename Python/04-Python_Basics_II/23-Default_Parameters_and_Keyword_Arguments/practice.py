#!/usr/bin/env python3
"""Practice: Default Parameters and Keyword Arguments — Module 04, Python Basics II.

Exercises default values, keyword-only parameters, and the shared mutable-default bug.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 23: Default Parameters and Keyword Arguments")
    print("=" * 64)
    print("--- [1] Default parameters make arguments optional ---")
    def greet(name="world", punctuation="!"):
        return f"Hello, {name}{punctuation}"

    print(f"  {greet()}")
    print(f"  {greet('Ada')}")
    print(f"  {greet('Grace', punctuation='?')}")

    print()
    print("--- [2] Keyword-only parameters ---")
    def create_user(name, *, active=True, role="viewer"):
        return {"name": name, "active": active, "role": role}

    print(f"  default user: {create_user('Ada')}")
    print(f"  custom user:  {create_user('Grace', active=False, role='admin')}")
    try:
        create_user("Linus", False, "admin")
    except TypeError as exc:
        print(f"  positional after * rejected: {type(exc).__name__}")

    print()
    print("--- [3] The mutable default trap ---")
    def broken(item, items=[]):
        items.append(item)
        return items

    a = broken("a")
    b = broken("b")
    print(f"  broken(): {a} then {b} (the same list!)")
    assert a is b

    def fixed(item, items=None):
        items = [] if items is None else items
        items.append(item)
        return items

    c = fixed("a")
    d = fixed("b")
    print(f"  fixed():  {c} then {d} (independent lists)")
    assert c is not d

    print()
    print("--- [4] Defaults are evaluated once ---")
    called_with = []
    def log(message, cache=called_with):
        cache.append(message)
        return len(cache)

    print(f"  lengths across calls: {log('one')}, {log('two')}, {log('three')}")
    print(f"  shared default now holds: {called_with}")

    print()
    print("--- [5] Non-default parameters must come first ---")
    def scale(value, factor=2, offset=0):
        return value * factor + offset

    print(f"  scale(3)={scale(3)}, scale(3, 4)={scale(3, 4)}, scale(3, offset=1)={scale(3, offset=1)}")
    print()
    print("=" * 64)
    print(f"  Lesson 23 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
