# 📖 Lesson: zip()

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0122. zip().mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

How `zip()` pairs elements from several iterables into tuples, why it stops at the shortest input, and how the star operator can undo a zip. The `strict` option for catching unexpected length mismatches.

---

## 📝 Key Concepts

### 1. Pairing Iterables

`zip` yields tuples whose i-th element comes from the i-th position of each input iterable. It is the standard way to walk two sequences in parallel.

```python
names = ['Ana', 'Ben', 'Cy']
scores = [88, 92, 75]
for name, score in zip(names, scores):
    print(name, score)
```

---

### 2. Stops at the Shortest

`zip` ends when any iterable is exhausted, so extra items in longer inputs are silently ignored. Python 3.10 and later offer `strict=True` to raise an error instead.

```python
print(list(zip([1, 2, 3], ['a', 'b'])))  # [(1, 'a'), (2, 'b')]

# list(zip([1, 2, 3], ['a', 'b'], strict=True))  # ValueError
```

---

### 3. Unzipping with `*`

Passing a zipped result to `zip` with the star operator transposes it back into separate tuples.

```python
pairs = [('a', 1), ('b', 2)]
letters, numbers = zip(*pairs)
print(letters, numbers)  # ('a', 'b') (1, 2)
```

---

## ⚠️ Gotchas & Pro Tips

1. **zip is lazy** — Convert the result to a `list` if you need to inspect the pairs more than once.
2. **Use strict=True when lengths must match** — It turns silent truncation into an explicit `ValueError`, which is safer when processing data.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
