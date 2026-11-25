# 📖 Lesson: Exercise - Comprehensions

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/07-Advanced Python - Functional Programming/0128. Exercise - Comprehensions.mp4`  
> **Module:** 07 — Advanced Python: Functional Programming

---

## 🎯 What This Lesson Covers

Practice converting imperative loops into comprehensions: transforming and filtering data, building dictionaries and sets, and choosing among list, set, dict, and generator forms. Includes guidance on recognizing when a loop is more readable.

---

## 📝 Key Concepts

### 1. Rewriting map and filter

A comprehension can replace a `map` plus `filter` chain, often with less syntactic noise and no explicit lambda.

```python
numbers = range(10)
old = list(map(lambda n: n * 2, filter(lambda n: n % 2 == 0, numbers)))
new = [n * 2 for n in numbers if n % 2 == 0]
print(old == new)  # True
```

---

### 2. Building Lookup Tables

Dictionary comprehensions turn a sequence into an index by a unique key, a common exercise and a frequent real-world task.

```python
users = [{'id': 1, 'name': 'Ana'}, {'id': 2, 'name': 'Ben'}]
by_id = {user['id']: user['name'] for user in users}
print(by_id)  # {1: 'Ana', 2: 'Ben'}
```

---

### 3. Knowing When to Stop

Deeply nested comprehensions or ones performing side effects are hard to read; an explicit loop with a descriptive name is often the better answer.

```python
# Clearer as a loop than as a three-clause comprehension
result = []
for row in [[1, 2], [3, 4]]:
    for value in row:
        if value % 2 == 0:
            result.append(value)
print(result)  # [2, 4]
```

---

## ⚠️ Gotchas & Pro Tips

1. **No side effects inside comprehensions** — Calling `print` or mutating state in the expression is surprising; comprehensions should produce values.
2. **Name the transformation** — If the expression is complex, compute it in a helper function so the comprehension stays readable.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
