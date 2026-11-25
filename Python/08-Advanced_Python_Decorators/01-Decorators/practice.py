#!/usr/bin/env python3
"""Practice for Lesson 01: Decorators — Module 08: Advanced Python Decorators."""

def main():
    print("=" * 64)
    print("  Lesson 01: Decorators")
    print("=" * 64)

    print("\n--- [1] Functions are objects ---")
    def greet(name):
        return f"Hello, {name}!"

    alias = greet
    print("alias is greet:", alias is greet)
    print("alias('Ada'):", alias("Ada"))
    print("greet.__name__:", greet.__name__)

    print("\n--- [2] Manual decoration: wrap and replace ---")
    def exclaim(func):
        def wrapper(*args, **kwargs):
            return func(*args, **kwargs) + "!"
        return wrapper

    def plain(name):
        return f"Hi {name}"

    loud = exclaim(plain)
    print("plain('Ada'):", plain("Ada"))
    print("loud('Ada'):", loud("Ada"))

    print("\n--- [3] @ syntax is the same assignment ---")
    @exclaim
    def welcomed(name):
        return f"Welcome {name}"

    print("welcomed('Ada'):", welcomed("Ada"))
    print("type(welcomed).__name__:", type(welcomed).__name__)

    print("\n--- [4] Decoration runs at definition time ---")
    def notice(func):
        print("decorating:", func.__name__)
        return func

    @notice
    def ping():
        return "pong"

    print("about to call ping")
    print("ping():", ping())

    print("\n--- [5] Gotcha: returning func instead of calling it ---")
    def forgot_to_call(func):
        def wrapper(*args, **kwargs):
            return func
        return wrapper

    @forgot_to_call
    def answer():
        return 42

    print("type(answer()).__name__:", type(answer()).__name__)
    print("answer() is callable:", callable(answer()))

    print("\nLesson 01 practice completed successfully!")


if __name__ == "__main__":
    main()
