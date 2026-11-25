# 📖 Lesson: reduce()

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0123. reduce().mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

How `functools.reduce` collapses an iterable into a single value by repeatedly combining an accumulator with the next item. Choosing an initializer, understanding empty inputs, and recognizing when a built-in such as `sum` is clearer.

---

## 📝 Key Concepts

### 1. Cumulative Computation

`reduce` applies a two-argument function cumulatively: first to the first two items, then to that result and the next item, and so on until one value remains.

```python
from functools import reduce

product = reduce(lambda a, b: a * b, [1, 2, 3, 4])
print(product)  # 24
```

---

### 2. The Initializer

The optional third argument seeds the accumulator. With an initializer, the function is called once per item; without one, it starts from the first two items.

```python
from functools import reduce

total = reduce(lambda acc, n: acc + n, [1, 2, 3], 10)
print(total)  # 16 — starts at 10
```

---

### 3. Empty Iterables and Built-ins

Without an initializer, reducing an empty iterable raises `TypeError`. For common operations, prefer `sum`, `max`, `min`, or `math.prod`, which are clearer and handle edge cases well.

```python
from functools import reduce

try:
    reduce(lambda a, b: a + b, [])
except TypeError as exc:
    print('TypeError:', exc)

print(sum([1, 2, 3]))  # 6
```

---

## ⚠️ Gotchas & Pro Tips

1. **Import it from functools** — `reduce` is not a built-in in Python 3; `from functools import reduce` is required.
2. **Prefer a named function for complex logic** — A lambda with involved arithmetic is harder to debug than a small `def` with a descriptive name.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
