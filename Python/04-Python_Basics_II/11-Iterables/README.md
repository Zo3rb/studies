# 📖 Lesson: Iterables

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0061. Iterables.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

This lesson looks under the hood of `for`: what makes an object iterable, how `iter()` and `next()` drive it, and why generators can be iterated without storing every value in memory. You will also see the idiomatic ways to walk dictionaries and how tuple unpacking makes loops cleaner.

---

## 📝 Key Concepts

### 1. Iterable vs Iterator

An **iterable** is any object that can return an iterator via `iter()`; an **iterator** is the object that produces values one at a time through `next()` and raises `StopIteration` when exhausted. Lists, tuples, strings, dicts, sets, and ranges are iterables; the object returned by `iter(list)` is an iterator.

```python
items = ["a", "b"]
iterator = iter(items)
print(next(iterator))   # 'a'
print(next(iterator))   # 'b'
# next(iterator)       # StopIteration

print(hasattr(items, "__iter__"), hasattr(iterator, "__next__"))
```

---

### 2. How `for` Uses the Protocol

A `for` loop implicitly calls `iter()` once, then repeatedly calls `next()` until `StopIteration`. That is why a `for` loop over an already-consumed iterator does nothing. Generators and `range` are lazy: they produce values on demand rather than allocating a full list.

```python
def squares(limit):
    for n in range(limit):
        yield n * n

for value in squares(4):
    print(value, end=" ")
print()

lazy = range(1_000_000)
print(f"range(1_000_000) length: {len(lazy)}")
```

---

### 3. Iterating Dictionaries and Unpacking

Iterating a dict yields its keys. Use `.values()` for values, `.items()` for `(key, value)` pairs, and unpack those pairs directly in the loop header. `enumerate()` adds an index to any iterable.

```python
prices = {"apple": 2, "pear": 3}
for name in prices:
    print(name)
for name, price in prices.items():
    print(f"{name}: {price}")
for index, name in enumerate(prices, start=1):
    print(index, name)
```

---

## ⚠️ Gotchas & Pro Tips

1. **`for` works on any iterable, not just lists** — Files, dict keys, sets, strings, ranges, and generators all work. Sets have no guaranteed order, so do not rely on their iteration sequence.
2. **Avoid calling `next()` on an exhausted iterator** — `StopIteration` propagates as an error outside a `for` loop. Provide a default (`next(iterator, None)`) when you are not sure how many items remain.
3. **Do not mutate a dict while iterating its keys** — Add or remove entries from a copy (`list(prices)` or `prices.copy()`), otherwise Python raises `RuntimeError: dictionary changed size during iteration`.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
