# 📖 Lesson: Dunder Methods

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0113. Dunder Methods.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

Special (dunder) methods that let custom objects participate in Python's built-in syntax: representation with `__str__`/`__repr__`, length with `__len__`, indexing with `__getitem__`, iteration with `__iter__`, equality with `__eq__`, membership with `__contains__`, and calling with `__call__`.

---

## 📝 Key Concepts

### 1. Representation: `__str__` and `__repr__`

`str(obj)` calls `__str__` for a user-friendly string; `repr(obj)` calls `__repr__` for an unambiguous developer representation. `print` and f-strings use `__str__`, falling back to `__repr__` when it is missing.

```python
class Point:
    def __init__(self, x, y):
        self.x, self.y = x, y

    def __repr__(self):
        return f"Point({self.x}, {self.y})"

    def __str__(self):
        return f"({self.x}, {self.y})"
```

---

### 2. Container Protocol Methods

Defining `__len__` makes `len(obj)` work; `__getitem__` enables indexing and slicing; `__contains__` powers the `in` operator. Together these let a custom class feel like a built-in collection.

```python
class Bag:
    def __init__(self, items):
        self.items = list(items)

    def __len__(self):
        return len(self.items)

    def __getitem__(self, index):
        return self.items[index]

    def __contains__(self, item):
        return item in self.items
```

---

### 3. Iteration, Equality and `__call__`

`__iter__` returns an iterator for `for` loops, `__eq__` defines `==`, and `__call__` lets instances be invoked like functions. Each hook is invoked implicitly by Python syntax.

```python
class Counter:
    def __init__(self, start=0):
        self.value = start

    def __iter__(self):
        return iter(range(self.value))

    def __eq__(self, other):
        return self.value == other.value

    def __call__(self, step=1):
        self.value += step
        return self.value
```

---

## ⚠️ Gotchas & Pro Tips

1. **`__repr__` should be unambiguous** — Ideally it looks like valid Python that could recreate the object; `__str__` is the place for friendly text.
2. **Defining `__eq__` removes hashing** — Python sets `__hash__ = None` unless you explicitly define `__hash__`, so such objects cannot be dictionary keys.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
