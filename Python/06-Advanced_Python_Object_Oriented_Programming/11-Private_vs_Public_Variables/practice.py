#!/usr/bin/env python3
"""Practice for Lesson 11: Private vs Public Variables — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 11: Private vs Public Variables")
    print("=" * 64)

    print("\n--- [1] Three visibility conventions ---")
    class Vault:
        def __init__(self):
            self.public = "open"
            self._internal = "internal by convention"
            self.__secret = "name mangled"

        def reveal(self):
            return self.__secret

    vault = Vault()
    print("public:", vault.public)
    print("_internal:", vault._internal)
    print("reveal():", vault.reveal())

    print("\n--- [2] Inspecting the mangled name ---")
    print("__dict__ keys:", sorted(vault.__dict__))
    print("hasattr(vault, '__secret'):", hasattr(vault, "__secret"))
    print("vault._Vault__secret:", vault._Vault__secret)

    print("\n--- [3] Mangling avoids subclass collisions ---")
    class Parent:
        def __init__(self):
            self.__value = "parent"

        def parent_value(self):
            return self.__value

    class Child(Parent):
        def __init__(self):
            super().__init__()
            self.__value = "child"

        def child_value(self):
            return self.__value

    child = Child()
    print("parent_value():", child.parent_value())
    print("child_value():", child.child_value())

    print("\n--- [4] Dunder names are not mangled ---")
    class Box:
        def __len__(self):
            return 3

    box = Box()
    print("len(box):", len(box))
    print("'__len__' in Box.__dict__:", "__len__" in Box.__dict__)

    print("\nLesson 11 practice completed successfully!")


if __name__ == "__main__":
    main()
