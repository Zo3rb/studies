#!/usr/bin/env python3
"""Practice: Matrix

Module 03 - Python Basics, Lesson 25.
Stdlib-only, deterministic, and runnable without stdin.
"""


def main():
    """Run the lesson demonstrations."""
    print("=" * 64)
    print("Lesson 25: Matrix")
    print("=" * 64)

    matrix = [
        [1, 0, 1],
        [0, 1, 0],
    ]

    print("\n--- [1] Nested indexes ---")
    print("matrix:", matrix)
    print("rows:", len(matrix), "cols:", len(matrix[0]))
    print("matrix[0][2]:", matrix[0][2])
    print("matrix[1][0]:", matrix[1][0])

    print("\n--- [2] Build a grid safely ---")
    grid = [[0 for _ in range(3)] for _ in range(2)]
    grid[0][1] = 1
    print("comprehension grid:", grid)
    bad = [[0] * 3] * 2
    bad[0][1] = 1
    print("shared-row grid:", bad)

    print("\n--- [3] Pixel-style operations ---")
    image = [[0, 1, 0], [1, 1, 0]]
    lit = sum(pixel for row in image for pixel in row)
    image[0][0] = 1 - image[0][0]
    print("lit before flip:", lit)
    print("flipped image:", image)
    print("=" * 64)
    print("Lesson 25 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
