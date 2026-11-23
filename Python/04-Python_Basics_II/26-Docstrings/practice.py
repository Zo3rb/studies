#!/usr/bin/env python3
"""Practice: Docstrings — Module 04, Python Basics II.

Writes PEP 257-style docstrings and reads them back with __doc__ and help().
"""


def main():
    print("=" * 64)
    print(f"  Lesson 26: Docstrings")
    print("=" * 64)
    print("--- [1] A one-line docstring and __doc__ ---")
    def greet(name):
        """Return a friendly greeting for name."""
        return f"Hello, {name}!"

    print(f"  greet.__doc__: {greet.__doc__!r}")
    print(f"  call result: {greet('Ada')}")
    assert greet.__doc__ == "Return a friendly greeting for name."

    print()
    print("--- [2] A multi-line docstring ---")
    def divide(a, b):
        """Divide a by b.

        Args:
            a: The numerator.
            b: The denominator; must not be zero.

        Returns:
            The quotient as a float.

        Raises:
            ValueError: If b is zero.
        """
        if b == 0:
            raise ValueError("b must not be zero")
        return a / b

    print("  first line:", divide.__doc__.splitlines()[0])
    print("  has Args section:", "Args:" in divide.__doc__)
    print(f"  divide(9, 3) = {divide(9, 3)}")
    try:
        divide(1, 0)
    except ValueError as exc:
        print(f"  expected error: {exc}")

    print()
    print("--- [3] help() shows the docstring ---")
    import io
    from contextlib import redirect_stdout

    buffer = io.StringIO()
    with redirect_stdout(buffer):
        help(greet)
    help_text = buffer.getvalue()
    print("  help(greet) contains the summary:", "friendly greeting" in help_text)

    print()
    print("--- [4] Classes and modules have docstrings too ---")
    class Box:
        """A simple container with one value."""

        def __init__(self, value):
            self.value = value

    print(f"  Box.__doc__: {Box.__doc__!r}")
    print(f"  __doc__ without a docstring: {[].__doc__!r}")
    print()
    print("=" * 64)
    print(f"  Lesson 26 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
