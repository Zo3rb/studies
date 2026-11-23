#!/usr/bin/env python3
"""Practice — Lesson 01: Complete Python Developer — Zero to Mastery | 01 — Introduction."""

def main():
    print("=" * 68)
    print("  Complete Python Developer — Course Orientation")
    print("=" * 68)

    phases = [
        ("Foundations", "01–04", "types, strings, collections, control flow, functions, scope"),
        ("Environment", "05", "interpreter, editors, CLI, PEP 8, Jupyter"),
        ("Paradigms", "06+", "OOP, functional tools, decorators, generators"),
        ("Applications", "later", "testing, files, web, scraping, automation, ML"),
    ]

    print("\nCourse path:")
    for name, modules, focus in phases:
        print(f"  {name:<14} modules {modules:<6} → {focus}")

    print("\nRecommended loop:")
    for step, action in enumerate(
        ["Watch the video", "Read README.md", "Run practice.py", "Answer quiz.md"], start=1
    ):
        print(f"  {step}. {action}")

    print("\nRule of thumb: type every snippet yourself, then change one thing and predict the result.")

if __name__ == "__main__":
    main()

