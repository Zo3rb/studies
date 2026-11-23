#!/usr/bin/env python3
"""Practice: Exercise: Type Conversion

Module 03 - Python Basics, Lesson 20.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 20: Exercise - Type Conversion")
    print("=" * 64)


    def parse_year(text, current=2026):
        '''Return a valid birth year as int, or None for bad input.'''
        try:
            year = int(text)
        except ValueError:
            return None
        if year < 1900 or year > current:
            return None
        return year


    print("\n--- [1] Input is text ---")
    name = "Andrei"
    birth_text = "1990"  # fixed stand-in for input()
    print("birth_text:", repr(birth_text), type(birth_text).__name__)

    print("\n--- [2] Convert and calculate ---")
    birth_year = parse_year(birth_text)
    current_year = 2026
    if birth_year is None:
        print("Invalid birth year.")
    else:
        age = current_year - birth_year
        print("converted type:", type(birth_year).__name__)
        print(f"Hello {name}, you are {age} years old in {current_year}.")

    print("\n--- [3] Invalid samples ---")
    for sample in ("abc", "", "2030"):
        print(f"{sample!r:>7} -> {parse_year(sample)}")
    print("=" * 64)
    print("Lesson 20 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
