#!/usr/bin/env python3
"""Practice for Lesson 04: Under The Hood Of Generators — Module 10: Advanced Python Generators."""

import inspect


def counter():
    """Yield an unbounded count while retaining a local in its frame."""
    n = 0
    while True:
        yield n
        n += 1


def echo():
    """Yield a ready signal, then print whatever is sent into the yield."""
    while True:
        received = yield "ready"
        print("  received:", received)


def receiver():
    """Demonstrate cleanup when close() raises GeneratorExit."""
    try:
        while True:
            value = yield "waiting"
            print("  got:", value)
    finally:
        print("  finally: cleaned up")


def catcher():
    """Catch an exception injected at the suspended yield."""
    try:
        yield "ready"
    except ValueError as exc:
        yield "caught: " + str(exc)


def inner():
    yield 1
    yield 2


def outer():
    yield from inner()


def main():
    print("=" * 64)
    print("  Lesson 04: Under The Hood Of Generators")
    print("=" * 64)

    print("\n--- [1] A fresh generator owns a code object and a frame ---")
    gen = counter()
    print("type:", type(gen).__name__)
    print("gi_code.co_name:", gen.gi_code.co_name)
    print("gi_frame exists:", gen.gi_frame is not None)
    print("state:", inspect.getgeneratorstate(gen))

    print("\n--- [2] The frame is suspended, not destroyed ---")
    print("first value:", next(gen))
    print("state:", inspect.getgeneratorstate(gen))
    print("frame locals:", gen.gi_frame.f_locals)
    print("second value:", next(gen))
    print("frame locals:", gen.gi_frame.f_locals)
    gen.close()

    print("\n--- [3] send() feeds a value into the yield expression ---")
    talker = echo()
    print("send(None) starts it:", talker.send(None))
    print("send(42):", talker.send(42))
    talker.close()

    print("\n--- [4] throw() and close() act at the suspension point ---")
    caught = catcher()
    print("started:", next(caught))
    print("after throw:", caught.throw(ValueError("boom")))
    print("remaining:", list(caught))

    listener = receiver()
    print("started:", next(listener))
    print("after send(7):", listener.send(7))
    listener.close()
    print("state after close:", inspect.getgeneratorstate(listener))
    print("gi_frame after close:", listener.gi_frame)

    print("\n--- [5] yield from delegates to a subgenerator ---")
    delegated = outer()
    print("state:", inspect.getgeneratorstate(delegated))
    print("first value:", next(delegated))
    print("state:", inspect.getgeneratorstate(delegated))
    print("gi_yieldfrom set:", delegated.gi_yieldfrom is not None)
    print("remaining:", list(delegated))
    print("state after draining:", inspect.getgeneratorstate(delegated))

    print("\nLesson 04 practice completed successfully!")


if __name__ == "__main__":
    main()
