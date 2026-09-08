#!/usr/bin/env python3
"""Examples and exercise stubs for PY4E Chapter 3: Conditional Execution.

This module provides foundational exercises preparing for Mathematics and DSA tracks.
All functions strictly conform to PEP 8 and Google Docstring standards using standard library typing.
"""

from __future__ import annotations
import math


def categorize_number_sign(val: int | float) -> str:
    """Classify a real number into sign categories: 'positive', 'negative', or 'zero'.

    Implements the mathematical signum indicator function sgn(x).

    Args:
        val: A numeric value (integer or float).

    Returns:
        str: 'positive' if val > 0, 'negative' if val < 0, or 'zero' if val == 0.

    Raises:
        TypeError: If val is not a number or is a boolean.
        ValueError: If val is non-finite (NaN or Infinity).
    """
    # Examples / Expected Behavior:
    # categorize_number_sign(10.5) -> 'positive'
    # categorize_number_sign(-4) -> 'negative'
    # categorize_number_sign(0) -> 'zero'
    # categorize_number_sign("10") -> raises TypeError ("val must be a number")
    if isinstance(val, bool) or not isinstance(val, (int, float)):
        raise TypeError("val must be a number")
    if not math.isfinite(val):
        raise ValueError("val must be finite")

    if val > 0:
        return "positive"
    elif val < 0:
        return "negative"
    else:
        return "zero"


def calculate_overtime_pay_safe(hours_str: str, rate_str: str) -> float:
    """Parse string inputs and calculate gross pay with overtime (1.5x for hours > 40).

    Demonstrates string parsing with try/except, input validation, and piecewise logic.

    Args:
        hours_str: String representation of hours worked.
        rate_str: String representation of hourly pay rate.

    Returns:
        float: Calculated gross pay as a float.

    Raises:
        TypeError: If hours_str or rate_str is not a string.
        ValueError: If strings cannot be parsed to numbers, or if hours/rate are negative or non-finite.
    """
    # Examples / Expected Behavior:
    # calculate_overtime_pay_safe("35", "10.0") -> 350.0
    # calculate_overtime_pay_safe("45", "10.0") -> 475.0  (40*10 + 5*15)
    # calculate_overtime_pay_safe("forty", "10") -> raises ValueError ("invalid string input")
    # calculate_overtime_pay_safe("-5", "10") -> raises ValueError ("hours cannot be negative")
    if not isinstance(hours_str, str) or not isinstance(rate_str, str):
        raise TypeError("hours_str and rate_str must be strings")

    try:
        hours = float(hours_str)
        rate = float(rate_str)
    except ValueError as error:
        raise ValueError("invalid string input") from error

    if not math.isfinite(hours) or not math.isfinite(rate):
        raise ValueError("hours and rate must be finite")
    if hours < 0:
        raise ValueError("hours cannot be negative")
    if rate < 0:
        raise ValueError("rate cannot be negative")

    regular_hours = min(hours, 40)
    overtime_hours = max(hours - 40, 0)
    return regular_hours * rate + overtime_hours * rate * 1.5


def evaluate_score_grade(score: int | float) -> str:
    """Classify a numeric score between 0.0 and 1.0 (or 0 and 100) into academic letter grades.

    Grade mapping:
      score >= 0.9 -> 'A'
      score >= 0.8 -> 'B'
      score >= 0.7 -> 'C'
      score >= 0.6 -> 'D'
      score <  0.6 -> 'F'

    Args:
        score: Score value between 0.0 and 1.0 inclusive.

    Returns:
        str: Letter grade ('A', 'B', 'C', 'D', or 'F').

    Raises:
        TypeError: If score is not a number or is a boolean.
        ValueError: If score is non-finite or out of domain range [0.0, 1.0].
    """
    # Examples / Expected Behavior:
    # evaluate_score_grade(0.95) -> 'A'
    # evaluate_score_grade(0.85) -> 'B'
    # evaluate_score_grade(0.50) -> 'F'
    # evaluate_score_grade(10.0) -> raises ValueError ("score out of range [0.0, 1.0]")
    if isinstance(score, bool) or not isinstance(score, (int, float)):
        raise TypeError("score must be a number")
    if not math.isfinite(score) or not 0.0 <= score <= 1.0:
        raise ValueError("score out of range [0.0, 1.0]")

    if score >= 0.9:
        return "A"
    if score >= 0.8:
        return "B"
    if score >= 0.7:
        return "C"
    if score >= 0.6:
        return "D"
    return "F"


def safe_inverse_and_sqrt(x: int | float) -> tuple[float, float]:
    """Compute mathematical inverse 1/x and square root sqrt(x) safely using guard clauses.

    Args:
        x: Input number where x > 0.

    Returns:
        tuple[float, float]: A tuple (1/x, sqrt(x)).

    Raises:
        TypeError: If x is not a number or is a boolean.
        ValueError: If x <= 0 or x is non-finite.
    """
    # Examples / Expected Behavior:
    # safe_inverse_and_sqrt(4.0) -> (0.25, 2.0)
    # safe_inverse_and_sqrt(1.0) -> (1.0, 1.0)
    # safe_inverse_and_sqrt(0) -> raises ValueError ("x must be strictly positive")
    # safe_inverse_and_sqrt(-4) -> raises ValueError ("x must be strictly positive")
    if isinstance(x, bool) or not isinstance(x, (int, float)):
        raise TypeError("x must be a number")
    if not math.isfinite(x):
        raise ValueError("x must be finite")
    if x <= 0:
        raise ValueError("x must be strictly positive")
    return 1 / x, math.sqrt(x)


def check_range_containment(
    val: int | float,
    low: int | float,
    high: int | float,
    inclusive: bool = True,
) -> bool:
    """Determine whether val falls within interval [low, high] using short-circuit boolean expressions.

    Args:
        val: Value to test.
        low: Lower bound of interval.
        high: Upper bound of interval.
        inclusive: If True, evaluates low <= val <= high. If False, low < val < high. Defaults to True.

    Returns:
        bool: True if val is contained within the interval, False otherwise.

    Raises:
        TypeError: If val, low, or high is not a number, or inclusive is not a boolean.
        ValueError: If low > high, or if any bound is non-finite.
    """
    # Examples / Expected Behavior:
    # check_range_containment(5, 1, 10, True) -> True
    # check_range_containment(10, 1, 10, False) -> False
    # check_range_containment(0, 1, 10, True) -> False
    # check_range_containment(5, 10, 1) -> raises ValueError ("low bound cannot be greater than high")
    values = (val, low, high)
    if any(
        isinstance(value, bool) or not isinstance(value, (int, float))
        for value in values
    ):
        raise TypeError("val, low, and high must be numbers")
    if not isinstance(inclusive, bool):
        raise TypeError("inclusive must be a boolean")
    if not all(math.isfinite(value) for value in values):
        raise ValueError("values must be finite")
    if low > high:
        raise ValueError("low bound cannot be greater than high")

    if inclusive:
        return low <= val <= high
    return low < val < high


if __name__ == "__main__":
    print(
        "Exercise stubs for Session 3 loaded. Run tests via: python3 -m unittest Python/tests/test_03_conditionals.py"
    )
