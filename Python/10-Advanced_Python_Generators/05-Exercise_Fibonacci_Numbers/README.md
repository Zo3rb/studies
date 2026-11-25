# 📖 Lesson: Exercise - Fibonacci Numbers

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/10-Advanced Python - Generators/0144. Exercise - Fibonacci Numbers.mp4`  
> **Module:** 10 — Advanced Python: Generators

---

## 🎯 What This Lesson Covers

This exercise applies generators to the Fibonacci sequence, starting with `0, 1, 1, 2, 3, 5, ...`. It builds an infinite generator from two rolling variables, then bounds it by count, by value and by slice using `itertools.islice` and `itertools.takewhile`. The lesson also contrasts the iterative generator with the exponential recursive formulation and highlights why the consumer, not the generator, must decide when an infinite sequence stops.

---

## 📝 Key Concepts

### 1. An Infinite Generator from Rolling State

Keep the last two values and update them simultaneously after each `yield`. Because the generator is lazy, it can describe an endless sequence while producing only the values actually requested.

```python
def fibonacci():
    a, b = 0, 1
    while True:
        yield a
        a, b = b, a + b

from itertools import islice
print(list(islice(fibonacci(), 6)))  # [0, 1, 1, 2, 3, 5]
```

---

### 2. Bounding by Count

If the exercise asks for the first `n` numbers, a `for _ in range(n)` loop inside the generator is simpler than slicing an infinite one. Each iteration yields the current value before advancing the state.

```python
def first_fibonacci(count):
    a, b = 0, 1
    for _ in range(count):
        yield a
        a, b = b, a + b

print(list(first_fibonacci(8)))  # [0, 1, 1, 2, 3, 5, 8, 13]
```

---

### 3. Bounding by Value or by Position

For an upper bound, `itertools.takewhile` stops at the first value that fails the predicate. For a positional window, `itertools.islice` selects a range of indices without materializing the whole prefix.

```python
from itertools import islice, takewhile

print(list(takewhile(lambda n: n <= 100, fibonacci())))
# [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

print(list(islice(fibonacci(), 10, 15)))  # [55, 89, 144, 233, 377]
```

---

### 4. Iteration Beats Recursion Here

A naive recursive Fibonacci function recomputes the same subproblems repeatedly, giving exponential call growth. The generator advances with one addition per yielded value, so computing the `n`th value takes linear time and constant extra state.

```python
def fib_at(index):
    from itertools import islice

    for value in islice(fibonacci(), index + 1):
        last = value
    return last

print(fib_at(8))  # 21
```

---

## ⚠️ Gotchas & Pro Tips

1. **Use simultaneous assignment** — `a, b = b, a + b` computes both new values from the old pair; splitting it into two statements changes the sequence.
2. **Never call `list(fibonacci())`** — an infinite generator has no end, so a consumer must bound it with `next()`, `islice`, `takewhile` or `break`.
3. **The duplicated `1` is correct** — the sequence starts `0, 1, 1, 2, ...`; dropping one of the ones changes the standard definition.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
