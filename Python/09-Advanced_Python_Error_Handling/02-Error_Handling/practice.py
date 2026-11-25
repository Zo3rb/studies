#!/usr/bin/env python3
"""Practice for Lesson 02: Error Handling — Module 09: Advanced Python: Error Handling."""


def safe_int(text, default=0):
    """Convert text to int, returning a default for bad input."""
    try:
        return int(text)
    except (TypeError, ValueError):
        return default


def classify(value):
    """Use specific handlers before a broad fallback."""
    try:
        return f"number: {int(value) + 1}"
    except ValueError:
        return "ValueError: text is not an integer"
    except TypeError:
        return "TypeError: value has the wrong type"
    except Exception:
        return "unexpected error"


def main():
    print("=" * 64)
    print("  Lesson 02: Error Handling")
    print("=" * 64)

    print("\n--- [1] try / except basics ---")
    for value in ("42", "forty-two"):
        try:
            number = int(value)
        except ValueError:
            print(f"  {value!r} could not be converted")
        else:
            print(f"  {value!r} converted to {number}")

    print("\n--- [2] Multiple handlers, most specific first ---")
    for value in ("7", "seven", None):
        print(" ", classify(value))

    print("\n--- [3] One handler for a tuple of exception types ---")
    settings = {"host": "localhost"}
    for key in ("host", "port"):
        try:
            print(f"  {key}: {settings[key]}")
        except (KeyError, TypeError) as exc:
            print(f"  {key}: missing ({type(exc).__name__})")

    print("\n--- [4] Binding the exception object ---")
    try:
        1 / 0
    except ZeroDivisionError as exc:
        print(f"  caught {type(exc).__name__}: {exc}")
        print(f"  is an Exception: {isinstance(exc, Exception)}")

    print("\n--- [5] Catch only what you can handle ---")
    for value in ("7", "seven", None, "3.5"):
        print(f"  safe_int({value!r}, -1) -> {safe_int(value, -1)}")

    print("\n--- [6] Why a bare except is too broad ---")
    try:
        try:
            raise KeyboardInterrupt("simulated Ctrl+C")
        except Exception:
            print("  unexpectedly caught by except Exception")
    except BaseException as exc:
        print(f"  only a BaseException handler caught {type(exc).__name__}")

    print("\nLesson 02 practice completed successfully!")


if __name__ == "__main__":
    main()
