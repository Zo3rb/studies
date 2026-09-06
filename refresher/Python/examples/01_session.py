"""Runnable examples from Python refresher Session 1."""

from collections.abc import Iterable, Iterator
from math import isfinite
from numbers import Real


def validated_numbers(values: Iterable[Real]) -> Iterator[Real]:
    """Yield finite real numbers and reject invalid values at the boundary."""
    if not isinstance(values, Iterable):
        raise TypeError("values must be an iterable of numbers")

    for value in values:
        if isinstance(value, bool) or not isinstance(value, Real):
            raise TypeError("each value must be a real number")
        if not isfinite(float(value)):
            raise ValueError("each value must be finite")
        yield value


def transform(values: Iterable[Real]) -> list[Real]:
    result = []
    for value in validated_numbers(values):
        if value > 0:
            result.append(value * 2)
    return result


def add_bonus(scores: list[int]) -> list[int]:
    if any(isinstance(score, bool) or not isinstance(score, int) for score in scores):
        raise TypeError("scores must contain integers")
    scores.append(100)
    return scores


def change_with_plus(items: list[int]) -> list[int]:
    if any(isinstance(item, bool) or not isinstance(item, int) for item in items):
        raise TypeError("items must contain integers")
    items = items + [4]
    items.append(5)
    return items


def change_with_plus_equals(items: list[int]) -> list[int]:
    if any(isinstance(item, bool) or not isinstance(item, int) for item in items):
        raise TypeError("items must contain integers")
    items += [4]
    items.append(5)
    return items


def summarize(numbers: Iterable[Real]) -> tuple[int, float, float]:
    count = 0
    total = 0.0

    for number in validated_numbers(numbers):
        if number > 0:
            count += 1
            total += number

    if count == 0:
        return (0, 0.0, 0.0)

    return (count, total, total / count)


def main():
    numbers = [-2, 3, 0, 5]
    print("transform:", transform(numbers))
    print("original:", numbers)

    marks = [70, 80]
    updated = add_bonus(marks)
    print("updated:", updated)
    print("marks:", marks)
    print("same object:", updated is marks)

    numbers = [1, 2, 3]
    result = change_with_plus(numbers)
    print("with +:", numbers, result, result is numbers)

    numbers = [1, 2, 3]
    result = change_with_plus_equals(numbers)
    print("with +=:", numbers, result, result is numbers)

    assert summarize([-2, 4, 6, 0]) == (2, 10, 5.0)
    assert summarize([-3, 0, -1]) == (0, 0, 0)
    assert summarize([]) == (0, 0, 0)
    assert summarize([2.5, 7.5]) == (2, 10.0, 5.0)
    assert summarize(number for number in [2, 4]) == (2, 6.0, 3.0)
    try:
        summarize([1, "two"])  # type: ignore[list-item]
    except TypeError:
        pass
    else:
        raise AssertionError("invalid numeric input should raise TypeError")
    print("All tests passed.")


if __name__ == "__main__":
    main()
