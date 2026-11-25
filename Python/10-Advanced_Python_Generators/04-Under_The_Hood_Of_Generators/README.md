# 📖 Lesson: Under The Hood Of Generators

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/10-Advanced Python - Generators/0143. Under The Hood Of Generators.mp4`  
> **Module:** 10 — Advanced Python: Generators

---

## 🎯 What This Lesson Covers

A generator object is more than a mysterious iterator: it wraps a code object and a suspended frame that holds local variables and an instruction pointer. This lesson examines `gi_frame`, `gi_code` and the states reported by `inspect.getgeneratorstate`, then shows how `send()`, `throw()` and `close()` interact with a paused `yield`. Understanding this model explains why state survives between calls and how `yield from` forwards control to a subgenerator.

---

## 📝 Key Concepts

### 1. A Generator Object Owns a Suspended Frame

Calling a generator function creates an object with attributes such as `gi_code` and `gi_frame`. The frame starts before the first instruction; when execution reaches `yield`, the frame is frozen rather than destroyed, so its locals remain available.

```python
def counter():
    n = 0
    while True:
        yield n
        n += 1

gen = counter()
print(gen.gi_frame is not None)  # True — a frame is prepared
print(next(gen))                 # 0
print(gen.gi_frame.f_locals)     # {'n': 0} — the frame is suspended
```

---

### 2. `yield` Is an Expression, Not Just a Statement

With plain `next()`, the value of a `yield` expression is `None`. With `send(value)`, that value becomes the result of the suspended `yield`, so the generator can react to input at the exact point where it paused.

```python
def echo():
    while True:
        received = yield "ready"
        print("received:", received)

gen = echo()
print(next(gen))      # ready
print(gen.send(42))   # received: 42, then ready
gen.close()
```

---

### 3. `send()`, `throw()` and `close()` Drive the Paused Frame

`send(None)` is equivalent to `next()` on a started generator; the first `send()` must be `None` because there is no suspended `yield` to receive a value yet. `throw(exc)` raises an exception at the suspension point, and `close()` raises `GeneratorExit` there, which runs any `finally` block before the frame is discarded.

```python
def receiver():
    try:
        while True:
            value = yield "waiting"
            print("got", value)
    finally:
        print("cleaned up")

gen = receiver()
print(next(gen))      # waiting
print(gen.send(7))    # got 7, then waiting
gen.close()           # cleaned up
```

---

### 4. States and Delegation

`inspect.getgeneratorstate()` reports `GEN_CREATED`, `GEN_RUNNING`, `GEN_SUSPENDED` or `GEN_CLOSED`. When a generator uses `yield from`, its `gi_yieldfrom` attribute points at the currently active subgenerator while that subgenerator is running.

```python
import inspect

def inner():
    yield 1
    yield 2


def outer():
    yield from inner()

gen = outer()
print(inspect.getgeneratorstate(gen))  # GEN_CREATED
print(next(gen))                       # 1
print(inspect.getgeneratorstate(gen))  # GEN_SUSPENDED
print(gen.gi_yieldfrom is not None)    # True — delegating to inner()
list(gen)                              # drain remaining values
print(inspect.getgeneratorstate(gen))  # GEN_CLOSED
```

---

## ⚠️ Gotchas & Pro Tips

1. **The first `send()` must be `None`** — sending a value before the generator has reached its first `yield` raises `TypeError`; call `next(gen)` or `gen.send(None)` to start it.
2. **A closed generator has no live frame** — after exhaustion or `close()`, `gi_frame` becomes `None`, and calling `next()` again raises `StopIteration`.
3. **Do not yield after catching `GeneratorExit`** — `close()` expects the generator to finish; yielding in response raises `RuntimeError`.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
