#!/usr/bin/env python3
"""Practice for Lesson 19: Multiple Inheritance — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 19: Multiple Inheritance")
    print("=" * 64)

    print("\n--- [1] Combining two base classes ---")
    class Flyer:
        def move(self):
            return "flying"

    class Swimmer:
        def swim(self):
            return "swimming"

    class Duck(Flyer, Swimmer):
        pass

    duck = Duck()
    print("move:", duck.move())
    print("swim:", duck.swim())
    print("bases:", [c.__name__ for c in Duck.__bases__])

    print("\n--- [2] A mixin adds one focused behavior ---")
    import json

    class JsonMixin:
        def to_json(self):
            return json.dumps(self.__dict__, sort_keys=True)

    class Person:
        def __init__(self, name):
            self.name = name

    class Employee(JsonMixin, Person):
        def __init__(self, name, role):
            super().__init__(name)
            self.role = role

    emp = Employee("Ada", "engineer")
    print("to_json:", emp.to_json())

    print("\n--- [3] Diamond with cooperative super() ---")
    class A:
        def who(self):
            return "A"

    class B(A):
        def who(self):
            return "B -> " + super().who()

    class C(A):
        def who(self):
            return "C -> " + super().who()

    class D(B, C):
        pass

    print("D().who():", D().who())
    print("D MRO:", [c.__name__ for c in D.__mro__])

    print("\nLesson 19 practice completed successfully!")


if __name__ == "__main__":
    main()
