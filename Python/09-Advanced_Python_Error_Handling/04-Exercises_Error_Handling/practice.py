#!/usr/bin/env python3
"""Practice for Lesson 04: Exercises - Error Handling — Module 09: Advanced Python: Error Handling."""


class ValidationError(Exception):
    """Raised when a value fails a domain rule."""


def parse_port(raw):
    """Validate at the boundary and chain conversion failures."""
    if not isinstance(raw, str):
        raise TypeError("port must be text")
    try:
        port = int(raw)
    except ValueError as exc:
        raise ValueError(f"invalid port: {raw!r}") from exc
    if not 1 <= port <= 65535:
        raise ValueError(f"port out of range: {port}")
    return port


def first_eafp(items):
    """Ask forgiveness: attempt the access and catch the expected errors."""
    try:
        return items[0]
    except (IndexError, TypeError):
        return None


def first_lbyl(items):
    """Look before you leap: check before accessing."""
    if isinstance(items, (list, tuple)) and items:
        return items[0]
    return None


def require_positive(number):
    """Convert a low-level check into a domain error."""
    if number <= 0:
        raise ValidationError(f"expected a positive number, got {number}")
    return number


def main():
    print("=" * 64)
    print("  Lesson 04: Exercises - Error Handling")
    print("=" * 64)

    print("\n--- [1] Boundary validation with chained errors ---")
    for raw in ("8080", "abc", "70000", 80):
        try:
            print(f"  parse_port({raw!r}) -> {parse_port(raw)}")
        except (ValueError, TypeError) as exc:
            cause = type(exc.__cause__).__name__ if exc.__cause__ else "none"
            print(f"  parse_port({raw!r}) failed: {type(exc).__name__}, cause: {cause}")

    print("\n--- [2] EAFP vs LBYL ---")
    for items in ([10, 20], [], None):
        print(f"  {items!r}: EAFP={first_eafp(items)!r}, LBYL={first_lbyl(items)!r}")

    print("\n--- [3] Safe dictionary access ---")
    config = {"host": "localhost"}
    print(f"  get('port', 8080) -> {config.get('port', 8080)}")
    try:
        config["port"]
    except KeyError as exc:
        print(f"  indexing a missing key raised KeyError: {exc}")

    print("\n--- [4] Domain errors instead of mixed low-level types ---")
    for number in (3, 0, -2):
        try:
            print(f"  require_positive({number}) -> {require_positive(number)}")
        except ValidationError as exc:
            print(f"  require_positive({number}) failed: {exc}")

    print("\n--- [5] Batch processing keeps going after a bad item ---")
    values = [("a", "1"), ("b", "nope"), ("c", "3")]
    converted = []
    for label, raw in values:
        try:
            converted.append((label, parse_port(raw)))
        except ValueError as exc:
            print(f"  skipping {label}: {exc}")
    print(f"  converted: {converted}")

    print("\nLesson 04 practice completed successfully!")


if __name__ == "__main__":
    main()
