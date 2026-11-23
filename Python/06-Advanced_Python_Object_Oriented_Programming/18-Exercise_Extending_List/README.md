# 📖 Lesson: Exercise - Extending List

> **Course Video:** `~/Videos/video_courses/Complete_Python_Developer/06-Advanced Python - Object Oriented Programming/0114. Exercise - Extending List.mp4`  
> **Module:** 06 — Advanced Python: Object-Oriented Programming

---

## 🎯 What This Lesson Covers

A hands-on exercise: extend the built-in `list` to create a specialized collection. Overriding `append` to validate or normalize input while delegating real storage to `super().append()`. Considering other mutation paths (`extend`, `__setitem__`, slicing) and adding a helpful representation.

---

## 📝 Key Concepts

### 1. Subclassing `list`

A class can inherit from `list` and inherit all its methods. Override only the behavior you need to customize; everything else keeps working because the inherited C implementation handles storage.

```python
class UpperList(list):
    def append(self, item):
        super().append(item.upper())

u = UpperList()
u.append("hello")
print(u)  # ['HELLO']
```

---

### 2. Delegating to `super()`

Inside the override, `super().append(...)` performs the real insertion. This is safer than reimplementing list internals and keeps the subclass compatible with list's growth strategy and other inherited behavior.

```python
class PositiveNumbers(list):
    def append(self, value):
        if value <= 0:
            raise ValueError("must be positive")
        super().append(value)
```

---

### 3. Other Mutation Paths

Overriding `append` alone does not catch `extend`, `insert`, `__setitem__` or slice assignment, because built-in list methods do not call the Python-level `append`. Cover the entry points your class actually supports or prefer composition when you cannot control them all.

```python
class UpperList(list):
    def extend(self, items):
        for item in items:
            self.append(item)  # route through our validation
```

---

## ⚠️ Gotchas & Pro Tips

1. **`extend` does not call your `append`** — Built-in list methods are implemented in C and bypass Python overrides; explicitly override each path you care about.
2. **Subclassing is a strong commitment** — Users can always call `list.append(obj, value)` to bypass your logic; use composition when invariants must be airtight.

---

## 💡 Notes

<!-- Add your own notes, observations, and questions here -->
