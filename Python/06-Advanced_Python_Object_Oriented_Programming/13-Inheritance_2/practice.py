#!/usr/bin/env python3
"""Practice for Lesson 13: Inheritance 2 — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 13: Inheritance 2")
    print("=" * 64)

    print("\n--- [1] Lookup walks up the hierarchy ---")
    class Animal:
        def __init__(self, name):
            self.name = name

        def speak(self):
            return f"{self.name} makes a sound"

        def sleep(self):
            return f"{self.name} is sleeping"

    class Dog(Animal):
        def speak(self):
            return f"{self.name} says Woof!"

    dog = Dog("Rex")
    print("dog.speak():", dog.speak())
    print("dog.sleep():", dog.sleep())

    print("\n--- [2] Extending instead of duplicating ---")
    class LoudDog(Dog):
        def speak(self):
            return super().speak().upper() + "!"

    loud = LoudDog("Rex")
    print("loud.speak():", loud.speak())

    print("\n--- [3] Calling the parent initializer ---")
    class RegisteredDog(Dog):
        def __init__(self, name, breed):
            super().__init__(name)
            self.breed = breed

        def describe(self):
            return f"{self.breed} named {self.name}"

    registered = RegisteredDog("Rex", "Labrador")
    print("describe():", registered.describe())
    print("inherited sleep():", registered.sleep())

    print("\n--- [4] What happens if you forget super().__init__? ---")
    class BrokenDog(Dog):
        def __init__(self, name):
            self.name = name  # parent call omitted

    broken = BrokenDog("Ghost")
    print("name exists:", hasattr(broken, "name"))
    class StrictAnimal(Animal):
        def __init__(self, name, tag):
            self.tag = tag

    print("tag-only object has name:", hasattr(StrictAnimal("x", "t"), "name"))

    print("\nLesson 13 practice completed successfully!")


if __name__ == "__main__":
    main()
