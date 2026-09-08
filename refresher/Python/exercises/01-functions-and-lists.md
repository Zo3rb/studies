# Exercise 1 — Functions and Lists

## Task

Implement a function that returns the count, total, and average of positive even numbers from an input sequence.

```python
from __future__ import annotations

from typing import Iterable


def summarize_even(numbers: Iterable[int | float]) -> tuple[int, float, float]:
    """Calculate summary statistics for positive even numbers in a sequence.

    Args:
        numbers: An iterable sequence of numeric values.

    Returns:
        tuple[int, float, float]: A 3-tuple (count_even, sum_even, mean_even).
            Returns (0, 0.0, 0.0) if no positive even numbers exist.

    Raises:
        TypeError: If numbers contains non-numeric items or is not an iterable.
        ValueError: If any numeric item is non-finite (NaN or Infinity).
    """
    # Examples / Expected Behavior:
    # summarize_even([-2, 3, 4, 6, 7]) -> (2, 10.0, 5.0)  # (4 and 6 match)
    # summarize_even([-3, 1, 5]) -> (0, 0.0, 0.0)
    # summarize_even([]) -> (0, 0.0, 0.0)
    raise NotImplementedError("Implement me!")
```

## Constraints & Best Practices

- **One-Pass Iteration**: Use a single explicit `for` loop to process the input stream.
- **Generator Friendly**: Keep the function compatible with one-use iterables (generators).
- **Space Complexity**: Maintain $\mathcal{O}(1)$ auxiliary memory (accumulator pattern).
- **Time Complexity**: Maintain $\mathcal{O}(N)$ linear execution time.
- **Defensive Boundary Validation**: Raise `TypeError` for booleans (`True`/`False`) or non-numeric types, and `ValueError` for non-finite values (`NaN`, `inf`).

## Testing

Verify your solution by creating unit tests under `Python/tests/` using Python's standard `unittest` library!

## Questions for Discussion

1. Does your function mutate the input collection?
2. Why is single-pass generator iteration more memory-efficient than creating intermediate list filtering (`[x for x in numbers if x % 2 == 0]`)?
3. How does checking `isinstance(x, bool)` before `isinstance(x, (int, float))` prevent subtle bugs in Python's object model?
