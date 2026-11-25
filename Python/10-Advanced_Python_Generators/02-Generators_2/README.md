# 📖 Lesson: Generators 2

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/10-Advanced Python - Generators/0141. Generators 2.mp4`  
> **Module:** 10 — Advanced Python: Generators

---

## 🎯 What This Lesson Covers

This lesson extends basic generator functions with generator expressions, `yield from` delegation and lazily composed pipelines. It shows how small generators can be chained so each stage transforms values only when a consumer asks for them. It also demonstrates how to bound a potentially infinite generator with `itertools.islice` so a program stays finite and predictable.

---

## 📝 Key Concepts

### 1. Generator Expressions Are Lazy Comprehensions

The syntax `(expression for target in iterable if condition)` builds a generator object immediately but evaluates items on demand. Unlike a list comprehension, it does not allocate all results at once, and it can be consumed only once.

```python
squares = (n * n for n in range(6) if n % 2 == 0)
print(next(squares))       # 0
print(list(squares))       # [4, 16] — the remaining values
```

---

### 2. `yield from` Delegates to Another Iterator

`yield from source` yields every item from `source` and forwards `send()`, `throw()` and `close()` to it. It is more than a shorthand loop: the delegating generator keeps a direct link to the active subgenerator while it runs.

```python
def combine(*sources):
    for source in sources:
        yield from source

print(list(combine([1, 2], (3, 4), (5, 6))))  # [1, 2, 3, 4, 5, 6]
```

---

### 3. Composing Lazy Pipelines

A generator can accept any iterable as input and yield transformed values as output. Staging work this way keeps each function small and defers every calculation until the final consumer requests a value.

```python
def evens(values):
    for value in values:
        if value % 2 == 0:
            yield value


def scaled(values, factor):
    for value in values:
        yield value * factor

print(list(scaled(evens(range(6)), 10)))  # [0, 20, 40]
```

---

### 4. Bounding an Infinite Generator

A generator may describe an endless sequence, but the consumer must decide when to stop. `itertools.islice` takes a finite slice by count, so only the requested values are ever produced.

```python
from itertools import count, islice

def multiples(of):
    for n in count(1):
        yield n * of

print(list(islice(multiples(3), 5)))      # [3, 6, 9, 12, 15]
print(list(islice(multiples(3), 2, 5)))   # [9, 12, 15]
```

---

## ⚠️ Gotchas & Pro Tips

1. **The outermost iterable in a generator expression is evaluated eagerly** — in `(x for x in build_items())`, `build_items()` is called when the expression is created, though its items are not iterated until consumption.
2. **`yield from` is not just a `for` loop** — it sets up delegation, so exceptions and sent values reach the inner generator; use it when you need the subgenerator's full protocol, not only its yielded values.
3. **A pipeline is one-shot** — once the consumer drains it, rebuild the generators; do not expect a second pass to reproduce the values.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
