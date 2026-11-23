#!/usr/bin/env python3
"""Practice: Scope Rules — Module 04, Python Basics II.

Traces LEGB lookups, builds a closure, and demonstrates built-in shadowing recovery.
"""

# A genuine module-level name: nonlocal cannot reach it.
module_value = "global"



def main():
    print("=" * 64)
    print(f"  Lesson 32: Scope Rules")
    print("=" * 64)
    print("--- [1] LEGB: local wins over enclosing, global, builtin ---")
    message = "global"

    def outer():
        message = "enclosing"

        def inner():
            message = "local"
            return message

        return inner(), message

    print(f"  inner()={outer()[0]}, outer level={outer()[1]}, module global={message}")

    print()
    print("--- [2] Enclosing scope when there is no local name ---")
    def outer_read():
        label = "from enclosing"

        def inner_read():
            return label

        return inner_read()

    print(f"  outer_read() -> {outer_read()}")

    print()
    print("--- [3] Closures remember values after the outer call ---")
    def make_multiplier(factor):
        def multiply(value):
            return value * factor
        return multiply

    times_three = make_multiplier(3)
    print(f"  times_three(7) = {times_three(7)}")
    print(f"  captured factor = {times_three.__closure__[0].cell_contents}")
    assert times_three(7) == 21

    print()
    print("--- [4] Shadowing a builtin ---")
    def shadowed_sum(items):
        sum = 99          # local name hides the builtin inside this function
        return sum(items)

    values = [1, 2, 3]
    print(f"  built-in sum: {sum(values)}")
    try:
        shadowed_sum(values)
    except TypeError as exc:
        print(f"  shadowed -> {type(exc).__name__}")
    print(f"  built-in still works in main: {sum(values)}")

    print()
    print("--- [5] Inspecting namespaces ---")
    print(f"  'message' in globals(): {'message' in globals()}")
    def local_demo():
        local_only = "here"
        print(f"  'local_only' in locals(): {'local_only' in locals()}")

    local_demo()
    print()
    print("=" * 64)
    print(f"  Lesson 32 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
