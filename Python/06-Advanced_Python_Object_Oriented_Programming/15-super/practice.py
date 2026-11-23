#!/usr/bin/env python3
"""Practice for Lesson 15: super() — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 15: super()")
    print("=" * 64)

    print("\n--- [1] Reusing parent behavior ---")
    class Animal:
        def __init__(self, name):
            self.name = name

        def speak(self):
            return f"{self.name} makes a sound"

    class Dog(Animal):
        def speak(self):
            return super().speak() + " (Woof!)"

    dog = Dog("Rex")
    print("Dog.speak():", dog.speak())

    print("\n--- [2] Cooperative initialization ---")
    class Pet:
        def __init__(self, name, tag):
            super().__init__(name)
            self.tag = tag

    class RegisteredDog(Pet, Dog):
        def __init__(self, name, tag, breed):
            super().__init__(name, tag)
            self.breed = breed

    registered = RegisteredDog("Rex", "A123", "Labrador")
    print("state:", registered.__dict__)

    print("\n--- [3] super() follows the MRO ---")
    print("RegisteredDog MRO:", [c.__name__ for c in RegisteredDog.__mro__])
    print("Dog MRO:", [c.__name__ for c in Dog.__mro__])

    print("\n--- [4] Explicit two-argument form ---")
    print("parent via super(Dog, dog):", super(Dog, dog).speak())

    print("\nLesson 15 practice completed successfully!")


if __name__ == "__main__":
    main()
