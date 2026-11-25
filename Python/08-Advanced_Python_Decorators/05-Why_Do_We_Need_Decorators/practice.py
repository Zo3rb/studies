#!/usr/bin/env python3
"""Practice for Lesson 05: Why Do We Need Decorators? — Module 08: Advanced Python Decorators."""

from functools import lru_cache, wraps


class FakeClock:
    """Deterministic stand-in for time.perf_counter."""

    def __init__(self):
        self.current = 0.0

    def __call__(self):
        self.current += 0.25
        return self.current


def main():
    print("=" * 64)
    print("  Lesson 05: Why Do We Need Decorators?")
    print("=" * 64)

    print("\n--- [1] Logging without touching business logic ---")
    def log_call(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            print(f"LOG: calling {func.__name__}{args}{kwargs}")
            return func(*args, **kwargs)
        return wrapper

    @log_call
    def add(a, b):
        return a + b

    print("add(2, 3):", add(2, 3))

    print("\n--- [2] Timing with a deterministic fake clock ---")
    def timed(clock):
        def decorator(func):
            @wraps(func)
            def wrapper(*args, **kwargs):
                start = clock()
                result = func(*args, **kwargs)
                elapsed = clock() - start
                print(f"TIMING: {func.__name__} took {elapsed:.2f}s")
                return result
            return wrapper
        return decorator

    @timed(FakeClock())
    def greet(name):
        return f"Hello, {name}!"

    print("greet('Ada'):", greet("Ada"))

    print("\n--- [3] Authorization before delegation ---")
    def require_role(role):
        def decorator(func):
            @wraps(func)
            def wrapper(user_role, *args, **kwargs):
                if user_role != role:
                    raise PermissionError(f"{role} role required")
                return func(*args, **kwargs)
            return wrapper
        return decorator

    @require_role("admin")
    def export_report(name):
        return f"exported {name}"

    print("admin:", export_report("admin", "sales.csv"))
    try:
        export_report("guest", "sales.csv")
    except PermissionError as exc:
        print("PermissionError:", exc)

    print("\n--- [4] Caching repeated work ---")
    @lru_cache(maxsize=None)
    def fib(n):
        return n if n < 2 else fib(n - 1) + fib(n - 2)

    print("fib(10):", fib(10))
    print("fib(10) again:", fib(10))
    print("cache info:", fib.cache_info())

    print("\n--- [5] Framework-style route registration ---")
    routes = {}

    def route(path):
        def decorator(func):
            routes[path] = func.__name__
            return func
        return decorator

    @route("/home")
    def home():
        return "Welcome"

    print("routes:", routes)
    print("home():", home())

    print("\n--- [6] When a plain helper is clearer ---")
    def multiply(a, b):
        return a * b

    print("multiply(6, 7):", multiply(6, 7))

    print("\nLesson 05 practice completed successfully!")


if __name__ == "__main__":
    main()
