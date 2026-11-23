# 📖 Lesson: Dictionaries

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/03-Python Basics/0042. Dictionaries.mp4`  
> **Module:** 03 — Python Basics

---

## 🎯 What This Lesson Covers

Dictionaries store key-value pairs in curly braces and retrieve values by key instead of position.
The lesson creates dictionaries with literals and `dict()`, accesses values with square brackets, and adds new pairs by assignment.
It also shows that values can be lists or other dictionaries, making nested data natural.
Python 3.7+ guarantees insertion order, even though dictionaries are not positional collections.

---

## 📝 Key Concepts

### 1. Creating Dictionaries

A literal uses `{"key": value, ...}`. `dict()` accepts keyword arguments or an iterable of key-value pairs.
Keys must be unique and hashable; duplicate literal keys keep the last value.

```python
user = {"name": "Andrei", "age": 36}
via_kwargs = dict(name="Andrei", age=36)
via_pairs = dict([("name", "Andrei"), ("age", 36)])
print(user == via_kwargs == via_pairs)
```

---

### 2. Accessing and Updating

`user["name"]` reads a value; assigning to a missing key creates it. Reading a missing key with `[]` raises `KeyError`.
`len(user)` counts pairs.

```python
user = {"name": "Andrei"}
print(user["name"])
user["age"] = 36
user["name"] = "Andrei Neagoie"
print(user, len(user))
try:
    print(user["email"])
except KeyError as error:
    print("KeyError:", error)
```

---

### 3. Nested Values

A dictionary value can be any object, including a list or another dictionary.
Chain the lookups: `user['address']['city']` or `user['skills'][0]`.

```python
user = {
    "name": "Andrei",
    "skills": ["Python", "JS"],
    "address": {"city": "Toronto"},
}
print(user["skills"][0])
print(user["address"]["city"])
```

---

## ⚠️ Gotchas & Pro Tips

1. **`{}` is a dict** — Use `set()` for an empty set; `{}` creates an empty dictionary.
2. **Order is not lookup semantics** — Python 3.7+ preserves insertion order, but you still retrieve values by key, not index.
3. **Missing keys raise** — `user['missing']` raises `KeyError`; `user.get('missing')` is the safe alternative covered later.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
