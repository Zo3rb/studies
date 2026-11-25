# 📖 Lesson: Set and Dictionary Comprehension

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0127. Set and Dictionary Comprehension.mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

Comprehensions are not limited to lists. How to build sets with braces around an expression and dictionaries with a `key: value` pair. What happens with duplicate values or keys, and how these forms compare with `set()` and `dict()` calls.

---

## 📝 Key Concepts

### 1. Set Comprehensions

Using braces with an expression instead of a key-value pair builds a set, automatically discarding duplicates.

```python
words = ['apple', 'pear', 'apple']
initials = {word[0] for word in words}
print(initials)  # {'a', 'p'}
```

---

### 2. Dictionary Comprehensions

A `key: value` expression inside braces builds a dict. This is ideal for lookup tables derived from another iterable.

```python
names = ['Ana', 'Ben', 'Cy']
lengths = {name: len(name) for name in names}
print(lengths)  # {'Ana': 3, 'Ben': 3, 'Cy': 2}
```

---

### 3. Duplicate Keys and Filtering

If two items produce the same key, the later value wins. An `if` clause can filter entries just as in a list comprehension.

```python
pairs = [('a', 1), ('a', 9), ('b', 2)]
print({k: v for k, v in pairs})  # {'a': 9, 'b': 2}
print({k: v for k, v in pairs if v > 1})  # {'a': 9, 'b': 2}
```

---

## ⚠️ Gotchas & Pro Tips

1. **`{}` is an empty dict, not an empty set** — Use `set()` for an empty set; braces with no contents create a dictionary.
2. **Dict order follows insertion** — Modern Python preserves insertion order, so output is predictable, but do not use a dict purely as an ordered list.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
