# 📖 Lesson: Generators Performance

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/10-Advanced Python - Generators/0142. Generators Performance.mp4`  
> **Module:** 10 — Advanced Python: Generators

---

## 🎯 What This Lesson Covers

Generators can reduce peak memory because they hold one value at a time instead of a whole collection, but they are not magically faster than lists. This lesson separates the memory benefit from the speed question, shows how early termination can skip unneeded work, and explains why streaming data through a pipeline keeps memory bounded. It also introduces `timeit` and `tracemalloc` as ways to measure claims instead of guessing.

---

## 📝 Key Concepts

### 1. Memory: Materialize vs Produce on Demand

A list comprehension allocates storage for every result. A generator expression stores only the instructions for making results, so the consumer holds one value at a time. For large or unbounded inputs this can be the difference between fitting in memory and running out of it.

```python
import sys

list_squares = [n * n for n in range(10_000)]
gen_squares = (n * n for n in range(10_000))
print(sys.getsizeof(list_squares) > sys.getsizeof(gen_squares))  # True
```

---

### 2. Speed Depends on the Workload

A list comprehension is often faster when you truly need every value, because it is optimized in C and avoids per-`yield` overhead. A generator can win when the consumer stops early, because values after the stopping point are never computed at all.

```python
from itertools import islice

pulls = 0

def counted_squares(limit):
    global pulls
    for n in range(limit):
        pulls += 1
        yield n * n

print(list(islice(counted_squares(10_000), 5)))  # [0, 1, 4, 9, 16]
print(pulls)                                     # 5, not 10_000
```

---

### 3. Streaming Keeps Memory Flat

When processing lines, records or responses, read one item and pass it through the pipeline. No intermediate list of all items is built, so memory use stays roughly constant even as the input grows.

```python
from io import StringIO

text = "1\n2\n3\n"
doubled = (int(line) * 2 for line in StringIO(text) if line.strip())
print(list(doubled))  # [2, 4, 6]
```

---

### 4. Measure Time and Memory Separately

Use `timeit` for elapsed time and `tracemalloc` for Python allocations. Always consume the generator inside the measured statement; timing only its creation measures almost nothing.

```python
import timeit
import tracemalloc

print(timeit.timeit("sum(n * n for n in range(1000))", number=10))

tracemalloc.start()
total = sum(n * n for n in range(10_000))
current, peak = tracemalloc.get_traced_memory()
tracemalloc.stop()
print(total, peak)
```

---

## ⚠️ Gotchas & Pro Tips

1. **`list()` or `sum()` consumes everything** — wrapping a generator in `list()` gives back the memory advantage immediately; stop early with `islice`, `next()` or `break` instead.
2. **Generators are not inherently faster** — each `yield` has overhead, so prefer them for laziness, streaming and early exit, then measure if speed matters.
3. **`range` is already lazy** — wrapping `range(...)` in a generator expression adds work without saving memory unless you are transforming or filtering values.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
