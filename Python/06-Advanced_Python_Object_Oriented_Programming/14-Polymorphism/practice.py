#!/usr/bin/env python3
"""Practice for Lesson 14: Polymorphism — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 14: Polymorphism")
    print("=" * 64)

    print("\n--- [1] One call, many answers ---")
    class Dog:
        def speak(self):
            return "Woof!"

    class Cat:
        def speak(self):
            return "Meow!"

    class Robot:
        def speak(self):
            return "Beep boop!"

    for pet in (Dog(), Cat(), Robot()):
        print(type(pet).__name__, "->", pet.speak())

    print("\n--- [2] Duck typing: no common base class needed ---")
    def make_it_speak(obj):
        return obj.speak()

    class Duck:
        def speak(self):
            return "Quack!"

    print(make_it_speak(Duck()))
    print("all unrelated:", Dog.__bases__, Robot.__bases__)

    print("\n--- [3] Polymorphism through operators ---")
    class Vector:
        def __init__(self, x):
            self.x = x

        def __add__(self, other):
            return Vector(self.x + other.x)

        def __repr__(self):
            return f"Vector({self.x})"

    print("1 + 2:", 1 + 2)
    print('"a" + "b":', "a" + "b")
    print("Vector(1) + Vector(2):", Vector(1) + Vector(2))

    print("\nLesson 14 practice completed successfully!")


if __name__ == "__main__":
    main()
