#!/usr/bin/env python3
"""Practice for Lesson 20: MRO - Method Resolution Order — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 20: MRO - Method Resolution Order")
    print("=" * 64)

    print("\n--- [1] Reading the MRO ---")
    class A:
        def who(self):
            return "A"

    class B(A):
        pass

    class C(A):
        def who(self):
            return "C"

    class D(B, C):
        def who(self):
            return "D -> " + super().who()

    print("D.__mro__:", [c.__name__ for c in D.__mro__])
    print("D.mro():", [c.__name__ for c in D.mro()])
    print("D().who():", D().who())

    print("\n--- [2] Lookup skips classes without the method ---")
    print("B has own who:", "who" in B.__dict__)
    print("B().who():", B().who())
    print("D lookup order finds C before A:",
          [c.__name__ for c in D.__mro__].index("C") < [c.__name__ for c in D.__mro__].index("A"))

    print("\n--- [3] super() delegates to the next MRO entry ---")
    class E(B, C):
        def who(self):
            return "E -> " + super().who()

    print("E MRO:", [c.__name__ for c in E.__mro__])
    print("E().who():", E().who())

    print("\n--- [4] Inconsistent hierarchies are rejected ---")
    class X(A):
        pass
    class Y(A):
        pass
    class Pair1(X, Y):
        pass
    class Pair2(Y, X):
        pass

    try:
        class Impossible(Pair1, Pair2):
            pass
    except TypeError as exc:
        print("TypeError:", exc)

    print("\nLesson 20 practice completed successfully!")


if __name__ == "__main__":
    main()
