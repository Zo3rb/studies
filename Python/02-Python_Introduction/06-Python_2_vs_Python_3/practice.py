#!/usr/bin/env python3
"""Practice — Lesson 02: Python 2 vs Python 3 | 02 — Python Introduction."""

def main():
    print("=" * 68)
    print("  Lesson: Python 2 vs Python 3")
    print("=" * 68)

    print("\n[1] print is a function in Python 3:")
    print("Hello", "from", "print()", sep=" ")

    print("\n[2] Division:")
    print(f"  7 / 2  = {7 / 2}   (true division in Python 3)")
    print(f"  7 // 2 = {7 // 2}  (floor division)")
    print(f"  -7 // 2 = {-7 // 2} (floors toward negative infinity!)")

    print("\n[3] Text vs bytes:")
    text = "café"
    raw = text.encode("utf-8")
    print(f"  text: {text!r} ({type(text).__name__})")
    print(f"  raw : {raw!r} ({type(raw).__name__})")
    print(f"  round trip: {raw.decode('utf-8')!r}")

    print("\n[4] range() is lazy in Python 3:")
    big = range(1_000_000)
    print(f"  range(1_000_000) stores no list — size in bytes: {big.__sizeof__()}")

    print("\n[5] input() always returns str (no raw_input in Python 3):")
    print("  Demo skipped — these practice scripts never require stdin.")

if __name__ == "__main__":
    main()

