#!/usr/bin/env python3
"""Practice for Lesson 01: What Is OOP? — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 01: What Is OOP?")
    print("=" * 64)

    print("\n--- [1] Procedural style: data and functions are separate ---")
    def bark_procedural(animal_name):
        print(f"{animal_name} says Woof!")

    dog_name = "Rex"
    bark_procedural(dog_name)

    print("\n--- [2] OOP style: state and behavior live together ---")
    class Dog:
        species = "Canis familiaris"

        def bark(self):
            print(f"{self.name} says Woof!")

    rex = Dog()
    rex.name = "Rex"
    rex.bark()

    print("\n--- [3] Two independent objects from one blueprint ---")
    fido = Dog()
    fido.name = "Fido"
    print("rex is fido:", rex is fido)
    rex.bark()
    fido.bark()
    print("same species:", rex.species == fido.species)

    print("\n--- [4] Classes and instances are different things ---")
    print("type(rex).__name__:", type(rex).__name__)
    print("type(Dog).__name__:", type(Dog).__name__)

    print("\nLesson 01 practice completed successfully!")


if __name__ == "__main__":
    main()
