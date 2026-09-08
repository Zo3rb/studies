#!/usr/bin/env python3
"""Examples and exercise stubs for PY4E Chapter 2: variables, expressions, and statements.

This module provides foundational exercises preparing for Mathematics and DSA tracks.
All functions strictly conform to PEP 8 and Google Docstring standards using standard library typing.
"""

from __future__ import annotations

from typing import Any


def analyze_numeric_types(values: list[Any]) -> list[tuple[str, str]]:
    """Inspect a list of Python values and return pairs of (repr_string, type_name).

    Args:
        values: A list of arbitrary Python objects.

    Returns:
        list[tuple[str, str]]: A list of tuples where each element is (repr(val), type(val).__name__).

    Raises:
        TypeError: If values is not a list.
    """
    # Examples / Expected Behavior:
    # analyze_numeric_types([42, 3.14, "42", True, None]) ->
    #   [('42', 'int'), ('3.14', 'float'), ("'42'", 'str'), ('True', 'bool'), ('None', 'NoneType')]
    # analyze_numeric_types("not a list") -> raises TypeError ("values must be a list")
    raise NotImplementedError("Implement me!")


def safe_divide_and_modulo(a: int | float, b: int | float) -> tuple[float, int, float]:
    """Perform exact division, floor division, and modulo operations safely.

    Calculates (a / b, int(a // b), float(a % b)).

    Args:
        a: Dividend number.
        b: Divisor number.

    Returns:
        tuple[float, int, float]: A 3-tuple containing (quotient, floor_quotient, remainder).

    Raises:
        TypeError: If a or b is not a number or is a boolean.
        ValueError: If a or b is non-finite (NaN or Infinity).
        ZeroDivisionError: If b is zero.
    """
    # Examples / Expected Behavior:
    # safe_divide_and_modulo(7, 2) -> (3.5, 3, 1.0)
    # safe_divide_and_modulo(10.0, 4.0) -> (2.5, 2, 2.0)
    # safe_divide_and_modulo(5, 0) -> raises ZeroDivisionError ("divisor cannot be zero")
    # safe_divide_and_modulo(5, "2") -> raises TypeError ("arguments must be numbers")
    raise NotImplementedError("Implement me!")


def parse_and_scale_inputs(val1_str: str, val2_str: str, scale: int | float = 1.0) -> tuple[float, float]:
    """Parse string representations of numbers, convert them to floats, and apply a scale factor.

    Computes (float(val1_str) * scale, float(val2_str) * scale).

    Args:
        val1_str: String representation of first number.
        val2_str: String representation of second number.
        scale: Multiplicative scale factor. Defaults to 1.0.

    Returns:
        tuple[float, float]: A tuple of the two scaled floating-point numbers.

    Raises:
        TypeError: If val1_str or val2_str is not a string, or scale is not a number.
        ValueError: If strings cannot be converted to floats or parsed values/scale are non-finite.
    """
    # Examples / Expected Behavior:
    # parse_and_scale_inputs("36", "2.75", 2.0) -> (72.0, 5.5)
    # parse_and_scale_inputs("10.5", "0.5") -> (10.5, 0.5)
    # parse_and_scale_inputs("abc", "2.75") -> raises ValueError ("could not convert string to float")
    # parse_and_scale_inputs(36, "2.75") -> raises TypeError ("inputs must be strings")
    raise NotImplementedError("Implement me!")


def calculate_gross_pay(
    hours: int | float,
    rate: int | float,
    overtime_threshold: int | float = 40.0,
    overtime_multiplier: int | float = 1.5,
) -> float:
    """Calculate gross pay with optional overtime calculation.

    For hours <= overtime_threshold: pay = hours * rate.
    For hours > overtime_threshold: pay = (threshold * rate) + ((hours - threshold) * rate * multiplier).

    Args:
        hours: Number of hours worked.
        rate: Hourly pay rate.
        overtime_threshold: Standard hours before overtime applies. Defaults to 40.0.
        overtime_multiplier: Rate multiplier for overtime hours. Defaults to 1.5.

    Returns:
        float: Total gross pay formatted as a floating-point number.

    Raises:
        TypeError: If any parameter is not a number or is a boolean.
        ValueError: If any parameter is non-finite or negative.
    """
    # Examples / Expected Behavior:
    # calculate_gross_pay(35, 10.0) -> 350.0
    # calculate_gross_pay(45, 10.0) -> 475.0  (40*10 + 5*15)
    # calculate_gross_pay(-1, 10.0) -> raises ValueError ("hours and rate cannot be negative")
    # calculate_gross_pay(40, "10.0") -> raises TypeError ("arguments must be numbers")
    raise NotImplementedError("Implement me!")


def celsius_to_fahrenheit(celsius: int | float) -> float:
    """Convert a Celsius temperature to Fahrenheit using the linear formula F = (C * 9/5) + 32.

    Args:
        celsius: Temperature in degrees Celsius.

    Returns:
        float: Equivalent temperature in degrees Fahrenheit.

    Raises:
        TypeError: If celsius is not a number or is a boolean.
        ValueError: If celsius is non-finite.
    """
    # Examples / Expected Behavior:
    # celsius_to_fahrenheit(0) -> 32.0
    # celsius_to_fahrenheit(100) -> 212.0
    # celsius_to_fahrenheit(-40) -> -40.0
    # celsius_to_fahrenheit("0") -> raises TypeError ("celsius must be a number")
    raise NotImplementedError("Implement me!")


if __name__ == "__main__":
    print("Exercise stubs for Session 2 loaded. Run tests via: python3 -m unittest Python/tests/test_02_variables.py")
