#!/usr/bin/env python3
"""Practice for Lesson 07: Reviewing What We Know So Far — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 07: Reviewing What We Know So Far")
    print("=" * 64)

    print("\n--- [1] An integrated class ---")
    class Book:
        category = "reading"

        def __init__(self, title, pages):
            if pages < 1:
                raise ValueError("pages must be positive")
            self.title = title
            self.pages = pages

        def description(self):
            return f"{self.title} ({self.pages} pages)"

        @classmethod
        def from_dict(cls, data):
            return cls(data["title"], data["pages"])

        @staticmethod
        def is_long(pages):
            return pages > 300

    print("\n--- [2] Instance state and class state ---")
    dune = Book("Dune", 412)
    print("dune.__dict__:", dune.__dict__)
    print("category in Book.__dict__:", "category" in Book.__dict__)
    print("category in dune.__dict__:", "category" in dune.__dict__)
    print("description:", dune.description())

    print("\n--- [3] Alternative constructor and static helper ---")
    short = Book.from_dict({"title": "Notes", "pages": 80})
    print("short:", short.description())
    print("is_long(412):", Book.is_long(412))
    print("is_long(80):", dune.is_long(80))

    print("\n--- [4] Validation still applies ---")
    try:
        Book("Broken", 0)
    except ValueError as exc:
        print("ValueError:", exc)

    print("\nLesson 07 practice completed successfully!")


if __name__ == "__main__":
    main()
