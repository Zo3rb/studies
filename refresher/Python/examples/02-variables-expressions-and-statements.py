#!/usr/bin/env python3
"""Examples for PY4E Chapter 2: variables, expressions, and statements."""

from math import isfinite
from numbers import Real


def show_types() -> None:
    """Demonstrate basic Python values and their types.

    Args:
        None.

    Returns:
        None.

    Raises:
        None.
    """
    values = [42, 3.14, "42", True, None]

    for value in values:
        print(repr(value), "->", type(value).__name__)


def arithmetic_examples() -> None:
    """Demonstrate common arithmetic operators.

    Args:
        None.

    Returns:
        None.

    Raises:
        None.
    """
    print("7 + 2 =", 7 + 2)
    print("7 - 2 =", 7 - 2)
    print("7 * 2 =", 7 * 2)
    print("7 / 2 =", 7 / 2)
    print("7 // 2 =", 7 // 2)
    print("7 % 2 =", 7 % 2)
    print("7 ** 2 =", 7**2)


def precedence_examples() -> None:
    """Demonstrate precedence and explicit grouping.

    Args:
        None.

    Returns:
        None.

    Raises:
        None.
    """
    print("1 + 2 * 5 =", 1 + 2 * 5)
    print("(1 + 2) * 5 =", (1 + 2) * 5)

    pi = 3.141592653589793
    print("1 / 2 * pi =", 1 / 2 * pi)
    print("1 / (2 * pi) =", 1 / (2 * pi))


def conversion_examples() -> None:
    """Demonstrate conversion from strings to numeric values.

    Args:
        None.

    Returns:
        None.

    Raises:
        ValueError: If a hard-coded example cannot be converted.
    """
    age_text = "36"
    rate_text = "2.75"

    age = int(age_text)
    rate = float(rate_text)

    print("age:", age, type(age).__name__)
    print("rate:", rate, type(rate).__name__)
    print("age next year:", age + 1)


def gross_pay(hours: Real, rate: Real) -> float:
    """Calculate basic gross pay without overtime.

    Args:
        hours: Number of hours worked.
        rate: Pay received for each hour worked.

    Returns:
        Gross pay as a floating-point number.

    Raises:
        TypeError: If either argument is not a real number or is a boolean.
        ValueError: If either argument is non-finite or negative.
    """
    if isinstance(hours, bool) or not isinstance(hours, Real):
        raise TypeError("hours must be a real number")
    if isinstance(rate, bool) or not isinstance(rate, Real):
        raise TypeError("rate must be a real number")
    if not isfinite(float(hours)) or not isfinite(float(rate)):
        raise ValueError("hours and rate must be finite")
    if hours < 0 or rate < 0:
        raise ValueError("hours and rate cannot be negative")
    return float(hours * rate)


def celsius_to_fahrenheit(celsius: Real) -> float:
    """Convert a Celsius temperature to Fahrenheit.

    Args:
        celsius: Temperature in degrees Celsius.

    Returns:
        The equivalent temperature in degrees Fahrenheit.

    Raises:
        TypeError: If ``celsius`` is not a real number or is a boolean.
        ValueError: If ``celsius`` is not finite.
    """
    if isinstance(celsius, bool) or not isinstance(celsius, Real):
        raise TypeError("celsius must be a real number")
    if not isfinite(float(celsius)):
        raise ValueError("celsius must be finite")
    return float((celsius * 9 / 5) + 32)


def main() -> None:
    """Run the demonstrations and their self-checks.

    Args:
        None.

    Returns:
        None.

    Raises:
        AssertionError: If an example produces an unexpected result.
    """
    print("== Types ==")
    show_types()

    print("\n== Arithmetic ==")
    arithmetic_examples()

    print("\n== Precedence ==")
    precedence_examples()

    print("\n== Conversion ==")
    conversion_examples()

    print("\n== Calculations ==")
    print("gross pay:", gross_pay(35, 2.75))
    print("temperature:", celsius_to_fahrenheit(0))

    # Small self-checks for the examples.
    assert gross_pay(35, 2.75) == 96.25
    assert celsius_to_fahrenheit(0) == 32.0
    assert celsius_to_fahrenheit(100) == 212.0
    try:
        gross_pay(-1, 2.75)
    except ValueError:
        pass
    else:
        raise AssertionError("negative hours should raise ValueError")
    assert 17 / 2 == 8.5
    assert 17 // 2 == 8
    assert 17 % 2 == 1
    print("\nAll checks passed.")


if __name__ == "__main__":
    main()
