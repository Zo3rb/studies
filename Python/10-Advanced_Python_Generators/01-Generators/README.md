# 📖 Lesson: Generators

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/10-Advanced Python - Generators/0140. Generators.mp4`  
> **Module:** 10 — Advanced Python: Generators

---

## 🎯 What This Lesson Covers

Generator functions use `yield` to produce values one at a time instead of returning a finished collection. Calling such a function creates a generator object without running the function body; each `next()` resumes execution until the next `yield`. This lesson also covers `StopIteration`, automatic consumption by `for` loops, and the precise relationship between iterables, iterators and generators.

---

## 📝 Key Concepts

### 1. `yield` Turns a Function into a Generator Factory

A function containing `yield` is a generator function. Calling it returns a fresh generator object immediately; the body stays paused at the start until iteration begins.

```python
def countdown(n):
    while n > 0:
        yield n
        n -= 1

gen = countdown(3)
print(next(gen), next(gen))  # 3 2
```

---

### 2. Lazy Evaluation and Suspended State

Each `next()` runs the function up to the next `yield`, then suspends it. Local variables are preserved between calls, so work after the `yield` resumes exactly where it stopped.

```python
def labels():
    print("starting")
    yield "a"
    print("resuming")
    yield "b"

gen = labels()
print(next(gen))  # prints "starting", then "a"
print(next(gen))  # prints "resuming", then "b"
```

---

### 3. Exhaustion and `StopIteration`

When the function runs off the end, `next()` raises `StopIteration`. A `for` loop calls `iter()` once, repeatedly calls `next()`, and silently stops on that exception. A generator is one-shot: once exhausted, it yields nothing further.

```python
def two_values():
    yield 10
    yield 20

gen = two_values()
print(list(gen))                  # [10, 20]
print(list(gen))                  # [] — the same generator is now empty
print(next(two_values(), None))   # 10 — a new generator starts fresh
```

---

### 4. Iterable, Iterator and Generator

An **iterable** is any object that can return an iterator via `iter()`; a list is a common example. An **iterator** is the object returned by `iter()` that supports `next()` and raises `StopIteration` when done. A **generator** is an iterator created by a generator function or expression, so `iter(gen) is gen` is true.

```python
numbers = [1, 2, 3]
print(iter(numbers) is numbers)  # False: a list is not its own iterator

gen = (n for n in numbers)
print(iter(gen) is gen)          # True: a generator is an iterator
```

---

## ⚠️ Gotchas & Pro Tips

1. **Calling a generator function does not execute its body** — only `next()` or a `for` loop starts it; assigning `gen = countdown(3)` merely builds the generator object.
2. **Generators cannot be rewound** — after `StopIteration`, make a new generator; calling the generator function again is what creates a fresh sequence.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
