#!/usr/bin/env python3
"""Practice for Lesson 03: Error Handling 2 — Module 09: Advanced Python: Error Handling."""


class ConfigurationError(Exception):
    """Raised when a configuration value is invalid."""


def doubled_number(text):
    """Keep the success path in else, away from the handler."""
    try:
        value = int(text)
    except ValueError:
        return None
    else:
        return value * 2


def read_with_cleanup(events, close):
    """Demonstrate that finally runs even when try returns."""
    try:
        events.append("read")
        return "data"
    finally:
        close()


def failing_read(events):
    """Demonstrate that finally runs even when try raises."""
    try:
        raise ValueError("read failed")
    finally:
        events.append("cleanup after failure")


def reraise_bad_number(text):
    """Re-raise the current exception without losing its traceback."""
    try:
        return int(text)
    except ValueError:
        raise


def parse_port(raw):
    """Translate a conversion error into one domain-specific error."""
    try:
        return int(raw)
    except ValueError as exc:
        raise ConfigurationError("port must be an integer") from exc


def main():
    print("=" * 64)
    print("  Lesson 03: Error Handling 2")
    print("=" * 64)

    print("\n--- [1] else runs only on success ---")
    for value in ("21", "twenty-one"):
        print(f"  doubled_number({value!r}) -> {doubled_number(value)}")

    print("\n--- [2] finally runs on return and on failure ---")
    events = []
    result = read_with_cleanup(events, lambda: events.append("closed"))
    print(f"  result: {result!r}, events: {events}")
    try:
        failing_read(events)
    except ValueError as exc:
        print(f"  caught {type(exc).__name__}: {exc}")
    print(f"  events after failure: {events}")

    print("\n--- [3] raise a validation error ---")
    try:
        amount = -5
        if amount < 0:
            raise ValueError("amount must not be negative")
    except ValueError as exc:
        print(f"  raised and caught: {exc}")

    print("\n--- [4] bare raise re-raises the current exception ---")
    try:
        reraise_bad_number("oops")
    except ValueError as exc:
        print(f"  re-raised {type(exc).__name__}: {exc}")

    print("\n--- [5] custom exception chained with 'from exc' ---")
    try:
        parse_port("eighty")
    except ConfigurationError as exc:
        print(f"  caught {type(exc).__name__}: {exc}")
        print(f"  cause: {type(exc.__cause__).__name__}: {exc.__cause__}")

    print("\nLesson 03 practice completed successfully!")


if __name__ == "__main__":
    main()
