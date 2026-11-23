#!/usr/bin/env python3
"""Practice: nonlocal Keyword — Module 04, Python Basics II.

Builds independent counter and toggle closures and diagnoses UnboundLocalError.
"""


def main():
    print("=" * 64)
    print(f"  Lesson 34: nonlocal Keyword")
    print("=" * 64)
    print("--- [1] Reading an enclosing variable works ---")
    def outer():
        label = "captured"

        def inner():
            return label

        return inner()

    print(f"  inner() -> {outer()}")

    print()
    print("--- [2] Rebinding without nonlocal fails ---")
    def broken():
        count = 0

        def inner():
            count += 1
            return count

        try:
            inner()
        except UnboundLocalError as exc:
            print(f"  expected: {type(exc).__name__}: {exc}")

    broken()

    print()
    print("--- [3] A stateful counter with nonlocal ---")
    def make_counter(start=0):
        count = start

        def next_value():
            nonlocal count
            count += 1
            return count

        return next_value

    counter_a = make_counter()
    counter_b = make_counter(100)
    print(f"  counter_a: {counter_a()}, {counter_a()}, {counter_a()}")
    print(f"  counter_b: {counter_b()}, {counter_b()}")
    assert [counter_a() for _ in range(1)] == [4]
    assert counter_b() == 103

    print()
    print("--- [4] A toggle closure ---")
    def make_toggle(initial=True):
        state = initial

        def toggle():
            nonlocal state
            state = not state
            return state

        return toggle

    flip = make_toggle()
    print(f"  toggles: {flip()}, {flip()}, {flip()}")
    assert [flip() for _ in range(2)] == [True, False]

    print()
    print("--- [5] nonlocal cannot reach globals ---")
    code = """
    def tries_global():
        def inner():
            nonlocal module_value  # no enclosing FUNCTION scope exists
            return module_value
    """
    try:
        compile(code, "<demo>", "exec")
    except SyntaxError as exc:
        print(f"  expected compile-time error: {type(exc).__name__}: {exc.msg}")
    print()
    print("=" * 64)
    print(f"  Lesson 34 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
