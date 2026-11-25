# 📖 Lesson: map()

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0120. map().mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

How `map(function, iterable)` applies a function to every element and returns a lazy iterator. Passing multiple iterables, consuming the result, and comparing `map` with list comprehensions for readability.

---

## 📝 Key Concepts

### 1. Applying a Function to Every Item

`map` builds an iterator that yields `func(item)` for each item in the input. It does not build a list until you ask it to.

```python
def square(x):
    return x * x

squares = map(square, [1, 2, 3, 4])
print(list(squares))  # [1, 4, 9, 16]
```

---

### 2. Multiple Iterables

With several iterables, the function receives one argument from each. Iteration stops as soon as the shortest iterable is exhausted.

```python
a = [1, 2, 3]
b = [10, 20, 30]
print(list(map(lambda x, y: x + y, a, b)))  # [11, 22, 33]
```

---

### 3. Lazy Evaluation

A map object can only be consumed once. Convert it to a list or tuple if you need to reuse the values or inspect them repeatedly.

```python
scores = map(str, [1, 2, 3])
print(next(scores))  # '1'
print(list(scores))  # ['2', '3'] — first item already used
```

---

## ⚠️ Gotchas & Pro Tips

1. **map returns an iterator, not a list** — Printing it shows `<map object ...>`; wrap it in `list()` or iterate in a `for` loop.
2. **Comprehensions are often clearer** — `[square(x) for x in values]` reads naturally in Python and avoids a lambda in many cases.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
