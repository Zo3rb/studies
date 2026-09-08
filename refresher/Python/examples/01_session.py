#!/usr/bin/env python3
"""Runnable exercises for Python refresher Session 1.

This module provides foundational exercises preparing for Mathematics and DSA tracks.
All functions strictly conform to PEP 8 and Google Docstring standards using standard library typing.
"""

from __future__ import annotations
from typing import Iterable, Iterator

import math


def validated_numbers(values: Iterable[int | float]) -> Iterator[float]:
    """Yield finite numbers as floats and reject invalid types or non-finite values at boundary.

    Args:
        values: An iterable of numeric values (integers or floats).

    Yields:
        float: Validated finite real numbers converted to floating-point numbers.

    Raises:
        TypeError: If values is not an iterable, or contains non-numeric types (or booleans).
        ValueError: If any numeric value is non-finite (NaN or Infinity).
    """
    # Examples / Expected Behavior:
    # list(validated_numbers([1, 2, 3])) -> [1.0, 2.0, 3.0]
    # list(validated_numbers([-5.5, 0, 10])) -> [-5.5, 0.0, 10.0]
    # list(validated_numbers([1, True])) -> raises TypeError ("each value must be a number")
    # list(validated_numbers([1, float("nan")])) -> raises ValueError ("each value must be finite")

    # ---------------------------------------------------------------------------------------------#
    # 1. Check if the input itself is an iterable (and reject types like int/float/None directly)
    if not isinstance(values, Iterable):
        raise TypeError("values must be an iterable")

    # 2. Iterate through each element lazily
    for val in values:
        # 3. Reject booleans explicitly (since bool is a subclass of int in Python)
        # and reject any non-numeric types (not an int or float)
        if isinstance(val, bool) or not isinstance(val, (int, float)):
            raise TypeError("each value must be a number")

        # 4. Check if the numeric value is finite (not NaN, +Inf, or -Inf)
        if not math.isfinite(val):
            raise ValueError("each value must be finite")

        # 5. Yield the valid number explicitly cast to float
        yield float(val)


def transform_positive_scale(
    values: Iterable[int | float], factor: int | float = 2.0
) -> list[float]:
    """Transform positive numbers from an input sequence by applying a scaling factor.

    Computes f(x) = factor * x for all x > 0. Demonstrates pure function behavior (immutability).

    Args:
        values: An iterable of numeric values to process.
        factor: Multiplicative scaling factor. Defaults to 2.0.

    Returns:
        list[float]: A new list containing the scaled positive values.

    Raises:
        TypeError: If values contains non-numeric items or factor is not a number.
        ValueError: If any numeric item or factor is non-finite.
    """
    # Examples / Expected Behavior:
    # transform_positive_scale([-2, 3, 0, 5], 2.0) -> [6.0, 10.0]
    # transform_positive_scale([2.5, 4.0], 3.0) -> [7.5, 12.0]
    # transform_positive_scale([-1, -5, 0]) -> []
    # transform_positive_scale([1, "a"]) -> raises TypeError ("each value must be a number")

    # ---------------------------------------------------------------------------------------------#
    # 1. Validate 'values' is an iterable
    if not isinstance(values, Iterable):
        raise TypeError("values must be an iterable")

    # 2. Validate 'factor' type (reject booleans explicitly) and finiteness
    if isinstance(factor, bool) or not isinstance(factor, (int, float)):
        raise TypeError("factor must be a number")
    if not math.isfinite(factor):
        raise ValueError("factor must be finite")

    res = []
    # 3. Process elements
    for val in values:
        # Validate 'val' type (reject booleans explicitly)
        if isinstance(val, bool) or not isinstance(val, (int, float)):
            raise TypeError("each value must be a number")

        # Validate finiteness
        if not math.isfinite(val):
            raise ValueError("each value must be finite")

        # Process only strictly positive numbers (x > 0)
        if val > 0:
            res.append(float(val * factor))

    return res


