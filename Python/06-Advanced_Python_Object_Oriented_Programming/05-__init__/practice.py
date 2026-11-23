#!/usr/bin/env python3
"""Practice for Lesson 05: __init__ — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 05: __init__")
    print("=" * 64)

    print("\n--- [1] Automatic initialization with parameters ---")
    class Point:
        def __init__(self, x=0, y=0):
            if not isinstance(x, (int, float)) or not isinstance(y, (int, float)):
                raise ValueError("coordinates must be numeric")
            self.x = x
            self.y = y

    p = Point(3, 4)
    origin = Point()
    print("p.__dict__:", p.__dict__)
    print("origin.__dict__:", origin.__dict__)

    print("\n--- [2] Validation rejects bad state early ---")
    try:
        Point("three", 4)
    except ValueError as exc:
        print("ValueError:", exc)

    print("\n--- [3] __new__ allocates, __init__ initializes ---")
    class Traced:
        def __new__(cls):
            print("__new__ called")
            return super().__new__(cls)

        def __init__(self):
            print("__init__ called")
            self.ready = True

    traced = Traced()
    print("ready:", traced.ready)

    print("\n--- [4] Returning a value from __init__ is illegal ---")
    class Bad:
        def __init__(self):
            return 5

    try:
        Bad()
    except TypeError as exc:
        print("TypeError:", exc)

    print("\nLesson 05 practice completed successfully!")


if __name__ == "__main__":
    main()
