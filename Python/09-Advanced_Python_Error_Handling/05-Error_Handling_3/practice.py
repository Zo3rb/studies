#!/usr/bin/env python3
"""Practice for Lesson 05: Error Handling 3 — Module 09: Advanced Python: Error Handling."""

import traceback


class AppError(Exception):
    """Base class for errors raised by this application."""


class ConfigError(AppError):
    """The configuration is invalid."""


class FetchError(AppError):
    """Remote data could not be fetched."""


def keep_cause(raw):
    """Chain the original parsing error for a full diagnostic."""
    try:
        return int(raw)
    except ValueError as exc:
        raise ConfigError("number must be an integer") from exc


def hide_cause(raw):
    """Suppress the low-level context deliberately."""
    try:
        return int(raw)
    except ValueError:
        raise ConfigError("number must be an integer") from None


def outer(value):
    """Handle the application error at a sensible boundary."""
    try:
        return keep_cause(value)
    except AppError as exc:
        print(f"  handled {type(exc).__name__}: {exc}")
        return None


def main():
    print("=" * 64)
    print("  Lesson 05: Error Handling 3")
    print("=" * 64)

    print("\n--- [1] A small custom exception hierarchy ---")
    for error_type in (ConfigError, FetchError):
        print(f"  {error_type.__name__}: subclass of AppError = {issubclass(error_type, AppError)}")
    print("  ConfigError is an Exception:", issubclass(ConfigError, Exception))

    print("\n--- [2] 'from exc' keeps the cause ---")
    try:
        keep_cause("oops")
    except ConfigError as exc:
        print(f"  caught {type(exc).__name__}, cause: {type(exc.__cause__).__name__}")
        print(f"  suppress_context: {exc.__suppress_context__}")

    print("\n--- [3] 'from None' hides the cause ---")
    try:
        hide_cause("oops")
    except ConfigError as exc:
        print(f"  caught {type(exc).__name__}, cause: {exc.__cause__}")
        print(f"  suppress_context: {exc.__suppress_context__}")

    print("\n--- [4] Inspecting a caught exception with traceback ---")
    try:
        int("not-a-number")
    except ValueError:
        last_line = traceback.format_exc().strip().splitlines()[-1]
    print("  final traceback line:", last_line)

    print("\n--- [5] Handling at the right boundary ---")
    for value in ("12", "bad"):
        print(f"  outer({value!r}) -> {outer(value)}")

    print("\nLesson 05 practice completed successfully!")


if __name__ == "__main__":
    main()
