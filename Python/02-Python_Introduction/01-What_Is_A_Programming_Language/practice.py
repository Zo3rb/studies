#!/usr/bin/env python3
"""Practice — Lesson 02: What Is A Programming Language? | 02 — Python Introduction."""

def main():
    print("=" * 68)
    print("  Lesson: What Is A Programming Language?")
    print("=" * 68)

    instructions = [
        ("Store a value", "temperature = 21"),
        ("Make a decision", "if temperature > 30: ..."),
        ("Repeat a step", "for day in week: ..."),
        ("Reuse logic", "def summarize(...): ..."),
    ]

    print("\nA program is an unambiguous sequence of instructions:")
    for intent, code in instructions:
        print(f"  {intent:<18} → {code}")

    def demo(value):
        return "hot" if value > 30 else "comfortable"

    print("\nSame instruction, different input:")
    for value in (21, 35):
        print(f"  temperature={value} → {demo(value)}")

    print("\nPython's contract: legal syntax + defined semantics + a runtime that executes it.")

if __name__ == "__main__":
    main()

