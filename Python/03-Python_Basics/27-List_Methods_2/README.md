# 📖 Lesson: List Methods 2

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0037. List Methods 2.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson continues the list-method tour with lookup tools.
`index()` finds the first position of a value and accepts optional start and stop bounds.
The `in` keyword answers membership questions, while `count()` reports how many times a value appears.
Earlier methods such as `append()` and `pop()` are reviewed with emphasis on what they return.

---

## 📝 Key Concepts

### 1. `index()` with Optional Bounds

`items.index(value)` returns the first matching index. `items.index(value, start, stop)` narrows the search.
A missing value raises `ValueError`, so check with `in` first when the value may be absent.

```python
items = ["a", "b", "a", "c"]
print(items.index("a"))
print(items.index("a", 1))
try:
    items.index("z")
except ValueError as error:
    print("ValueError:", error)
```

---

### 2. Membership and Counting

`value in items` returns a boolean using equality comparison. `not in` is the negation.
`items.count(value)` counts exact matches across the whole list.

```python
numbers = [1, 2, 2, 3, 2]
print(2 in numbers, 9 in numbers)
print("count(2):", numbers.count(2))
print("not in:", 9 not in numbers)
```

---

### 3. Method Effects and Returns at a Glance

Knowing whether a method mutates, returns a value, or both prevents common mistakes.

| Method | Mutates list? | Returns |
| :--- | :---: | :--- |
| `append`, `insert`, `extend` | Yes | `None` |
| `pop(i)` | Yes | Removed item |
| `remove(x)` | Yes | `None` |
| `clear()` | Yes | `None` |
| `index`, `count` | No | `int` |

```python
items = [5, 6]
print("append ->", items.append(7))
print("pop ->", items.pop())
print("index ->", items.index(6))
print("count ->", items.count(6))
```

---

## ⚠️ Gotchas & Pro Tips

1. **`index()` is O(n)** — It scans from the left; for large lists, prefer a set or dict if you need repeated lookups.
2. **`in` uses equality** — It compares with `==`, not object identity; custom objects can define their own equality.
3. **`remove` only removes one** — Call it repeatedly (or use a comprehension) to delete all matches.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
