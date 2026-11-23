# 📖 Lesson: List Methods 3

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0038. List Methods 3.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson compares methods that mutate a list with built-ins that create a new one.
`sort()` rearranges the list in place, while `sorted()` returns a new sorted list.
`reverse()` flips a list in place, and `copy()` produces a shallow copy.
Understanding the return value of each tool is the main takeaway.

---

## 📝 Key Concepts

### 1. `sort()` vs `sorted()`

`items.sort()` changes `items` and returns `None`. `sorted(items)` leaves `items` untouched and returns a new list.
Both accept `key` and `reverse` arguments for custom ordering.

```python
numbers = [3, 1, 2]
ordered = sorted(numbers)
print("sorted():", ordered, "original:", numbers)
numbers.sort()
print("sort() ->", numbers)
words = ["apple", "kiwi", "fig"]
words.sort(key=len)
print(words)
```

---

### 2. `reverse()` vs Slicing

`items.reverse()` mutates the list and returns `None`. `items[::-1]` returns a new reversed list, leaving the original alone.

```python
items = [1, 2, 3]
reversed_copy = items[::-1]
items.reverse()
print("reversed_copy:", reversed_copy)
print("items after reverse():", items)
```

---

### 3. `copy()` Makes a Shallow Copy

`items.copy()` is equivalent to `items[:]` for a flat list. It creates a new outer list but still shares nested objects.

```python
original = [1, [2, 3]]
copy = original.copy()
copy.append(4)
copy[1].append(99)
print("original:", original)
print("copy:", copy)
print("outer shared?", original is copy)
print("inner shared?", original[1] is copy[1])
```

---

## ⚠️ Gotchas & Pro Tips

1. **`sort()` returns `None`** — `items = items.sort()` erases your list; call `items.sort()` on its own line.
2. **Sorting mixed types fails** — `[1, 'a'].sort()` raises `TypeError` unless you provide a `key` such as `str`.
3. **Copies are shallow** — Nested lists inside a copied list are still shared, which matters for matrices.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
