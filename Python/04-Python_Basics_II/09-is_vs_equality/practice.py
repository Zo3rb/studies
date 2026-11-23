#!/usr/bin/env python3
"""Practice: is vs == — Module 04, Python Basics II.

Compares id() values, shows interning surprises, and applies the is None convention.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 09: is vs ==")
    print("=" * 64)
    print("--- [1] Equal values, different objects ---")
    a = [1, 2, 3]
    b = [1, 2, 3]
    print(f"  a={a}, b={b}")
    print(f"  a == b -> {a == b}")
    print(f"  a is b -> {a is b}")
    print(f"  id(a)={id(a)}, id(b)={id(b)}")
    b.append(4)
    print(f"  after b.append(4): a == b -> {a == b}")

    print()
    print("--- [2] Rebinding a name changes identity ---")
    c = [1]
    d = c
    print(f"  c is d -> {c is d}")
    d = d + [2]
    print(f"  after d = d + [2]: c is d -> {c is d}, c={c}, d={d}")

    print()
    print("--- [3] Singletons: None, True, False ---")
    none_a = None
    none_b = None
    print(f"  None is None -> {none_a is none_b}")
    print(f"  True is True -> {True is True}")

    value = 0
    print(f"  value={value}: is None -> {value is None}; == None -> {value == None}")

    print()
    print("--- [4] Interning is an implementation detail ---")
    small_a, small_b = 100, 100
    big_a, big_b = 1000, 1000
    print(f"  100 is 100 -> {small_a is small_b}")
    print(f"  1000 is 1000 -> {big_a is big_b} (do not rely on this!)")
    first = "hello"
    joined = "".join(["he", "llo"])
    print(f"  first == joined -> {first == joined}; first is joined -> {first is joined}")

    print()
    print("--- [5] Custom __eq__ affects == but never is ---")
    class Box:
        def __init__(self, value):
            self.value = value

        def __eq__(self, other):
            return isinstance(other, Box) and self.value == other.value

    box1, box2 = Box(5), Box(5)
    print(f"  box1 == box2 -> {box1 == box2}; box1 is box2 -> {box1 is box2}")
    assert box1 == box2 and box1 is not box2
    print()
    print("=" * 64)
    print(f"  Lesson 09 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
