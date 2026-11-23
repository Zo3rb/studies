#!/usr/bin/env python3
"""Practice for Lesson 06: @classmethod and @staticmethod — Module 06: Advanced Python OOP."""

def main():
    print("=" * 64)
    print("  Lesson 06: @classmethod and @staticmethod")
    print("=" * 64)

    print("\n--- [1] @classmethod as an alternative constructor ---")
    class Date:
        def __init__(self, year, month, day):
            self.year, self.month, self.day = year, month, day

        @classmethod
        def from_iso(cls, text):
            parts = [int(part) for part in text.split("-")]
            return cls(*parts)

        @staticmethod
        def is_leap(year):
            return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)

        def __str__(self):
            return f"{self.year:04d}-{self.month:02d}-{self.day:02d}"

    d = Date.from_iso("2026-11-22")
    print("from_iso:", d)

    print("\n--- [2] @staticmethod needs neither self nor cls ---")
    print("Date.is_leap(2024):", Date.is_leap(2024))
    print("Date.is_leap(2026):", Date.is_leap(2026))
    print("called via instance:", d.is_leap(2000))

    print("\n--- [3] classmethod respects subclasses ---")
    class EuropeanDate(Date):
        def __str__(self):
            return f"{self.day:02d}/{self.month:02d}/{self.year:04d}"

    euro = EuropeanDate.from_iso("2026-11-22")
    print("type:", type(euro).__name__)
    print("formatted:", euro)

    print("\nLesson 06 practice completed successfully!")


if __name__ == "__main__":
    main()
