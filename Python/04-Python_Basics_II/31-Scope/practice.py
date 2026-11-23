#!/usr/bin/env python3
"""Practice: Scope — Module 04, Python Basics II.

Shows local/global visibility, UnboundLocalError, and outward name lookup with shadowing.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 31: Scope")
    print("=" * 64)
    print("--- [1] Global and local names ---")
    app_name = "Demo"

    def show():
        local_value = 42
        print(f"  inside: {app_name}, {local_value}")

    show()
    print(f"  outside: {app_name}")
    try:
        print(local_value)
    except NameError as exc:
        print(f"  local_value outside -> {type(exc).__name__}")

    print()
    print("--- [2] Assignment makes a name local for the whole function ---")
    count = 10

    def broken():
        print(count)
        count = 5

    try:
        broken()
    except UnboundLocalError as exc:
        print(f"  expected: {type(exc).__name__}: {exc}")

    print()
    print("--- [3] Reading a global is allowed ---")
    def read_global():
        return count

    print(f"  read_global() -> {read_global()} (global count is {count})")

    print()
    print("--- [4] Shadowing and lookup order ---")
    value = "global"

    def shadow():
        value = "local"
        return value

    print(f"  global={value}, shadow()={shadow()}, still global={value}")

    print()
    print("--- [5] Loop blocks do not create a new scope ---")
    for index in range(2):
        block_value = index * 10
    print(f"  after loop: index={index}, block_value={block_value}")
    assert index == 1 and block_value == 10
    print()
    print("=" * 64)
    print(f"  Lesson 31 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
