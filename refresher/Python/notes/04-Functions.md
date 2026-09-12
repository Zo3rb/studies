# 📚 04-Functions.md

## 🎯 Learning Objectives

- Define functions with clear signatures and type hints.
- Use default arguments, `*args`, and `**kwargs`.
- Apply Google‑style docstrings (`Args`, `Returns`, `Raises`).
- Validate inputs using the standard library (`typing`, `inspect`).
- Understand the distinction between returning a value and returning `None`.

## 📖 Theory

A function is a reusable block of code that performs a specific task. In Python you create a function with the `def` keyword, followed by the **function name**, a parenthesised **parameter list**, an optional **return annotation**, and a colon. The first statement after the colon is usually a **docstring** that explains what the function does.

```python
def greet(name: str) -> str:
    """Return a personalised greeting.

    Args:
        name: The name to greet.

    Returns:
        A greeting string.
    """
    return f"Hello, {name}!"
```

### Important Concepts

| Concept                    | Why it matters                                                                 |
| -------------------------- | ------------------------------------------------------------------------------ |
| **Type hints** (`typing`)  | Make interfaces explicit; tooling (mypy, editors) can catch mismatches.        |
| **Default values**         | Allow callers to omit arguments; beware of mutable defaults (`list=[]`).       |
| **`*args` / `**kwargs`\*\* | Capture an arbitrary number of positional or keyword arguments.                |
| **Docstrings**             | Provide inline documentation; Google style is easy to read and parse.          |
| **`return` vs `None`**     | `return` without a value yields `None`; useful for side‑effect‑only functions. |

## 🛠️ Example Code (`examples/04-functions.py`)

```python
from typing import List, Optional

def greet(name: str) -> str:
    """Return a personalised greeting.

    Args:
        name: The name to greet.

    Returns:
        A greeting string.
    """
    return f"Hello, {name}!"

def factorial(n: int) -> int:
    """Return the factorial of a non‑negative integer.

    Raises:
        ValueError: If ``n`` is negative.
    """
    if n < 0:
        raise ValueError("n must be >= 0")
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def average(values: List[int]) -> Optional[float]:
    """Compute the arithmetic mean of a list of integers.

    Returns ``None`` for an empty list.
    """
    if not values:
        return None
    return sum(values) / len(values)

if __name__ == "__main__":
    print(greet("World"))
    print(factorial(5))
    print(average([1, 2, 3, 4]))
```

## ✍️ Exercise (`exercises/04-functions_exercise.md`)

Implement the **signatures** shown below in a file called `functions_exercise.py`. Do **not** write the bodies – they will be filled in by you during study.

```python
def greet(name: str) -> str:
    """Return a personalised greeting."""
    ...

def factorial(n: int) -> int:
    """Return the factorial of a non‑negative integer, raising ``ValueError`` for negatives."""
    ...

def average(values: List[int]) -> Optional[float]:
    """Return the mean of ``values`` or ``None`` if the list is empty."""
    ...
```

## 🧪 Tests (`tests/test_04_functions.py`)

```python
import unittest
from functions_exercise import greet, factorial, average

class TestFunctions(unittest.TestCase):
    def test_greet(self):
        self.assertEqual(greet("Alice"), "Hello, Alice!")

    def test_factorial(self):
        self.assertEqual(factorial(0), 1)
        self.assertEqual(factorial(5), 120)
        with self.assertRaises(ValueError):
            factorial(-1)

    def test_average(self):
        self.assertAlmostEqual(average([1, 2, 3]), 2.0)
        self.assertIsNone(average([]))

if __name__ == "__main__":
    unittest.main()
```

---

_All files follow the same premium layout used throughout the refresher project._
