#!/usr/bin/env python3
"""Practice for Lesson 12: Inheritance — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 12: Inheritance")
    print("=" * 64)

    print("\n--- [1] A parent class and two children ---")
    class Animal:
        def __init__(self, name):
            self.name = name

        def sleep(self):
            return f"{self.name} is sleeping"

    class Dog(Animal):
        def speak(self):
            return f"{self.name} says Woof!"

    class Cat(Animal):
        def speak(self):
            return f"{self.name} says Meow!"

    dog = Dog("Rex")
    cat = Cat("Mimi")

    print("\n--- [2] Inherited behavior ---")
    print(dog.sleep())
    print(cat.sleep())

    print("\n--- [3] Overridden behavior ---")
    print(dog.speak())
    print(cat.speak())

    print("\n--- [4] is-a relationships ---")
    print("isinstance(dog, Dog):", isinstance(dog, Dog))
    print("isinstance(dog, Animal):", isinstance(dog, Animal))
    print("issubclass(Cat, Animal):", issubclass(Cat, Animal))
    print("issubclass(Animal, Dog):", issubclass(Animal, Dog))

    print("\nLesson 12 practice completed successfully!")


if __name__ == "__main__":
    main()
