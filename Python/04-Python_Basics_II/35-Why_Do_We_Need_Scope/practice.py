#!/usr/bin/env python3
"""Practice: Why Do We Need Scope? — Module 04, Python Basics II.

Shows how local scopes and module namespaces prevent collisions and control shared state.
"""

hidden_total = 0


def first():
    result = "first's result"
    return result


def second():
    result = "second's result"
    return result


def add_hidden(value):
    global hidden_total
    hidden_total += value
    return hidden_total


def add_explicit(current, value):
    return current + value


def make_id_generator(start=1):
    next_id = start

    def next_value():
        nonlocal next_id
        value = next_id
        next_id += 1
        return value

    return next_value



def main():
    print("=" * 64)
    print(f"  Lesson 35: Why Do We Need Scope?")
    print("=" * 64)
    print("--- [1] Identical local names do not collide ---")
    print(f"  {first()} | {second()}")
    assert first() != second()

    print()
    print("--- [2] Explicit inputs instead of hidden globals ---")
    print(f"  hidden state after add_hidden(5): {add_hidden(5)}")
    visible = add_explicit(10, 5)
    print(f"  explicit result: {visible}")
    assert visible == 15

    print()
    print("--- [3] A closure encapsulates one piece of state ---")
    generate = make_id_generator(100)
    print(f"  ids: {generate()}, {generate()}, {generate()}")
    assert generate() == 103

    print()
    print("--- [4] Module namespaces keep names separate ---")
    import math
    import json

    print(f"  math.sqrt(16) = {math.sqrt(16)}")
    payload = {"ok": True}
    print(f"  json.dumps({payload}) = {json.dumps(payload)}")
    print(f"  math has sqrt: {hasattr(math, 'sqrt')}, json has sqrt: {hasattr(json, 'sqrt')}")

    print()
    print("--- [5] Module globals are private to that module ---")
    import os
    module_globals = list(globals())[:3]
    print(f"  a few names in this module's globals: {module_globals}")
    print(f"  os has its own 'path': {hasattr(os, 'path')}")
    print()
    print("=" * 64)
    print(f"  Lesson 35 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
