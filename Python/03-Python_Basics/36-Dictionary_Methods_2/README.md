# 📖 Lesson: Dictionary Methods 2

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0046. Dictionary Methods 2.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson rounds out the dictionary API.
You test key membership with `in` and iterate over `keys()`, `values()`, and `items()`.
Removal tools include `pop()`, `popitem()`, `clear()`, and `del`.
Finally, `copy()` and `update()` let you duplicate and merge dictionaries.

---

## 📝 Key Concepts

### 1. Membership and Views

`key in data` checks keys only, not values. `keys()`, `values()`, and `items()` return dynamic views that reflect later dictionary changes.
`items()` yields `(key, value)` tuples, ideal for loops.

```python
user = {"name": "Andrei", "age": 36}
print("name" in user, "Andrei" in user)
print("keys:", list(user.keys()))
print("values:", list(user.values()))
for key, value in user.items():
    print(key, "=", value)
```

---

### 2. Removing Items

`pop(key[, default])` removes and returns a value; `popitem()` removes the most recently inserted pair in Python 3.7+.
`clear()` empties the dictionary and `del data[key]` is the statement form of removal.

```python
data = {"a": 1, "b": 2, "c": 3}
print("pop('a'):", data.pop("a"))
print("pop missing:", data.pop("z", "default"))
print("popitem:", data.popitem())
del data["b"]
print("after del:", data)
data.clear()
print("cleared:", data)
```

---

### 3. Copy and Update

`data.copy()` is a shallow copy. `update()` merges another dictionary, an iterable of pairs, or keyword arguments, overwriting matching keys.

```python
original = {"a": 1, "nested": [2]}
copy = original.copy()
copy["a"] = 99
copy["nested"].append(3)
print("original:", original)
print("copy:", copy)
target = {"a": 1}
target.update({"b": 2}, a=10)
print("updated:", target)
```

---

## ⚠️ Gotchas & Pro Tips

1. **`in` checks keys** — Use `"x" in data.values()` to search values, though a set or index is better for frequent checks.
2. **`popitem()` is LIFO in modern Python** — Since 3.7 it removes the last inserted item; older versions picked an arbitrary pair.
3. **`update()` overwrites** — Existing keys keep their position but receive the new value.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
