# 📖 Lesson: Common List Patterns

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0039. Common List Patterns.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson collects the list idioms you will use constantly.
You compute length with `len()`, reverse with slicing, and generate sequences with `range()`.
The lesson also shows how `join()` turns a list of strings into one string with a chosen separator.
These patterns combine the earlier lessons into practical, readable code.

---

## 📝 Key Concepts

### 1. Length and Iteration

`len(items)` counts top-level elements. A `for` loop visits them in order; `enumerate()` adds the index when you need it.

```python
fruits = ["apple", "banana", "kiwi"]
print("count:", len(fruits))
for index, fruit in enumerate(fruits):
    print(index, fruit)
```

---

### 2. Reversing and Generating Ranges

`items[::-1]` creates a reversed copy. `range(n)` produces numbers from 0 to `n - 1` lazily; wrap it in `list()` when you need a list.
`range(start, stop, step)` supports custom sequences.

```python
fruits = ["apple", "banana"]
print("reversed:", fruits[::-1])
print("range(5) ->", list(range(5)))
print("range(1, 10, 2) ->", list(range(1, 10, 2)))
```

---

### 3. Joining Strings

`separator.join(list_of_strings)` is called on the separator, not the list. Every item must already be a string.
Convert numbers with `str()` or a generator expression first.

```python
words = ["Python", "is", "fun"]
print(" ".join(words))
print("-".join(words))
print(" ".join(str(n) for n in [1, 2, 3]))
```

---

## ⚠️ Gotchas & Pro Tips

1. **`join` is a str method** — `['a', 'b'].join('-')` is wrong; write `'-'.join(['a', 'b'])`.
2. **`range` is not a list** — In Python 3 it is a lazy sequence object; use `list(range(...))` if you need indexing or mutation.
3. **Non-strings need conversion** — Calling `join` on a list containing integers raises `TypeError`.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
