"""Runnable exercise stubs for Python refresher Session 1 (Objects, Lists, Iteration, & Functions).

This module provides foundational exercises preparing for Mathematics and DSA tracks.
All functions strictly conform to PEP 8 and Google Docstring standards using standard library typing.
"""

from __future__ import annotations

from typing import Iterable, Iterator


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
    raise NotImplementedError("Implement me!")


def transform_positive_scale(values: Iterable[int | float], factor: int | float = 2.0) -> list[float]:
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
    raise NotImplementedError("Implement me!")


def in_place_pad_vector(vec: list[int | float], target_len: int, pad_value: int | float = 0) -> list[int | float]:
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
    raise NotImplementedError("Implement me!")


def vector_add_constant(vec: list[int | float], constant: int | float) -> list[int | float]:
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
    raise NotImplementedError("Implement me!")


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
    raise NotImplementedError("Implement me!")


if __name__ == "__main__":
    print("Exercise stubs for Session 1 loaded. Run tests via: python3 -m unittest Python/tests/test_01_session.py")
