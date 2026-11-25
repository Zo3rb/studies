#!/usr/bin/env python3
"""Practice for Lesson 03: Generators Performance — Module 10: Advanced Python Generators."""

import sys
from itertools import islice

LIMIT = 10_000


def counted_squares(limit, counter):
    """Yield squares while recording how many values were actually pulled."""
    for n in range(limit):
        counter[0] += 1
        yield n * n


def line_stream(text):
    """Yield stripped, non-empty lines one at a time."""
    for line in text.splitlines():
        stripped = line.strip()
        if stripped:
            yield stripped


def main():
    print("=" * 64)
    print("  Lesson 03: Generators Performance")
    print("=" * 64)

    print("\n--- [1] List vs generator object size ---")
    list_squares = [n * n for n in range(LIMIT)]
    gen_squares = (n * n for n in range(LIMIT))
    list_bytes = sys.getsizeof(list_squares)
    gen_bytes = sys.getsizeof(gen_squares)
    print("list object bytes:", list_bytes)
    print("generator object bytes:", gen_bytes)
    print("generator is smaller:", gen_bytes < list_bytes)
    print("list sum:", sum(list_squares))
    print("generator sum:", sum(n * n for n in range(LIMIT)))

    print("\n--- [2] Early termination avoids unnecessary work ---")
    pulls = [0]
    first_five = list(islice(counted_squares(LIMIT, pulls), 5))
    print("values:", first_five)
    print("values produced:", pulls[0])

    print("\n--- [3] Streaming through a small pipeline ---")
    data = " 4 \n 5 \n\n 6 \n"
    stream = (int(value) * 2 for value in line_stream(data))
    print("pipeline type:", type(stream).__name__)
    print("streamed result:", list(stream))

    print("\n--- [4] range is already lazy ---")
    designed = range(10)
    wrapped = (n for n in designed)
    print("range supports next via iterator:", hasattr(iter(designed), "__next__"))
    print("wrapped values:", list(wrapped))

    print("\nLesson 03 practice completed successfully!")


if __name__ == "__main__":
    main()
