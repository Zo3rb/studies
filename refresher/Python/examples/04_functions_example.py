# examples/04_functions_example.py

def greet(name: str) -> str:
    """Return a personalized greeting.

    Args:
        name: The name of the person to greet.

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


def sum_all(*numbers: int) -> int:
    """Return the sum of all positional integer arguments.
    """
    return sum(numbers)

if __name__ == "__main__":
    print(greet("World"))
    print(factorial(5))
    print(sum_all(1, 2, 3, 4))
