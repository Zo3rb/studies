#!/usr/bin/env python3
"""Practice for Lesson 16: Object Introspection — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 16: Object Introspection")
    print("=" * 64)

    import inspect

    print("\n--- [1] Type and identity ---")
    class Animal:
        def speak(self):
            return "sound"

    class Dog(Animal):
        def __init__(self, name):
            self.name = name

        def speak(self, loudly=False):
            text = super().speak()
            return text.upper() if loudly else text

    d = Dog("Rex")
    print("type:", type(d).__name__)
    print("isinstance(d, Dog):", isinstance(d, Dog))
    print("isinstance(d, Animal):", isinstance(d, Animal))

    print("\n--- [2] dir() versus __dict__ ---")
    print("'name' in dir(d):", "name" in dir(d))
    print("'speak' in dir(d):", "speak" in dir(d))
    print("vars(d):", vars(d))
    print("__dict__ keys:", sorted(d.__dict__))

    print("\n--- [3] inspect module ---")
    print("signature:", inspect.signature(Dog.speak))
    print("Dog methods:", [n for n, _ in inspect.getmembers(Dog, inspect.isfunction)])
    print("inspect.ismethod(d.speak):", inspect.ismethod(d.speak))
    print("inspect.isfunction(Dog.speak):", inspect.isfunction(Dog.speak))

    print("\n--- [4] Class metadata ---")
    print("MRO:", [c.__name__ for c in Dog.__mro__])
    print("__name__:", Dog.__name__)
    print("module:", Dog.__module__)

    print("\nLesson 16 practice completed successfully!")


if __name__ == "__main__":
    main()
