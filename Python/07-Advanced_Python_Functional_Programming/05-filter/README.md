# 📖 Lesson: filter()

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0121. filter().mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

How `filter(predicate, iterable)` keeps only items for which the predicate returns a truthy value. The lazy iterator it returns, the special case of `filter(None, ...)`, and when a comprehension communicates intent better.

---

## 📝 Key Concepts

### 1. Keeping Items That Pass a Test

`filter` calls a predicate on each element and yields the elements for which it returns truthy. Like `map`, it is lazy.

```python
def is_even(n):
    return n % 2 == 0

print(list(filter(is_even, [1, 2, 3, 4, 5])))  # [2, 4]
```

---

### 2. Truthiness and `None`

The predicate does not have to return a bool: any truthy value keeps the item. Passing `None` keeps every truthy element.

```python
values = [0, 1, '', 'hi', None, []]
print(list(filter(None, values)))  # [1, 'hi']
```

---

### 3. Combining map and filter

The two iterators compose naturally: filter first to reduce the data, then map to transform what remains.

```python
numbers = range(10)
evens = filter(lambda n: n % 2 == 0, numbers)
print(list(map(lambda n: n * n, evens)))  # [0, 4, 16, 36, 64]
```

---

## ⚠️ Gotchas & Pro Tips

1. **A filter result is a one-shot iterator** — Once consumed, it is empty; call `filter` again if you need a second pass.
2. **Watch out for truthiness traps** — The number `0` and empty containers are falsy, so `filter(None, ...)` drops them even when they are valid data.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
