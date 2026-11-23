# 📖 Lesson: Dictionary Methods

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0045. Dictionary Methods.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

This lesson focuses on safe dictionary access.
`get()` returns `None` or a supplied default instead of raising `KeyError` for a missing key.
You compare dictionary literals with `dict()` construction and see how defaults behave.
`setdefault()` is introduced as a way to insert a default value when a key is absent.

---

## 📝 Key Concepts

### 1. Safe Access with `get()`

`data.get(key)` returns the value or `None`. `data.get(key, default)` returns `default` when the key is missing.
Unlike `[]` access, `get()` never raises `KeyError`.

```python
user = {"name": "Andrei"}
print(user.get("name"))
print(user.get("age"))
print(user.get("age", 0))
print(user["name"])
```

---

### 2. Constructing Dictionaries

Literals are concise for fixed data. `dict()` is handy for keyword arguments or pairs produced by another function.

| Form | Example | Result |
| :--- | :--- | :--- |
| Literal | `{"a": 1}` | `{'a': 1}` |
| Keywords | `dict(a=1)` | `{'a': 1}` |
| Pairs | `dict([("a", 1)])` | `{'a': 1}` |
| `fromkeys` | `dict.fromkeys(["a", "b"], 0)` | `{'a': 0, 'b': 0}` |

```python
print(dict(a=1, b=2))
print(dict([("a", 1), ("b", 2)]))
print(dict.fromkeys(["a", "b"], 0))
```

---

### 3. `setdefault()`

`data.setdefault(key, default)` returns the existing value, or inserts `default` and returns it when the key is missing.
Remember that the default expression is evaluated before the call, even when the key exists.

```python
counts = {}
for word in ["a", "b", "a"]:
    counts.setdefault(word, 0)
    counts[word] += 1
print(counts)
user = {"age": 36}
print(user.setdefault("age", 0))
print(user)
```

---

## ⚠️ Gotchas & Pro Tips

1. **`get()` does not insert** — It only reads; use assignment or `setdefault()` if you want the key added.
2. **Mutable defaults are shared** — `dict.fromkeys([...], [])` gives every key the same list; use a comprehension for independent lists.
3. **Keyword keys must be identifiers** — `dict(first-name='x')` is invalid syntax; use a literal for unusual key names.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
