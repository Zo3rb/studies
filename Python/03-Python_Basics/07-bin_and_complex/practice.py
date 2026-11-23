#!/usr/bin/env python3
"""Practice: Optional: bin() and complex

Module 03 - Python Basics, Lesson 07.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 07: Optional - bin() and complex")
    print("=" * 64)

    print("\n--- [1] bin() and binary strings ---")
    for number in (0, 5, 10, 255):
        bits = bin(number)
        print(f"{number:>3} -> {bits:>10} ({type(bits).__name__})")
    print("padded 10:", format(10, "08b"))
    print("int('1010', 2):", int("1010", 2))

    print("\n--- [2] complex numbers ---")
    z = 3 + 4j
    print("z:", z, type(z).__name__)
    print("real/imag/magnitude:", z.real, z.imag, abs(z))
    print("constructed equal:", complex(3, 4) == z)
    print("z + 1j:", z + 1j)

    print("\n--- [3] bitwise operators ---")
    print("5 & 3:", 5 & 3)
    print("5 | 3:", 5 | 3)
    print("1 << 4:", 1 << 4)
    print("16 >> 2:", 16 >> 2)
    print("=" * 64)
    print("Lesson 07 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
