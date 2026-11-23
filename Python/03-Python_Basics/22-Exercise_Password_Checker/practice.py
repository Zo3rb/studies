#!/usr/bin/env python3
"""Practice: Exercise: Password Checker

Module 03 - Python Basics, Lesson 22.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 22: Exercise - Password Checker")
    print("=" * 64)

    print("\n--- [1] Simulated input values ---")
    username = "Andrei"
    password = "s3cret!"
    print("username:", repr(username), "password:", repr(password))
    print("types:", type(username).__name__, type(password).__name__)

    print("\n--- [2] Greeting and mask ---")
    greeting = f"Welcome, {username}!"
    masked = "*" * len(password)
    print(greeting)
    print("Password accepted:", masked)

    print("\n--- [3] Simple validation samples ---")
    for sample in ("abc", "longenough1"):
        status = "ok" if len(sample) >= 8 else "too short"
        print(f"{sample!r:>14} -> {status} ({len(sample)} chars)")
    print("=" * 64)
    print("Lesson 22 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
