"""Executable examples from the Python refresher Session 1."""


def transform(values):
    """Return doubled positive values in a new list."""
    result = []

    for value in values:
        if value > 0:
            result.append(value * 2)

    return result


def add_bonus(scores):
    """Mutate the supplied list and return the same list."""
    scores.append(100)
    return scores


def change_with_plus(items):
    """Create a new list with +, then mutate that new list."""
    items = items + [4]
    items.append(5)
    return items


def change_with_plus_equals(items):
    """Mutate a list in place with augmented assignment."""
    items += [4]
    items.append(5)
    return items


def summarize(numbers):
    """Return (count, total, average) for positive numbers."""
    count = 0
    total = 0

    for num in numbers:
        if num > 0:
            count += 1
            total += num

    if count == 0:
        return (0, 0, 0)

    return (count, total, total / count)


def run_examples():
    """Print examples and verify expected behavior."""
    numbers = [-2, 3, 0, 5]
    print("transform:", transform(numbers))
    print("original numbers:", numbers)

    marks = [70, 80]
    updated = add_bonus(marks)
    print("updated marks:", updated)
    print("marks:", marks)
    print("updated is marks:", updated is marks)

    numbers = [1, 2, 3]
    result = change_with_plus(numbers)
    print("with +, original:", numbers)
    print("with +, result:", result)
    print("with +, same object:", result is numbers)

    numbers = [1, 2, 3]
    result = change_with_plus_equals(numbers)
    print("with +=, original:", numbers)
    print("with +=, result:", result)
    print("with +=, same object:", result is numbers)

    assert summarize([-2, 4, 6, 0]) == (2, 10, 5.0)
    assert summarize([-3, 0, -1]) == (0, 0, 0)
    assert summarize([]) == (0, 0, 0)
    assert summarize([2.5, 7.5]) == (2, 10.0, 5.0)
    print("All summarize tests passed.")


if __name__ == "__main__":
    run_examples()