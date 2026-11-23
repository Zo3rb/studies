#!/usr/bin/env python3
"""Practice for Lesson 04: Attributes and Methods — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 04: Attributes and Methods")
    print("=" * 64)

    print("\n--- [1] Instance attributes ---")
    class User:
        def __init__(self, name):
            self.name = name

        def greet(self):
            return f"Hi, {self.name}"

    ada = User("Ada")
    print("ada.__dict__:", ada.__dict__)
    print("ada.greet():", ada.greet())

    print("\n--- [2] Methods are class attributes; self is the instance ---")
    print("same function:", User.greet is ada.greet.__func__)
    print("bound method:", ada.greet)
    print("calling unbound directly:", User.greet(ada))

    print("\n--- [3] Class attributes and shadowing ---")
    class User2(User):
        kind = "human"

    a = User2("Ada")
    b = User2("Grace")
    print("shared kind:", a.kind, b.kind)
    b.kind = "engineer"
    print("after shadowing:", a.kind, b.kind)

    print("\n--- [4] The mutable class attribute trap ---")
    class Team:
        members = []

    x = Team()
    y = Team()
    x.members.append("Ada")
    print("x.members:", x.members)
    print("y.members (same list!):", y.members)
    print("same object:", x.members is y.members)

    print("\nLesson 04 practice completed successfully!")


if __name__ == "__main__":
    main()
