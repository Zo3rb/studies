# Exercise 1 — Functions and Lists

## Task

Implement a function that returns the count, total, and average of positive
even numbers.

```python
from collections.abc import Iterable
from numbers import Real


def summarize_even(numbers: Iterable[Real]) -> tuple[int, float, float]:
    # Return (count, total, average).
    # Return (0, 0, 0) if there are no positive even numbers.
    pass
```

## Expected behavior

```python
summarize_even([-2, 3, 4, 6, 7])  # (2, 10, 5.0)
summarize_even([-3, 1, 5])        # (0, 0, 0)
summarize_even([])                # (0, 0, 0)
```

## Constraints

- Use an explicit `for` loop.
- Do not use `sum`, `filter`, or a list comprehension yet.
- Add at least three assertions.
- Do not divide by zero when no values match.
- Add a runtime validation for non-numeric and non-finite values using only the
  standard library.
- Keep the function compatible with a one-use iterable such as a generator.

## Questions after solving

1. Does your function modify the input list?
2. What happens if `numbers` is a generator?
3. Why does the average become a float?
