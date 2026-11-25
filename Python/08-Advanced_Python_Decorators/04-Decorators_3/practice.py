#!/usr/bin/env python3
"""Practice for Lesson 04: Decorators 3 — Module 08: Advanced Python Decorators."""

from functools import lru_cache, wraps
from inspect import unwrap


def main():
    print("=" * 64)
    print("  Lesson 04: Decorators 3")
    print("=" * 64)

    print("\n--- [1] Stacking: apply bottom-up, call top-down ---")
    def tag(label):
        def decorator(func):
            @wraps(func)
            def wrapper():
                return f"[{label}]{func()}"
            return wrapper
        return decorator

    @tag("first")
    @tag("second")
    def core():
        return "<core>"

    print("core():", core())
    print("unwrapped original:", unwrap(core).__name__)
    print("wrapper chain length:", len(list(wrapped for wrapped in [core, core.__wrapped__, core.__wrapped__.__wrapped__])))

    print("\n--- [2] Closure state persists between calls ---")
    def counted(func):
        calls = 0

        @wraps(func)
        def wrapper():
            nonlocal calls
            calls += 1
            return func(), calls

        return wrapper

    @counted
    def tick():
        return "tick"

    @counted
    def tack():
        return "tack"

    print("tick #1:", tick())
    print("tick #2:", tick())
    print("tack #1:", tack())

    print("\n--- [3] Caching with functools.lru_cache ---")
    computed = []

    @lru_cache(maxsize=None)
    def slow_square(n):
        computed.append(n)
        return n * n

    print("slow_square(4):", slow_square(4))
    print("slow_square(4) again:", slow_square(4))
    print("computations:", computed)
    print("cache info:", slow_square.cache_info())

    print("\n--- [4] Authorization before delegation ---")
    def require_role(allowed):
        def decorator(func):
            @wraps(func)
            def wrapper(user_role, *args, **kwargs):
                if user_role not in allowed:
                    return f"denied: {func.__name__}"
                return func(*args, **kwargs)
            return wrapper
        return decorator

    @require_role({"admin"})
    def delete_record(record_id):
        return f"deleted {record_id}"

    print("admin call:", delete_record("admin", "42"))
    print("viewer call:", delete_record("viewer", "42"))

    print("\nLesson 04 practice completed successfully!")


if __name__ == "__main__":
    main()
