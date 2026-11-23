#!/usr/bin/env python3
"""Practice — Lesson 01: Course Outline | 01 — Introduction."""

def main():
    print("=" * 68)
    print("  Course Outline — Sections 01 to 24")
    print("=" * 68)

    sections = [
        ("01", "Introduction", "orientation + outline"),
        ("02", "Python Introduction", "language, interpreter, execution"),
        ("03", "Python Basics", "types, operators, strings, collections"),
        ("04", "Python Basics II", "flow, loops, functions, scope"),
        ("05", "Developer Environment", "install, editors, CLI, PEP 8, Jupyter"),
        ("06", "Advanced Python — OOP", "classes, inheritance, dunders, MRO"),
    ]

    print("\nIn scope for this study folder:")
    for number, name, focus in sections:
        print(f"  {number}  {name:<30} {focus}")

    print("\nPreview of later sections:")
    later = [
        "Functional Programming", "Decorators", "Error Handling", "Generators",
        "Modules", "Debugging", "File IO", "Regular Expressions", "Testing",
        "Scripting", "Scraping", "Web Development", "Automation Testing",
        "Machine Learning + Data Science", "Career / projects / appendix",
    ]
    for index, name in enumerate(later, start=7):
        print(f"  {index:>2}  {name}")

    print("\nStudy loop: watch → notes → practice.py → quiz.md → build something small.")

if __name__ == "__main__":
    main()

