#!/usr/bin/env python3
"""Practice: Dictionaries

Module 03 - Python Basics, Lesson 32.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 32: Dictionaries")
    print("=" * 64)

    print("\n--- [1] Creating dictionaries ---")
    user = {"name": "Andrei", "age": 36}
    print("literal:", user)
    print("via kwargs:", dict(name="Andrei", age=36))
    print("via pairs:", dict([("name", "Andrei"), ("age", 36)]))
    print("equal:", user == dict(name="Andrei", age=36))

    print("\n--- [2] Access and update ---")
    print("name:", user["name"])
    user["email"] = "andrei@example.com"
    user["age"] = 37
    print("updated:", user, "pairs:", len(user))
    try:
        print(user["missing"])
    except KeyError as error:
        print("expected KeyError:", error)

    print("\n--- [3] Nested values ---")
    profile = {
        "name": "Andrei",
        "skills": ["Python", "JS"],
        "address": {"city": "Toronto"},
    }
    print("first skill:", profile["skills"][0])
    print("city:", profile["address"]["city"])
    print("=" * 64)
    print("Lesson 32 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
