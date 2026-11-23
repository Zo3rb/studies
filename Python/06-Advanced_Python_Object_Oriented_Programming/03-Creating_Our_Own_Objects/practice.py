#!/usr/bin/env python3
"""Practice for Lesson 03: Creating Our Own Objects — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 03: Creating Our Own Objects")
    print("=" * 64)

    print("\n--- [1] Declaring a class and instantiating it ---")
    class Empty:
        pass

    obj = Empty()
    print("type(obj).__name__:", type(obj).__name__)

    print("\n--- [2] Each instance gets its own namespace ---")
    a = Empty()
    b = Empty()
    a.x = 10
    a.label = "alpha"
    print("a.__dict__:", a.__dict__)
    print("b.__dict__:", b.__dict__)
    print("a is b:", a is b)

    print("\n--- [3] Reading attributes back ---")
    print("a.x:", a.x)
    print("missing attribute on b:", hasattr(b, "x"))
    print("getattr with default:", getattr(b, "x", "not set"))

    print("\n--- [4] Class membership checks ---")
    print("type(a) is Empty:", type(a) is Empty)
    print("isinstance(a, Empty):", isinstance(a, Empty))
    print("isinstance(a, object):", isinstance(a, object))

    print("\nLesson 03 practice completed successfully!")


if __name__ == "__main__":
    main()
