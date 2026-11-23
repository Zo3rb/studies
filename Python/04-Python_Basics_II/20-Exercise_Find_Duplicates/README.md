# 📖 Lesson: Exercise - Find Duplicates

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/04-Python Basics II/0070. Exercise - Find Duplicates.mp4`  
> **Module:** 04 — Python Basics II

---

## 🎯 What This Lesson Covers

This exercise asks you to find repeated values in a collection — a classic interview and real-world task. You will compare a set-based approach with a dictionary-counting approach, learn how to report each duplicate only once, and see how to preserve the order in which duplicates first appear.

---

## 📝 Key Concepts

### 1. Detecting a Duplicate with a Set

A set stores each value once, so iterating while 'have I seen this?' tests against a `seen` set finds repeats in linear time. Add to `seen` only after checking, so the second occurrence is the one detected. Use a second set (`reported`) to avoid listing the same duplicate repeatedly.

```python
items = ["a", "b", "a", "c", "b", "a"]
seen = set()
duplicates = set()
for item in items:
    if item in seen:
        duplicates.add(item)
    else:
        seen.add(item)
print(sorted(duplicates))   # ['a', 'b']
```

---

### 2. Counting with a Dictionary

A dict can store how many times each value appeared. Iterate once to build the counts, then keep entries whose count is greater than one. Dicts preserve insertion order in modern Python, so this version naturally reports duplicates in first-seen order.

```python
items = ["a", "b", "a", "c", "b", "a"]
counts = {}
for item in items:
    counts[item] = counts.get(item, 0) + 1
print(counts)
print([item for item, count in counts.items() if count > 1])
```

---

### 3. Complexity and Order Trade-offs

The set approach is `O(n)` time and uses extra memory proportional to the number of distinct items. A naive nested-loop comparison is `O(n²)` but needs no extra set. `collections.Counter` is a standard-library shortcut that wraps the counting pattern in a reusable tool.

```python
from collections import Counter

items = ["a", "b", "a", "c", "b", "a"]
counts = Counter(items)
print(counts)
print(counts.most_common(2))
```

---

## ⚠️ Gotchas & Pro Tips

1. **Set output order is arbitrary** — `sorted(duplicates)` makes results deterministic when order does not matter. When it does, collect duplicates in a list or iterate a dict instead.
2. **Values must be hashable for sets and dict keys** — Integers, strings, and tuples work; lists and dicts do not. Convert unhashable items (for example, `tuple(row)`) before using them as keys.
3. **Choose the right definition of 'duplicate'** — Case-sensitive comparison treats `'Ada'` and `'ada'` as different. Normalize with `.lower()` if the domain requires case-insensitive matching.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
