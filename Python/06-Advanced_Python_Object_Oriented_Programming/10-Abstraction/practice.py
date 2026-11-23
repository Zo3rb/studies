#!/usr/bin/env python3
"""Practice for Lesson 10: Abstraction — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 10: Abstraction")
    print("=" * 64)

    from abc import ABC, abstractmethod

    print("\n--- [1] An abstract contract ---")
    class Shape(ABC):
        @abstractmethod
        def area(self):
            """Return the shape's area."""

        def describe(self):
            return f"{type(self).__name__} area = {self.area():.2f}"

    class Circle(Shape):
        def __init__(self, radius):
            self.radius = radius

        def area(self):
            return 3.14159 * self.radius ** 2

    class Rectangle(Shape):
        def __init__(self, width, height):
            self.width, self.height = width, height

        def area(self):
            return self.width * self.height

    print("\n--- [2] Callers use only the abstract interface ---")
    for shape in (Circle(2), Rectangle(3, 4)):
        print(shape.describe())
        print("isinstance of Shape:", isinstance(shape, Shape))

    print("\n--- [3] Abstract classes cannot be instantiated ---")
    try:
        Shape()
    except TypeError as exc:
        print("TypeError:", exc)

    class Incomplete(Shape):
        pass

    try:
        Incomplete()
    except TypeError as exc:
        print("TypeError:", exc)

    print("\nLesson 10 practice completed successfully!")


if __name__ == "__main__":
    main()
