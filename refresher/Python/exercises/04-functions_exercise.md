# exercises/04-functions_exercise.md

## Exercise – Functions Practice

Implement the three functions defined in the **Functions** lesson. Only write the function signatures and a `pass` statement; the bodies will be filled in later.

```python
def greet(name: str) -> str:
    """Return a personalized greeting.

    Args:
        name: The name to greet.

    Returns:
        Greeting string.
    """
    pass

def factorial(n: int) -> int:
    """Return the factorial of a non‑negative integer.

    Raises:
        ValueError: If ``n`` is negative.
    """
    pass

def sum_all(*numbers: int) -> int:
    """Return the sum of all positional integer arguments.
    """
    pass
```

### Guidelines

- **Type hints** must be present exactly as shown.
- Do **not** import any modules inside the function bodies.
- Use `pass` to indicate the implementation is pending.
- Write clean PEP‑8 compliant code (4‑space indentation).

### Hint

For `factorial`, consider a simple `for` loop or recursion, but be mindful of the recursion depth limit.

---

_The exercise follows the same layout as the previous lesson exercise files._
