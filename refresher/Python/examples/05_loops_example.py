# examples/05_loops_example.py

def sum_range(start: int, stop: int) -> int:
    """Return the sum of all integers from *start* to *stop* inclusive.

    Args:
        start: Starting integer (inclusive).
        stop: Ending integer (inclusive). Must be >= start.

    Returns:
        The arithmetic sum.
    """
    if stop < start:
        raise ValueError("stop must be >= start")
    total = 0
    for i in range(start, stop + 1):
        total += i
    return total


def even_numbers(seq: list[int]) -> list[int]:
    """Return a list containing only the even numbers from *seq*.

    Args:
        seq: List of integers.
    Returns:
        List of even integers preserving order.
    """
    return [x for x in seq if x % 2 == 0]


def find_target(seq: list[int], target: int) -> bool:
    """Return ``True`` if *target* is present in *seq* using a loop.

    Args:
        seq: List of integers.
        target: Integer to search for.
    Returns:
        ``True`` if found, ``False`` otherwise.
    """
    for item in seq:
        if item == target:
            return True
    else:
        return False

if __name__ == "__main__":
    print(sum_range(1, 5))          # 15
    print(even_numbers([1,2,3,4,5]))  # [2, 4]
    print(find_target([10,20,30], 20))
    print(find_target([10,20,30], 40))
