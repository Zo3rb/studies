#!/usr/bin/env python3
"""Practice for Lesson 02: What is OOP? Part 2 — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 02: What is OOP? Part 2")
    print("=" * 64)

    print("\n--- [1] Modeling domain nouns as classes ---")
    class Invoice:
        def __init__(self, amount):
            self.amount = amount

        def summary(self):
            return f"Invoice total: {self.amount}"

    invoice = Invoice(100)
    print(invoice.summary())

    print("\n--- [2] Instances share methods, not state ---")
    first = Invoice(100)
    second = Invoice(200)
    first.amount = 150
    print("first:", first.amount, "second:", second.amount)
    print("same method object:", Invoice.summary is first.summary.__func__)

    print("\n--- [3] Polymorphism preview: one call, many answers ---")
    class Circle:
        def area(self):
            return 3.14159

    class Square:
        def area(self):
            return 4.0

    for shape in (Circle(), Square()):
        print(type(shape).__name__, "area =", round(shape.area(), 5))

    print("\n--- [4] The four pillars in one glance ---")
    for pillar in ("Encapsulation", "Abstraction", "Inheritance", "Polymorphism"):
        print(" -", pillar)

    print("\nLesson 02 practice completed successfully!")


if __name__ == "__main__":
    main()
