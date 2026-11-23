#!/usr/bin/env python3
"""Practice: global Keyword — Module 04, Python Basics II.

Compares global mutation with a pure return-based design and shows declaration errors.
"""

counter = 0
alpha = 0
beta = 0
config_name = "production"


def local_only():
    counter = 99
    return counter


def increment():
    global counter
    counter += 1


def show_config():
    return config_name


def reset():
    global alpha, beta
    alpha, beta = 10, 20


def advance(current, step):
    """Return the next counter value without touching globals."""
    return current + step



def main():
    print("=" * 64)
    print(f"  Lesson 33: global Keyword")
    print("=" * 64)
    print("--- [1] Without global: a local name is created ---")
    print(f"  inside: {local_only()}, module counter still: {counter}")
    assert counter == 0

    print()
    print("--- [2] With global: the module name changes ---")
    increment()
    increment()
    print(f"  after two increments: {counter}")
    assert counter == 2

    print()
    print("--- [3] Reading a global needs no declaration ---")
    print(f"  show_config() -> {show_config()} (config_name is {config_name})")

    print()
    print("--- [4] Multiple globals in one declaration ---")
    reset()
    print(f"  after reset: alpha={alpha}, beta={beta}")
    assert (alpha, beta) == (10, 20)

    print()
    print("--- [5] Preferred design: return the next state ---")
    state = 0
    for step in (1, 2, 3):
        state = advance(state, step)
    print(f"  state after returning values: {state}")
    assert state == 6
    print()
    print("=" * 64)
    print(f"  Lesson 33 practice complete!")
    print("=" * 64)


if __name__ == "__main__":
    main()
