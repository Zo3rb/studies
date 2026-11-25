#!/usr/bin/env python3
"""Practice for Lesson 03: Decorators 2 — Module 08: Advanced Python Decorators."""

from functools import wraps
from inspect import signature


def main():
    print("=" * 64)
    print("  Lesson 03: Decorators 2")
    print("=" * 64)

    print("\n--- [1] Without wraps, metadata describes the wrapper ---")
    def bare_decorator(func):
        def wrapper(*args, **kwargs):
            return func(*args, **kwargs)
        return wrapper

    @bare_decorator
    def double(x):
        """Return twice x."""
        return x * 2

    print("name:", double.__name__)
    print("doc:", double.__doc__)
    print("signature:", signature(double))

    print("\n--- [2] With wraps, metadata follows the original ---")
    def preserving(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            return func(*args, **kwargs)
        return wrapper

    @preserving
    def triple(x):
        """Return three times x."""
        return x * 3

    print("name:", triple.__name__)
    print("doc:", triple.__doc__)
    print("signature:", signature(triple))
    print("original reachable:", triple.__wrapped__.__name__)

    print("\n--- [3] Forwarding positional and keyword arguments ---")
    def trace(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            result = func(*args, **kwargs)
            print(f"trace: {func.__name__}{args}{kwargs} -> {result}")
            return result
        return wrapper

    @trace
    def describe(a, b=2, *, flag=False):
        return (a, b, flag)

    print("describe result:", describe(1, flag=True))

    print("\n--- [4] Decorator factory with configuration ---")
    def repeat(times):
        def decorator(func):
            @wraps(func)
            def wrapper(*args, **kwargs):
                results = [func(*args, **kwargs) for _ in range(times)]
                return results
            return wrapper
        return decorator

    @repeat(3)
    def greet(name):
        return f"Hi, {name}!"

    print("repeat(3):", greet("Ada"))
    print("repeat name:", greet.__name__)

    print("\n--- [5] Factory validating input before delegating ---")
    def minimum(value):
        def decorator(func):
            @wraps(func)
            def wrapper(number):
                if number < value:
                    raise ValueError(f"number must be at least {value}")
                return func(number)
            return wrapper
        return decorator

    @minimum(2)
    def square(number):
        return number * number

    print("square(4):", square(4))
    try:
        square(1)
    except ValueError as exc:
        print("ValueError:", exc)

    print("\nLesson 03 practice completed successfully!")


if __name__ == "__main__":
    main()