def in_place_pad_vector(
    vec: list[int | float], target_len: int, pad_value: int | float = 0
) -> list[int | float]:
    """Pad a numeric vector in place until it reaches target_len with pad_value.

    Demonstrates in-place mutation (call-by-sharing). Returns the modified original vector.

    Args:
        vec: A list of numeric values to be padded in place.
        target_len: Desired minimum length of the vector.
        pad_value: The value to append if len(vec) < target_len. Defaults to 0.

    Returns:
        list[int | float]: The same list object mutated in place (vec is result).

    Raises:
        TypeError: If vec is not a list, target_len is not an integer, or pad_value is non-numeric.
        ValueError: If target_len is negative or any value is non-finite.
    """
    # Examples / Expected Behavior:
    # in_place_pad_vector([1, 2], 4, 0) -> [1, 2, 0, 0]  (mutates original list)
    # in_place_pad_vector([1, 2, 3], 2) -> [1, 2, 3]  (no padding needed)
    # in_place_pad_vector([], 3, -1) -> [-1, -1, -1]
    # in_place_pad_vector("1, 2", 4) -> raises TypeError ("vec must be a list")

    # ---------------------------------------------------------------------------------------------#
    # 1. Type validations
    if not isinstance(vec, list):
        raise TypeError("vec must be a list")

    # target_len must strictly be an int (and not bool)
    if isinstance(target_len, bool) or not isinstance(target_len, int):
        raise TypeError("target_len must be an integer")

    # pad_value must be int or float (and not bool)
    if isinstance(pad_value, bool) or not isinstance(pad_value, (int, float)):
        raise TypeError("pad_value must be a numeric value")

    # 2. Value validations
    if target_len < 0:
        raise ValueError("target_len cannot be negative")

    if not math.isfinite(pad_value):
        raise ValueError("pad_value must be finite")

    # Check all existing elements in vec for valid types and finiteness
    for item in vec:
        if isinstance(item, bool) or not isinstance(item, (int, float)):
            raise TypeError("all elements in vec must be numeric")
        if not math.isfinite(item):
            raise ValueError("all elements in vec must be finite")

    # 3. In-place padding logic
    # Calculate how many elements need to be appended
    padding_needed = target_len - len(vec)
    if padding_needed > 0:
        vec.extend([pad_value] * padding_needed)

    return vec


def vector_add_constant(
    vec: list[int | float], constant: int | float
) -> list[int | float]:
    """Return a new vector with constant added to each element v + c.

    Demonstrates out-of-place vector transformations creating a new memory allocation.

    Args:
        vec: A list of numeric values.
        constant: The scalar constant to add to each element.

    Returns:
        list[int | float]: A new list containing the element-wise sum.

    Raises:
        TypeError: If vec is not a list, constant is non-numeric, or vec contains invalid types.
        ValueError: If constant or any vector element is non-finite.
    """
    # Examples / Expected Behavior:
    # vector_add_constant([1, 2, 3], 10) -> [11, 12, 13]  (original list unmodified)
    # vector_add_constant([], 5) -> []
    # vector_add_constant([1.5, -2.5], 0.5) -> [2.0, -2.0]
    # vector_add_constant([1, "2"], 10) -> raises TypeError ("elements must be numbers")
    if not isinstance(vec, list):
        raise TypeError("vec must be a list")

    if isinstance(constant, bool) or not isinstance(constant, (int, float)):
        raise TypeError("constant must be a numeric value")
    if not math.isfinite(constant):
        raise ValueError("constant must be finite")

    result: list[int | float] = []
    for item in vec:
        if isinstance(item, bool) or not isinstance(item, (int, float)):
            raise TypeError("all elements in vec must be numeric")
        if not math.isfinite(item):
            raise ValueError("all elements in vec must be finite")
        result.append(item + constant)

    return result


def summarize_series(numbers: Iterable[int | float]) -> tuple[int, float, float]:
    """Compute one-pass summary statistics (count, sum, mean) for positive numbers in a series.

    Demonstrates single-pass accumulator algorithm running in O(N) time and O(1) auxiliary space.

    Args:
        numbers: An iterable sequence of numeric values.

    Returns:
        tuple[int, float, float]: A 3-tuple (count_positive, sum_positive, mean_positive).
            Returns (0, 0.0, 0.0) if no positive numbers exist.

    Raises:
        TypeError: If numbers is not an iterable or contains non-numeric items (or booleans).
        ValueError: If any numeric item is non-finite.
    """
    # Examples / Expected Behavior:
    # summarize_series([-2, 4, 6, 0]) -> (2, 10.0, 5.0)  (2 positive numbers, sum=10.0, mean=5.0)
    # summarize_series([-3, 0, -1]) -> (0, 0.0, 0.0)
    # summarize_series([]) -> (0, 0.0, 0.0)
    # summarize_series([2.5, 7.5]) -> (2, 10.0, 5.0)
    count = 0
    total = 0.0

    for number in validated_numbers(numbers):
        if number > 0:
            count += 1
            total += number

    if count == 0:
        return (0, 0.0, 0.0)

    return (count, total, total / count)


if __name__ == "__main__":
    print(
        "Exercise stubs for Session 1 loaded. Run tests via: python3 -m unittest Python/tests/test_01_session.py"
    )
