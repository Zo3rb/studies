# exercises/loops_exercise.md

## Exercise – Loops and Iterations Practice

Implement the three helper functions defined in the **Loops and Iterations** lesson. Only write the function signatures and a `pass` statement; the bodies will be filled in later.

```python
def sum_range(start: int, stop: int) -> int:
    """Return the sum of all integers from *start* to *stop* inclusive.

    Args:
        start: Starting integer (inclusive).
        stop: Ending integer (inclusive). Must be >= start.

    Returns:
        The arithmetic sum.
    """
    pass

def even_numbers(seq: list[int]) -> list[int]:
    """Return a list of the even numbers from *seq* preserving order.

    Args:
        seq: List of integers.
    Returns:
        List of even integers.
    """
    pass

def find_target(seq: list[int], target: int) -> bool:
    """Return ``True`` if *target* exists within *seq* using an explicit loop.

    Args:
        seq: List of integers.
        target: Integer to search for.
    Returns:
        ``True`` if found, ``False`` otherwise.
    """
    pass
```

### Guidelines
- Keep **type hints** exactly as shown.
- Do **not** import any modules inside the function bodies.
- Use `pass` to indicate the implementation is pending.
- Follow standard PEP‑8 indentation (4 spaces).

### Hint
For `sum_range`, a simple `for` loop over `range(start, stop + 1)` works well. Remember to raise `ValueError` if `stop < start`.

---
*The exercise follows the same layout as the previous lesson exercise files.*
